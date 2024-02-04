package action.seller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.seller.FoodCategoryDao;
import dao.seller.SellerDao;
import vo.seller.FoodCategoryVo;
import vo.seller.SellerVo;

/**
 * Servlet implementation class SellerPageAction
 */
@WebServlet("/seller/seller_page.do")
public class SellerPageAction extends HttpServlet {
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
		//System.out.println(user_idx);
		
		List<SellerVo> seller_list = SellerDao.getInstance().selectList(user_idx);
		
		//카테고리 목록 가져오기
		List<FoodCategoryVo> food_category_list = FoodCategoryDao.getInstance().selectList();
		
//		List<SellerVo> seller_list = SellerDao.getInstance().selectList(); 
						
		//request binding (연결 - menu_reg_form.jsp와 연결 - request에 정보를 넣어서 jsp 호출)
		request.setAttribute("food_category_list", food_category_list);
		request.setAttribute("seller_list", seller_list);

		//출력부분을 jsp에게 forward(Dispatch)시킴
		String forward_page = "seller_page.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}

}

