package action.seller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.seller.SellerDao;
import vo.seller.SellerVo;

/**
 * Servlet implementation class SellerPhotoUploadAction
 */
@WebServlet("/seller/seller_photo_upload.do")
public class SellerPhotoUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		//request.setCharacterEncoding("utf-8");

		// /seller/seller_photo_upload.do?seller_idx=3&seller_photo=a.jpg
		
		ServletContext application = request.getServletContext();
		
		String webPath = "/upload/";         //웹경로(상대적경로) 
		//                                      저장위치(절대경로)
		String saveDir = application.getRealPath(webPath);
		
		int    maxSize    = 1024*1024*100;   //업로드(최대)크기(byte)
				
		MultipartRequest  mr = new MultipartRequest(request,//처리위임 
				                                    saveDir,//저장위치(절대경로) 
				                                    maxSize,//업로드크기
				                                    "utf-8",//수신인코딩 
				                                    //동일화일인경우 이름을 변경해서 저장
				                                    new DefaultFileRenamePolicy()
				                                    );
		//업로드된 화일명 얻어온다
		String seller_photo="no_file";
		//업로드된 화일정보 얻어온다 (parameter(photo)로 받음)
		File f = mr.getFile("seller_photo");
		if(f != null) {
			seller_photo = f.getName();
		}
		
		//parameter(menu_idx) 받기 
		int seller_idx = Integer.parseInt(mr.getParameter("seller_idx"));
		
		SellerVo vo = SellerDao.getInstance().selectOne(seller_idx);
		
		//기존파일 삭제 (새파일은 위에서 올라옴)
		File oldFile = new File (saveDir, vo.getSeller_photo());
		oldFile.delete();
		
		// DB menu_photo update
		// update menu_photo set menu_photo=? where menu_idx=?
		vo.setSeller_photo(seller_photo);  //old -> new filename
		
		int res = SellerDao.getInstance().update_seller_photo(vo);
				
		//결과 전송(json)
		JSONObject json = new JSONObject();
		json.put("seller_photo", seller_photo);
		
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json.toString());
	}

}
