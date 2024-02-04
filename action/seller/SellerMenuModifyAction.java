package action.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.seller.MenuDao;
import vo.seller.MenuVo;

/**
 * Servlet implementation class SellerMenuModifyAction
 */
@WebServlet("/seller/menu_modify.do")
public class SellerMenuModifyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		// /seller/menu_modify.do?menu_name=치킨&menu_category=식사류....

		//1.parameter받기
		int menu_idx				 = Integer.parseInt(request.getParameter("menu_idx"));
		int seller_idx				 = Integer.parseInt(request.getParameter("seller_idx"));
		
		String menu_name 			 = request.getParameter("menu_name");
		//      															"1/식사류"
		String [] category 			 = request.getParameter("menu_category").split("/");;
		int menu_category_idx	     = Integer.parseInt(category[0]);		
		String menu_category_name    = category[1];
		int menu_price 				 = Integer.parseInt(request.getParameter("menu_price"));
		String menu_status 			 = request.getParameter("menu_status");
		String menu_detail 			 = request.getParameter("menu_detail").replaceAll("\n", "<br>");
		
		//2.IP 구하기 (ip는 parameter 아님)
		String menu_photo_ip = request.getRemoteAddr();
		
		//3.VO포장
		MenuVo vo = new MenuVo();
		vo.setMenu_idx(menu_idx);
		vo.setMenu_name(menu_name);
		vo.setMenu_category_idx(menu_category_idx);
		vo.setMenu_category_name(menu_category_name);
		vo.setMenu_price(menu_price);
		vo.setMenu_status(menu_status);
		vo.setMenu_photo_ip(menu_photo_ip);
		vo.setMenu_detail(menu_detail);

		
		//4.DB update : update menu set menu_idx=?, seller_idx...,  , , menu_modifed_date=now()  where menu_idx=?;
		int res = MenuDao.getInstance().menu_modify(vo);
		
		//5.목록보기
		response.sendRedirect("seller_menu_view.do?seller_idx=" + seller_idx); 
	}

}

