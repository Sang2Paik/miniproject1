package action.seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.seller.SellerDao;
import vo.seller.SellerVo;

/**
 * Servlet implementation class SellerCheckIdAction
 */
@WebServlet("/seller/check_id.do")
public class SellerCheckIdAction_삭제예정 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");

		String seller_name = request.getParameter("seller_name");
		SellerVo vo = SellerDao.getInstance().selectOne(seller_name);
		boolean result;
		
		if(vo==null) 
			result = true; //아이디가 없다는 뜻
		else
			result = false;
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(json.toString());
	}

}
