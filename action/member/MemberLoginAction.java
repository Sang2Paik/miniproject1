package action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.member.MemberDao;
import vo.member.MemberVo;

/**
 * Servlet implementation class MemberLoginAction
 */
@WebServlet("/member/login.do")
public class MemberLoginAction extends HttpServlet {
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
		String user_pwd = request.getParameter("user_pwd");
		
		//MemberVo만들어야함
		MemberVo user = MemberDao.getInstance().selectOne(user_id);
		
		//아이디가 틀린경우
		if(user == null) {
			response.sendRedirect("loginform.do?reason=fail_id");
			return;
		}
		//비밀번호가 틀린경우
		
		if(user.getUser_pwd().equals(user_pwd) == false) {
			response.sendRedirect("loginform.do?reason=fail_pwd&user_id="+user_id);
			return;
		}
				
		//세션정보 얻어오기 
		HttpSession session = request.getSession();
		
		//session의 setattribute
		session.setAttribute("user", user);
		
		//메인페이지로 이동 
		response.sendRedirect("../main.do");

	}

}

