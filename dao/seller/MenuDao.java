package dao.seller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.seller.MenuVo;

public class MenuDao {	
	
	static MenuDao single = null; //자기자신의 값을 담는 변수

	public static MenuDao getInstance() { //DBService의 객체 요청

		if (single == null)
			single = new MenuDao(); //처음 요청시에는 만들어서 줌, static이므로 하나만 만들어짐, 두번째 요청시에는 single null아니므로 이전에 만들어진 정보 반환 (결국 같은 객체)

		return single; //만들어진 객체를 리턴

	} //singleton! (요청이 몇번 들어올지 모르기 때문에 싱글톤으로)

	private MenuDao() { //private생성자 -> singleton으로만 생성해라
		// TODO Auto-generated constructor stub
	}
	
	//전체조회
	public List<vo.seller.MenuVo> selectList() { //list 형태로 반환

		List<vo.seller.MenuVo> list = new ArrayList<vo.seller.MenuVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from menu";

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
				MenuVo vObj = new MenuVo(); //다른 자료도 어차피 value object

				//현재 rs위치의 레코드내의 필드(컬럼) 얻어오기 -> vo포장
				vObj.setMenu_idx(rs.getInt("Menu_idx)"));
				vObj.setSeller_idx(rs.getInt("seller_idx"));
				vObj.setMenu_name(rs.getString("menu_name"));
				vObj.setMenu_category_idx(rs.getInt("menu_category_idx"));
				vObj.setMenu_photo(rs.getString("menu_photo"));
				vObj.setMenu_price(rs.getInt("menu_price"));
				vObj.setMenu_created_date(rs.getString("menu_created_date"));
				vObj.setMenu_modified_date(rs.getString("menu_modified_date"));
				vObj.setMenu_status(rs.getString("menu_status"));
				vObj.setMenu_rating_avg(rs.getInt("menu_rating_avg"));
				vObj.setMenu_photo_ip(rs.getString("menu_photo_ip"));
				vObj.setMenu_detail(rs.getString("menu_detail"));				

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
	}//end:selectlist
	

	public MenuVo selectOne(int menu_idx) {  //idx에 해당하는 한건의 데이터만 리턴
			// TODO Auto-generated method stub
			
			MenuVo vObj = null;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			//                                         1 <- parameter index
			String sql = "select * from menu where menu_idx=?";
			
			try {
				//JDBC 본코드작성
				//1. Connection 얻어오기
				conn = DBService.getInstance().getConnection();
				
				//2. PreparedStatement 얻어온다
				pstmt = conn.prepareStatement(sql);
				
				//3. pstmt parameter 세팅
				pstmt.setInt(1, menu_idx);
				
				
				//4. ResultSet 얻어오기
				rs = pstmt.executeQuery(); //사전에 prepareStatement 가 sql문 킵해놓았으므로 인자없이 executeQuery
				
				if (rs.next()) {  //어차피 1건이라 한바퀴라서 while문 필요 없음
					
					//rs의 값을 담을 객체 생성
					vObj = new MenuVo();
					
					//현재 rs위치의 레코드내의 필드(컬럼) 얻어오기 -> 포장
					//현재 rs위치의 레코드내의 필드(컬럼) 얻어오기 -> 포장
					vObj.setMenu_idx(rs.getInt("menu_idx"));   
					vObj.setMenu_name(rs.getString("menu_name"));
					vObj.setSeller_idx(rs.getInt("seller_idx"));
					vObj.setMenu_category_name(rs.getString("menu_category_idx"));
					vObj.setMenu_category_name(rs.getString("menu_category_name"));
					vObj.setMenu_photo(rs.getString("menu_photo"));
					vObj.setMenu_price(rs.getInt("menu_price"));
					vObj.setMenu_created_date(rs.getString("menu_created_date"));
					vObj.setMenu_modified_date(rs.getString("menu_modified_date"));
					vObj.setMenu_status(rs.getString("menu_status"));
					vObj.setMenu_rating_avg(rs.getInt("menu_rating_avg"));
					vObj.setMenu_photo_ip(rs.getString("menu_photo_ip"));
					vObj.setMenu_detail(rs.getString("menu_detail"));

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
			
			return vObj;
	}


	public int menu_register(MenuVo vo) {  //insert
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		//                                                                                                                                                      1 2 3 4 5 6 7 8                                       6              7                 8<- pstmt의 index (Database이므로 1-base)
		String sql = "insert into menu(menu_name, seller_idx, menu_category_idx, menu_category_name, menu_photo, menu_price, menu_detail, menu_photo_ip) values(?,?,?,?,?,?,?,?)";


		try {
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3. pstmt parameter index 채우기  (resultSet 얻어오기 대신..?)
			pstmt.setString(1, vo.getMenu_name());  
			pstmt.setInt(2, vo.getSeller_idx());  
			pstmt.setInt(3, vo.getMenu_category_idx());  
			pstmt.setString(4, vo.getMenu_category_name());  
			pstmt.setString(5, vo.getMenu_photo());  
			pstmt.setInt(6, vo.getMenu_price());  
			pstmt.setString(7, vo.getMenu_detail());
			pstmt.setString(8, vo.getMenu_photo_ip());

			//4. DB insert
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally { //후속처리
			//열린역순
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return res;
	}

	public int menu_modify(MenuVo vo) {  //update
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		//                                      1                     2                3                 4                                          5              6              7                8  <- pstmt의 index (Database이므로 1-base)
		String sql = "update menu set menu_name=?, menu_category_idx=?, menu_category_name=?, menu_price=?, menu_modified_date=now(), menu_photo_ip=?, menu_detail=?, menu_status=? where menu_idx=?";


		try {
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3. pstmt parameter index 채우기  (resultSet 얻어오기 대신..?)
			pstmt.setString(1, vo.getMenu_name());  
			pstmt.setInt(2, vo.getMenu_category_idx());  
			pstmt.setString(3, vo.getMenu_category_name());  
			pstmt.setInt(4, vo.getMenu_price());  
			pstmt.setString(5, vo.getMenu_photo_ip()); 
			pstmt.setString(6, vo.getMenu_detail());
			pstmt.setString(7, vo.getMenu_status());
			pstmt.setInt(8, vo.getMenu_idx());

			//4. DB update
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally { //후속처리
			//열린역순
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return res;
	}

	public int delete(int menu_idx) {  //delete
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		//                                            1 <- pstmt의 index (Database이므로 1-base)
		String sql = "delete from menu where menu_idx=?";

		try {
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3. pstmt parameter index 채우기  (resultSet 얻어오기 대신..?)
			pstmt.setInt(1, menu_idx);  

			//4. DB delete
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally { //후속처리
			//열린역순
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return res;
	}

	public int update_menu_photo(MenuVo vo) {  //update
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		//                                       1                                        2 <- pstmt의 index (Database이므로 1-base)
		String sql = "update menu set menu_photo=?, menu_modified_date=now() where menu_idx=?";

		try {
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3. pstmt parameter index 채우기  (resultSet 얻어오기 대신..?)
			pstmt.setString(1, vo.getMenu_photo());  
			pstmt.setInt(2, vo.getMenu_idx());   

			//4. DB update
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally { //후속처리
			//열린역순
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return res;
	}

	//seller_idx별 메뉴 리스트 보기
	public List<vo.seller.MenuVo> selectList(int seller_idx) { //list 형태로 반환

		List<vo.seller.MenuVo> list = new ArrayList<vo.seller.MenuVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from menu where seller_idx=?";

		try {
			//JDBC 본코드작성
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. PreparedStatement 얻어온다
			pstmt = conn.prepareStatement(sql);
			
			//3. pstmt parameter 세팅
			pstmt.setInt(1, seller_idx);
			
			//4. ResultSet 얻어오기
			rs = pstmt.executeQuery(); //사전에 prepareStatement 가 sql문 킵해놓았으므로 인자없이 executeQuery

			while (rs.next()) {

				//rs의 값을 담을 객체 생성
				MenuVo vObj = new MenuVo(); //다른 자료도 어차피 value object

				//현재 rs위치의 레코드내의 필드(컬럼) 얻어오기 -> vo포장
				vObj.setMenu_idx(rs.getInt("menu_idx"));
				vObj.setSeller_idx(rs.getInt("seller_idx"));
				vObj.setMenu_name(rs.getString("menu_name"));
				vObj.setMenu_category_idx(rs.getInt("menu_category_idx"));
				vObj.setMenu_category_name(rs.getString("menu_category_name"));
				vObj.setMenu_photo(rs.getString("menu_photo"));
				vObj.setMenu_price(rs.getInt("menu_price"));
				vObj.setMenu_created_date(rs.getString("menu_created_date"));
				vObj.setMenu_modified_date(rs.getString("menu_modified_date"));
				vObj.setMenu_status(rs.getString("menu_status"));
				vObj.setMenu_rating_avg(rs.getInt("menu_rating_avg"));
				vObj.setMenu_photo_ip(rs.getString("menu_photo_ip"));
				vObj.setMenu_detail(rs.getString("menu_detail"));				

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
	}//end:selectlist
}

