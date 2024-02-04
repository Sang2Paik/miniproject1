package action.seller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.seller.MenuDao;
import vo.seller.MenuVo;

/**
 * Servlet implementation class StoreMenuRegAction
 */
@WebServlet("/seller/menu_reg.do")
public class SellerMenuRegAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		//request.setCharacterEncoding("utf-8");
		
		//상대경로 -> 절대경로 구하기
		ServletContext application = request.getServletContext();  //application : 전역관리객체
		
		String webPath = "/upload/";  //웹경로 (상대경로, 프로젝트 기준)
//      "c:\\work";  //저장위치 (절대경로) 
		String saveDir = application.getRealPath(webPath);
		
		int maxSize = 1024*1024*1000;  //업로드 최대크기 (byte)  (1024=1kb, 1024*1024*100=100mb)
		
		//업로드 처리 객체
		MultipartRequest mr = new MultipartRequest(request,   //처리 위임
				                                   saveDir,    //저장 위치 (절대경로)
				                                   maxSize,    //업로드 최대크기 
				                                   "utf-8",    //수신encoding
				                                   new DefaultFileRenamePolicy()
				                                   ); //동일 파일인 경우 이름을 변경해서 저장

		//업로드된 파일명 얻어오기

		//방법2>
		String menu_photo = "no_file";
		//업로드 된 파일 정보 얻어오기
		File f = mr.getFile("menu_photo");  //menu_photo : 파라미터
		if(f !=null) {
			menu_photo = f.getName();
		}

		//파일과 같이 넘어온 파라미터(title) 받기 (파일 업로드 시 파라미터는 mr로 수신)
		int seller_idx 			  = Integer.parseInt(mr.getParameter("seller_idx"));
		String menu_name 		  = mr.getParameter("menu_name");
		//                         										 "1/식사류"
		String [] category 		  = mr.getParameter("menu_category").split("/");
		int menu_category_idx	  = Integer.parseInt(category[0]);		
		String menu_category_name = category[1];
		int menu_price 			  = Integer.parseInt(mr.getParameter("menu_price"));
		//String menu_status		  = mr.getParameter("menu_status");
		String menu_detail 		  = mr.getParameter("menu_detail").replaceAll("\n","<br>");

		
		//IP 받기
		String menu_photo_ip = request.getRemoteAddr();

		//포장
		MenuVo vo = new MenuVo(seller_idx, menu_name, menu_category_idx, menu_category_name, menu_photo, menu_price, menu_photo_ip, menu_detail);
		
		//4.DB Insert
		int res = MenuDao.getInstance().menu_register(vo);
		
		//목록보기
		response.sendRedirect("seller_menu_view.do?seller_idx=" + seller_idx);
	}

}

