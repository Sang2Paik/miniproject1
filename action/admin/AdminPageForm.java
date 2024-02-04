package action.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.coupon.CouponDao;
import dao.member.MemberDao;
import vo.coupon.CouponVo;
import vo.member.MemberVo;

/**
 * Servlet implementation class AdminPageList
 */
@WebServlet("/admin/admin_page.do")
public class AdminPageForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		List<MemberVo> user_list = MemberDao.getInstance().selectList();
		
		List<CouponVo> coupon_list = CouponDao.getInstance().selectList();
		
		request.setAttribute("user_list", user_list);
		
		request.setAttribute("coupon_list", coupon_list);
		
		
		//출력부분을 jsp에게 Dispatcher(forward)시킨다
		String forward_page = "admin_page.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
