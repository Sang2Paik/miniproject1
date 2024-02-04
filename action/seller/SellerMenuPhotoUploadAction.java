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

import dao.seller.MenuDao;
import vo.seller.MenuVo;

/**
 * Servlet implementation class PhotoUploadAction
 */
@WebServlet("/seller/menu_photo_upload.do")
public class SellerMenuPhotoUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//수신인코딩 설정
		//request.setCharacterEncoding("utf-8");

		// /photo/photo_upload.do?p_idx=3&photo=a.jpg
		
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
		String menu_photo="no_file";
		//업로드된 화일정보 얻어온다 (parameter(photo)로 받음)
		File f = mr.getFile("menu_photo");
		if(f != null) {
			menu_photo = f.getName();
		}
		
		//parameter(menu_idx) 받기 
		int menu_idx = Integer.parseInt(mr.getParameter("menu_idx"));
		
		MenuVo vo = MenuDao.getInstance().selectOne(menu_idx);
		
		//기존파일 삭제 (새파일은 위에서 올라옴)
		File oldFile = new File (saveDir, vo.getMenu_photo());
		oldFile.delete();
		
		// DB menu_photo update
		// update menu_photo set menu_photo=? where menu_idx=?
		vo.setMenu_photo(menu_photo);  //old -> new filename
		
		int res = MenuDao.getInstance().update_menu_photo(vo);
				
		//결과 전송(json)
		JSONObject json = new JSONObject();
		json.put("menu_photo", menu_photo);
		
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json.toString());
		
		
	}

}
