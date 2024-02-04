package action.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.member.MemberDao;
import vo.member.MemberVo;

/**
 * Servlet implementation class AdminUserTableFormAction
 */
@WebServlet("/admin/admin_user_table_form.do")
public class AdminUserTableAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		System.out.println("AdminUserTableAction");

		String user_grade = request.getParameter("user_grade");

		if(user_grade.equals("user")){
			List<MemberVo> user_table = MemberDao.getInstance().selectList();
			
			request.setAttribute("user_table", user_table);
			
			//출력부분을 jsp에게 Dispatcher(forward)시킨다
			String forward_page = "admin_page.do";
			RequestDispatcher disp = request.getRequestDispatcher(forward_page);
			disp.forward(request, response);
		};
		
		List<MemberVo> user_table = MemberDao.getInstance().selectList(user_grade);
		
		request.setAttribute("user_table", user_table);
		
		//출력부분을 jsp에게 Dispatcher(forward)시킨다
		String forward_page = "admin_user_form_ajax.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
