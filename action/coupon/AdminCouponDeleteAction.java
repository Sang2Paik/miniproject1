package action.coupon;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.coupon.CouponDao;

/**
 * Servlet implementation class AdminCouponDeleteAction
 */
@WebServlet("/admin/admin_coupon_delete_action.do") 
public class AdminCouponDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		System.out.println("AdminCouponDeleteAction");
		
		//삭제
		int coupon_idx = Integer.parseInt(request.getParameter("coupon_idx"));
		CouponDao.getInstance().delete(coupon_idx);
		
		response.sendRedirect("admin_page.do");

	}

}
