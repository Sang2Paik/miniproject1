package action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member.MemberDao;
import vo.member.MemberVo;

/**
 * Servlet implementation class AdminUserUpdateAction
 */
@WebServlet("/admin/admin_user_update.do")
public class AdminUserUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		System.out.println("AdminUserUpdateAction");
		
		String user_name	  = request.getParameter("user_name");
		String user_id		  = request.getParameter("user_id");
		String user_pwd		  = request.getParameter("user_pwd");
		String user_cellphone = request.getParameter("user_cellphone");
		String user_email	  = request.getParameter("user_email");
		String user_addr	  = request.getParameter("user_addr");
		String user_grade	  = request.getParameter("user_grade");
		int user_idx		  = Integer.parseInt(request.getParameter("user_idx"));
		
		
		MemberVo vo = new MemberVo();
		vo.setUser_name(user_name);
		vo.setUser_id(user_id);
		vo.setUser_pwd(user_pwd);
		vo.setUser_cellphone(user_cellphone);
		vo.setUser_email(user_email);
		vo.setUser_addr(user_addr);
		vo.setUser_grade(user_grade);
		vo.setUser_idx(user_idx);
		
		MemberDao.getInstance().update(vo);
		
		response.sendRedirect("admin_page.do");

	}

}
