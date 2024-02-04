package action.coupon;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.coupon.CouponDao;
import vo.coupon.CouponVo;

/**
 * Servlet implementation class AdminCouponFormAction
 */
@WebServlet("/admin/admin_coupon_form.do")
public class AdminCouponFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");

		System.out.println("AdminCouponFormAction");
		
		int coupon_idx = Integer.parseInt(request.getParameter("coupon_idx"));
		
		// 해당되는 idx가져와서 기존 값 띄우기
        CouponVo vo = CouponDao.getInstance().selectOne(coupon_idx);
        
        
        String coupon_content = vo.getCoupon_content();
        if (coupon_content != null) {
        	coupon_content = coupon_content.replaceAll("<br>", "\n");
            vo.setCoupon_content(coupon_content);
            coupon_content = coupon_content.replaceAll("<&nbsp>", " ");
            vo.setCoupon_content(coupon_content);
        }
        request.setAttribute("vo", vo);

		
		/*
		 * String forward_page = "admin_page.jsp"; RequestDispatcher disp =
		 * request.getRequestDispatcher(forward_page); disp.forward(request, response);
		 */
        
        
		//출력부분을 jsp에게 Dispatcher(forward)시킨다
		
		String forward_page = "admin_coupon_update_form.jsp"; 
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
		
		

	}

}