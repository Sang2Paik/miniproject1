package action.admin;

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
 * Servlet implementation class MemberUpdateFormAction
 */
@WebServlet("/admin/user_update_form.do")
public class MemberUpdateFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		System.out.println("MemberUpdateDetailsForm");
		
		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		
		MemberVo user = MemberDao.getInstance().selectOne(user_idx);
		
		String user_order_addr = user.getUser_addr();
		if (user_order_addr != null) {
			user_order_addr = user_order_addr.replaceAll("<br>", "\n");
            user.setUser_order_addr(user_order_addr);
            user_order_addr = user_order_addr.replaceAll("<&nbsp>", " ");
            user.setUser_order_addr(user_order_addr);
        }
		
		String user_addr = user.getUser_addr();
		if (user_addr != null) {
			user_addr = user_addr.replaceAll("<br>", "\n");
            user.setUser_addr(user_addr);
            user_addr = user_addr.replaceAll("<&nbsp>", " ");
            user.setUser_addr(user_addr);
        }
		
		request.setAttribute("user", user);
		//출력부분을 jsp에게 Dispatcher(forward)시킨다
		//                     현재위치 /member
		String forward_page = "user_update_form.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}