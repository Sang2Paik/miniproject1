package action.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.coupon.CouponDao;
import vo.coupon.CouponVo;

/**
 * Servlet implementation class MemberMyPageAction
 */
@WebServlet("/member/mypage.do")
public class MemberMyPageAction extends HttpServlet {
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
		
		List<CouponVo> list = CouponDao.getInstance().selectCoupon(user_idx);
		
		request.setAttribute("list", list);

		//출력부분을 jsp에게 Dispatcher(forward)시킨다.
		String forward_page = "mypage.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward_page);
		dispatcher.forward(request, response);

	}

}

