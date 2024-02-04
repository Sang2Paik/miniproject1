package action.coupon;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.coupon.CouponDao;
import vo.coupon.CouponVo;

/**
 * Servlet implementation class AdminCouponInsert
 */
@WebServlet("/admin/admin_coupon_insert_form.do")
public class AdminCouponInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        // 수신인코딩 설정
        request.setCharacterEncoding("utf-8");

        System.out.println("AdminCouponInsert");
        
        String coupon_name 			= request.getParameter("coupon_name");
        String coupon_content 		= request.getParameter("coupon_content");
        int deducted_price 			= Integer.parseInt(request.getParameter("deducted_price"));
        int coupon_min_order_price 	= Integer.parseInt(request.getParameter("coupon_min_order_price"));
        String coupon_expired_date 	= request.getParameter("coupon_expired_date");
        
        // insert진행
        CouponVo list = new CouponVo(deducted_price, coupon_min_order_price, coupon_name, coupon_content, coupon_expired_date);
        
        CouponDao.getInstance().insert(list);
        
        response.sendRedirect("admin_page.do");	
  		
  		
    }
}