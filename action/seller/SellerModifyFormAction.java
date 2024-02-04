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
 * Servlet implementation class SellerModifyFormAction
 */
@WebServlet("/seller/seller_modify_form.do")
public class SellerModifyFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		int seller_idx = Integer.parseInt(request.getParameter("seller_idx"));
		
		SellerVo seller_vo	= SellerDao.getInstance().selectOne(seller_idx);
		
		// <br> -> \n
		String seller_intro = seller_vo.getSeller_intro().replaceAll("<br>", "\n");
		seller_vo.setSeller_intro(seller_intro);
		
		//카테고리 목록 가져오기
		List<FoodCategoryVo> food_category_list = FoodCategoryDao.getInstance().selectList();

		request.setAttribute("seller_vo", seller_vo);
		request.setAttribute("food_category_list", food_category_list);
		
		//출력부분을 jsp에게 forward(Dispatch)시킴
		String forward_page = "seller_modify_form.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}

}

