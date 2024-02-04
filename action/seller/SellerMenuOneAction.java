package action.seller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.seller.MenuDao;
import vo.seller.MenuVo;

/**
 * Servlet implementation class SellerMenuOneAction
 */
@WebServlet("/seller/menu_one.do")
public class SellerMenuOneAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		// /seller/menu_one.do?menu_idx=1
		//1. 파라미터 받기
		int menu_idx = Integer.parseInt(request.getParameter("menu_idx"));
		
		//2.menu_idx에 해당되는 Vo 얻어오기
		MenuVo vo = MenuDao.getInstance().selectOne(menu_idx);
		
		//3.JSON 데이터 생성
		JSONObject json = new JSONObject();  //library 내에 있음
		json.put("menu_idx", vo.getMenu_idx());
		json.put("menu_name", vo.getMenu_name());
		json.put("seller_idx", vo.getSeller_idx());
		json.put("menu_category_name", vo.getMenu_category_name());
		json.put("menu_photo", vo.getMenu_photo());
		json.put("menu_price", vo.getMenu_price());
		json.put("menu_created_date", vo.getMenu_created_date());
		json.put("menu_modified_date", vo.getMenu_modified_date());
		json.put("menu_status", vo.getMenu_status());
		json.put("menu_rating_avg", vo.getMenu_rating_avg());
		json.put("menu_photo_ip", vo.getMenu_photo_ip());
		json.put("menu_detail", vo.getMenu_detail());

		//응답
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json.toString());
		
	}

}
