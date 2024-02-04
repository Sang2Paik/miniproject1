package action.seller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.seller.SellerDao;
import vo.seller.SellerVo;

/**
 * Servlet implementation class CouponListAction
 */
@WebServlet("/seller/seller_list.do")
public class SellerListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");

		List<SellerVo> list = SellerDao.getInstance().selectList();
		
		request.setAttribute("list", list);
		
		String forwardpath = "seller_store_list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardpath);
		dispatcher.forward(request, response);

	}

}

