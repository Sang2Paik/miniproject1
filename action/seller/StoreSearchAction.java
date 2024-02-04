package action.seller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import utils.seller.StoreSearchUtils;
import vo.seller.StoreVo;

/**
 * Servlet implementation class StoreSearchAction
 */
@WebServlet("/seller/search.do")
public class StoreSearchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");

		String indsMclsCode = request.getParameter("indsMclsCode");
		double cx = Double.parseDouble(request.getParameter("cx")); 
		double cy = Double.parseDouble(request.getParameter("cy"));
		
		List<StoreVo> list = StoreSearchUtils.search_store_json(cx, cy, indsMclsCode);
		
		JSONArray  array = new JSONArray(list);
		
		response.setContentType("text/json;charset=utf-8;");
		
		response.getWriter().print(array.toString());

	}

}

