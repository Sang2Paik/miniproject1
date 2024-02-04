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

import dao.seller.SellerDao;
import vo.seller.SellerVo;

/**
 * Servlet implementation class CouponInsertAction
 */
@WebServlet("/seller/seller_insert.do")
public class SellerInsertAction extends HttpServlet {
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
//		      				"c:\\work";  //저장위치 (절대경로) 
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
		String seller_photo = "no_file";
		//업로드 된 파일 정보 얻어오기
		File f = mr.getFile("seller_photo");  //seller_photo : 파라미터
		if(f !=null) {
			seller_photo = f.getName();
		}
		
		//파일과 같이 넘어온 파라미터 받기 (파일 업로드 시 파라미터는 mr로 수신)
		String seller_name = mr.getParameter("seller_name");
		String seller_addr = mr.getParameter("seller_addr");
		String seller_phone = mr.getParameter("seller_phone");
		String delivery_type = mr.getParameter("delivery_type");
		String seller_intro = mr.getParameter("seller_intro").replaceAll("\n", "<br>");
		int seller_min_order_price = Integer.parseInt(mr.getParameter("seller_min_order_price"));
		String seller_operation_hours = mr.getParameter("seller_operation_hours");
		String seller_close_days = mr.getParameter("seller_close_days");
		String seller_status = mr.getParameter("seller_status");
		
		String [] food_category = mr.getParameter("food_category").split("/");
		
		int food_category_idx = Integer.parseInt(food_category[0]);
		String food_category_name = food_category[1];
		int user_idx = Integer.parseInt(mr.getParameter("user_idx"));
		
		//user_idx 확인
		//System.out.println(user_idx);
		
		//IP 받기
		String seller_photo_ip = request.getRemoteAddr();
		
		SellerVo vo = new SellerVo(seller_name, seller_addr, seller_photo, seller_phone, delivery_type, seller_intro, seller_min_order_price, seller_operation_hours, seller_close_days, seller_status, food_category_idx, food_category_name, user_idx, seller_photo_ip);
		
		//DB insert
		int res = SellerDao.getInstance().insert(vo);
		
		response.sendRedirect("seller_page.do?user_idx=" + user_idx);
	
	}

}

