package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.member.MemberDao;
import vo.member.MemberVo;

/**
 * Servlet implementation class MemberCheckIdAction
 */
@WebServlet("/root/member/check_id.do")
public class MemberCheckIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");

		String user_id = request.getParameter("user_id");
		MemberVo vo = MemberDao.getInstance().selectOne(user_id);
		boolean result;
		
		if(vo==null) 
			result = true; //아이디가 없다는 뜻
		else
			result = false;
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(json.toString());

	}

}

