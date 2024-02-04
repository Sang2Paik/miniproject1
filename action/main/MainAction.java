package action.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.IPtoAddressUtil;
import vo.MyLocalVo;

/**
 * Servlet implementation class MainAction
 */
@WebServlet("/main.do")
public class MainAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");

		MyLocalVo vo = IPtoAddressUtil.getAddressFromIp("localhost");
		
		System.out.println("------------------------------");
		System.out.printf("lat : %f\n", vo.getLat());
		System.out.printf("lon : %f\n", vo.getLon());
		System.out.println("------------------------------");

		request.setAttribute("lat", vo.getLat());
		request.setAttribute("lon", vo.getLon());
		
		//출력부분을 jsp에게 Dispatcher(forward)시킨다.
		String forward_page = "index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward_page);
		dispatcher.forward(request, response);

	}

}
