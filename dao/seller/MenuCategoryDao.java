package dao.seller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.seller.MenuCategoryVo;

public class MenuCategoryDao {
	
	static MenuCategoryDao single = null; //자기자신의 값을 담는 변수

	public static MenuCategoryDao getInstance() { //DBService의 객체 요청

		if (single == null)
			single = new MenuCategoryDao(); //처음 요청시에는 만들어서 줌, static이므로 하나만 만들어짐, 두번째 요청시에는 single null아니므로 이전에 만들어진 정보 반환 (결국 같은 객체)

		return single; //만들어진 객체를 리턴

	} //singleton! (요청이 몇번 들어올지 모르기 때문에 싱글톤으로)

	private MenuCategoryDao() { //private생성자 -> singleton으로만 생성해라
		// TODO Auto-generated constructor stub
	}
	
	public List<MenuCategoryVo> selectList() { //list 형태로 반환

		List<MenuCategoryVo> list = new ArrayList<MenuCategoryVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from menu_category";

		try {
			//JDBC 본코드작성
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. PreparedStatement 얻어온다
			pstmt = conn.prepareStatement(sql);

			//3. ResultSet 얻어오기
			rs = pstmt.executeQuery(); //사전에 prepareStatement 가 sql문 킵해놓았으므로 인자없이 executeQuery

			while (rs.next()) {

				//rs의 값을 담을 객체 생성
				MenuCategoryVo vObj = new MenuCategoryVo(); //다른 자료도 어차피 value object

				//현재 rs위치의 레코드내의 필드(컬럼) 얻어오기 -> vo 포장
				vObj.setMenu_category_idx(rs.getInt("menu_category_idx")); 
				vObj.setMenu_category_name(rs.getString("menu_category_name")); 

				//생성된 vo를 ArrayList에 담는다
				list.add(vObj);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			//마무리 코드 작성

			try { //블럭설정 후 alt+shft+z
				//열림역순  (열려있는 것만 닫아라)
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list; //list 내에는 vo에서 가져온 레코드 값이 담겨있음
	}

}
