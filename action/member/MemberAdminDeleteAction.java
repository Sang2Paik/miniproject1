package action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member.MemberDao;

/**
 * Servlet implementation class MemberDeleteAction
 */
@WebServlet("/member/user_delete.do")
public class MemberAdminDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");

		// /member/delete.do?user_idx=4
		System.out.println("member");
		//1.삭제할 mem_idx 받는다
		int mem_idx = Integer.parseInt(request.getParameter("user_idx"));
		
		//2.DB delete : DML(insert/update/delete)처리후 결과행수반환(res)
		int res = MemberDao.getInstance().delete(mem_idx);
		if(res==1) {
			//성공
		}else {
			//실패
		}
		
		//3.목록보기				// 현재위치 member
		response.sendRedirect("../admin/admin_page.do");	
		

	}

}