package action.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.member.MemberDao;
import vo.member.MemberVo;

/**
 * Servlet implementation class MemberInsertAction
 */
@WebServlet("/member/insert.do")
public class MemberInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		ServletContext application = request.getServletContext();
		String webPath = "/upload/";
		String saveDir = application.getRealPath(webPath);
		int maxSize = 1024*1024*100;
		
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		String user_proof ="no_file";
		File f = mr.getFile("user_proof");
		if(f != null) {
			user_proof = f.getName();
		}
		
		String user_grade = mr.getParameter("user_grade");
		String user_name = mr.getParameter("user_name");
		String user_id = mr.getParameter("user_id");
		String user_pwd = mr.getParameter("user_pwd");
		String user_cellphone = mr.getParameter("user_cellphone");
		String user_email = mr.getParameter("user_email");
		String user_addr = mr.getParameter("user_addr");
		String user_order_addr = mr.getParameter("user_order_addr");
		
		MemberVo vo = new MemberVo(user_name, user_id, user_pwd, user_cellphone, user_email, user_addr, user_order_addr, user_grade, user_proof);
				
		int res = MemberDao.getInstance().insert(vo);
		
		response.sendRedirect("../main.do");

	}

}

