package action.member;

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
 * Servlet implementation class MemberModifyAction
 */
@WebServlet("/member/modify.do")
public class MemberModifyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		int user_idx	= Integer.parseInt(request.getParameter("user_idx"));
		String user_name = request.getParameter("user_name");
		String user_id	=request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
		String user_cellphone = request.getParameter("user_cellphone");
		String user_email = request.getParameter("user_email");
		String user_addr = request.getParameter("user_addr");
		String user_order_addr = request.getParameter("user_order_addr");
		String user_grade = request.getParameter("user_grade");
		
		MemberVo vo = new MemberVo(user_idx, user_name, user_id, user_pwd, user_cellphone, user_email, user_addr, user_order_addr, user_grade);
		
		int res = MemberDao.getInstance().update_modify(vo);
		
		MemberVo user = (MemberVo) request.getSession().getAttribute("user");
		user.setUser_addr(user_addr);
		user.setUser_cellphone(user_cellphone);
		user.setUser_email(user_email);
		user.setUser_name(user_name);
		user.setUser_order_addr(user_order_addr);
		user.setUser_pwd(user_pwd);
		
//		System.out.println(request.getRequestedSessionId());
		request.getSession().setAttribute("user", user);
//		System.out.println(request.getRequestedSessionId());
		
		String forwardPath = "mypage.do";
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
		dispatcher.forward(request, response);
//		response.sendRedirect("mypage.do");

	}

}

