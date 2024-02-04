package action.seller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.seller.MenuDao;
import vo.seller.MenuVo;

/**
 * Servlet implementation class SellerMenuDeleteAction
 */
@WebServlet("/seller/menu_delete.do")
public class SellerMenuDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		// menu/delete.do?p_idx=5
		
		//1.삭제할 parameter(menu_idx) 받기
		int menu_idx = Integer.parseInt(request.getParameter("menu_idx"));
		int seller_idx = Integer.parseInt(request.getParameter("seller_idx"));
		
		//2.p_idx 해당 photoVo 얻기 (삭제할 파일명이 여기서 나오므로)
		MenuVo vo = MenuDao.getInstance().selectOne(menu_idx);
		
		//3. 삭제 파일 정보 얻어오기 -> 삭제처리
		//절대경로 구해서
		//상대경로 -> 절대경로 구하기
		String absPath = request.getServletContext().getRealPath("/upload/");
		
		//삭제처리  -> 서버내 저장된 것 모두 삭제
		File f = new File(absPath, vo.getMenu_photo());

		f.delete();
		
		//4.DB delete
		int res = MenuDao.getInstance().delete(menu_idx);
		if(res==1) {
			//성공
		}else {
			//실패
		}

		//5.목록보기
		response.sendRedirect("seller_menu_view.do?seller_idx="+seller_idx);
		//seller_idx 못넘김 - 해결
		//원인 seller_idx를 같이 받아와야함
	}

}

