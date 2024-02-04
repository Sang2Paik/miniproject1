package action.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.seller.SellerDao;
import vo.seller.SellerVo;

/**
 * Servlet implementation class SellerModifyAction
 */
@WebServlet("/seller/seller_modify.do")
public class SellerModifyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		// /seller/seller_modify.do?seller_name=..&sfood_category_name=식사류....
		
		//1.parameter받기
		int seller_idx				 = Integer.parseInt(request.getParameter("seller_idx"));
		int user_idx				 = Integer.parseInt(request.getParameter("user_idx"));
		
		String seller_name 			 = request.getParameter("seller_name");
		//      															"1/식사류"
		String [] category 			 = request.getParameter("food_category").split("/");;
		int food_category_idx	     = Integer.parseInt(category[0]);		
		String food_category_name    = category[1];
		String seller_addr 			 = request.getParameter("seller_addr");
		String seller_phone 	     = request.getParameter("seller_phone");
		String delivery_type 	     = request.getParameter("delivery_type");
		String seller_intro 	     = request.getParameter("seller_intro").replaceAll("\n", "<br>");
		int seller_min_order_price 	  = Integer.parseInt(request.getParameter("seller_min_order_price"));
		String seller_operation_hours = request.getParameter("seller_operation_hours");
		String seller_close_days 	  = request.getParameter("seller_close_days");
		String seller_status 	  = request.getParameter("seller_status");

		//2.IP 구하기 (ip는 parameter 아님)
		String seller_photo_ip = request.getRemoteAddr();
		
		//3.VO포장
		SellerVo vo = new SellerVo();
		vo.setSeller_idx(seller_idx);
		vo.setUser_idx(user_idx);
		vo.setSeller_name(seller_name);
		vo.setFood_category_idx(food_category_idx);
		vo.setFood_category_name(food_category_name);
		vo.setSeller_addr(seller_addr);
		vo.setSeller_phone(seller_phone);
		vo.setDelivery_type(delivery_type);
		vo.setSeller_intro(seller_intro);
		vo.setSeller_min_order_price(seller_min_order_price);
		vo.setSeller_operation_hours(seller_operation_hours);
		vo.setSeller_close_days(seller_close_days);
		vo.setSeller_status(seller_status);
		vo.setSeller_photo_ip(seller_photo_ip);

		
		//4.DB update : update menu set menu_idx=?, seller_idx...,  , , menu_modifed_date=now()  where menu_idx=?;
		int res = SellerDao.getInstance().seller_update(vo);
		
		//5.목록보기
		response.sendRedirect("seller_detail.do?seller_idx=" + seller_idx); 
	}

}

