package action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member.MemberDao;
import vo.member.MemberVo;

/**
 * Servlet implementation class MemberOrderAddrChangeAction
 */
@WebServlet("/member/addr_change.do")
public class MemberOrderAddrChangeAction extends HttpServlet {
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
		String user_order_addr = request.getParameter("user_order_addr");
		
		MemberVo vo = new MemberVo();
		vo.setUser_idx(user_idx);
		vo.setUser_order_addr(user_order_addr);
		
		int res = MemberDao.getInstance().update(vo);
		
		//세션에 정보 얻어오기
		MemberVo user = (MemberVo) request.getSession().getAttribute("user");
		user.setUser_order_addr(user_order_addr);

		request.getSession().setAttribute("user", user);
		
		

	}

}

