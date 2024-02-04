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
 * Servlet implementation class AdminCouponUpdateAction
 */
@WebServlet("/admin/admin_coupon_update_action.do")
public class AdminCouponUpdateAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        // 수신인코딩 설정
        request.setCharacterEncoding("utf-8");
        
        System.out.println("AdminCouponUpdateAction");
        
        // 파라메터 받기
        int coupon_idx 			   = Integer.parseInt(request.getParameter("coupon_idx"));
        int deducted_price		   = Integer.parseInt(request.getParameter("deducted_price")); 
        int coupon_min_order_price = Integer.parseInt(request.getParameter("coupon_min_order_price"));
        int user_idx			   = Integer.parseInt(request.getParameter("user_idx"));
        String coupon_name 		   = request.getParameter("coupon_name");
        String coupon_content	   = request.getParameter("coupon_content"); 
        String coupon_expired_date = request.getParameter("coupon_expired_date");
        
        CouponVo vo = new CouponVo();
        vo.setCoupon_idx(coupon_idx);
        vo.setCoupon_name(coupon_name);
        vo.setCoupon_content(coupon_content);
        vo.setDeducted_price(deducted_price);
        vo.setCoupon_min_order_price(coupon_min_order_price);
        vo.setUser_idx(user_idx);
        vo.setCoupon_expired_date(coupon_expired_date);
        
        CouponDao.getInstance().update(vo);
        
        response.sendRedirect("admin_page.do");
  		
       
    }
}