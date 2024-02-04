package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member.MemberDao;
import vo.member.MemberVo;

/**
 * Servlet implementation class MemberModifyFormAction
 */
@WebServlet("/member/modify_form.do")
public class MemberModifyFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		MemberVo vo = MemberDao.getInstance().selectOne(user_idx);
		
		request.setAttribute("vo", vo);

		//출력부분을 jsp에게 Dispatcher(forward)시킨다.
		String forward_page = "modify_form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward_page);
		dispatcher.forward(request, response);

	}

}

