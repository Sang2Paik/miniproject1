package action.seller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.seller.MenuCategoryDao;
import dao.seller.MenuDao;
import dao.seller.SellerDao;
import vo.seller.MenuCategoryVo;
import vo.seller.MenuVo;
import vo.seller.SellerVo;

/**
 * Servlet implementation class StoreMenuRegisterFormAction
 */
@WebServlet("/seller/menu_reg_form.do")
public class SellerMenuRegFormAction extends HttpServlet {
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
		
		List<MenuVo> menu_vo = MenuDao.getInstance().selectList(seller_idx);
		
		//카테고리 목록 가져오기
		List<MenuCategoryVo> menu_category_list = MenuCategoryDao.getInstance().selectList();
						
		//request binding (연결 - menu_reg_form.jsp와 연결 - request에 정보를 넣어서 jsp 호출)
		request.setAttribute("menu_category_list", menu_category_list);
		request.setAttribute("seller_vo", seller_vo);
//		request.setAttribute("menu_vo", menu_vo);
		
		//출력부분을 jsp에게 forward(Dispatch)시킴
		String forward_page = "seller_menu_reg_form.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}

}
