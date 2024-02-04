package dao.seller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.seller.MenuVo;
import vo.seller.SellerVo;

public class SellerDao {
	static SellerDao single = null; //자기자신의 값을 담는 변수

	public static SellerDao getInstance() { //DBService의 객체 요청

		if (single == null)
			single = new SellerDao(); //처음 요청시에는 만들어서 줌, static이므로 하나만 만들어짐, 두번째 요청시에는 single null아니므로 이전에 만들어진 정보 반환 (결국 같은 객체)

		return single; //만들어진 객체를 리턴

	} //singleton! (요청이 몇번 들어올지 모르기 때문에 싱글톤으로)

	private SellerDao() { //private생성자 -> singleton으로만 생성해라
		// TODO Auto-generated constructor stub
	}
	
	public List<SellerVo> selectList() { //list 형태로 반환

		List<SellerVo> list = new ArrayList<SellerVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;                          // 1
		String sql = "select * from seller";

		try {
			//JDBC 본코드작성
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. PreparedStatement 얻어온다
			pstmt = conn.prepareStatement(sql);
			
			//3. pstmt parameter 세팅
			//pstmt.setInt(1, user_idx);

			//3. ResultSet 얻어오기
			rs = pstmt.executeQuery(); //사전에 prepareStatement 가 sql문 킵해놓았으므로 인자없이 executeQuery

			while (rs.next()) {

				//rs의 값을 담을 객체 생성
				SellerVo vObj = new SellerVo(); //다른 자료도 어차피 value object

				//현재 rs위치의 레코드내의 필드(컬럼) 얻어오기 - vo 포장
				vObj.setSeller_idx(rs.getInt("seller_idx"));
				vObj.setSeller_name(rs.getString("seller_name"));
				vObj.setSeller_addr(rs.getString("seller_addr"));
				vObj.setSeller_photo(rs.getString("seller_photo"));
				vObj.setSeller_phone(rs.getString("seller_phone"));
				vObj.setDelivery_type(rs.getString("delivery_type"));
				vObj.setSeller_intro(rs.getString("seller_intro"));
				vObj.setSeller_min_order_price(rs.getInt("seller_min_order_price"));
				vObj.setSeller_rating(rs.getInt("seller_rating"));
				vObj.setSeller_review_num(rs.getInt("seller_review_num"));
				vObj.setSeller_operation_hours(rs.getString("seller_operation_hours"));
				vObj.setSeller_close_days(rs.getString("seller_close_days"));
				vObj.setSeller_created_date(rs.getString("seller_created_date"));
				vObj.setSeller_modified_date(rs.getString("seller_modified_date"));
				vObj.setSeller_status(rs.getString("seller_status"));
				vObj.setFood_category_idx(rs.getInt("food_category_idx"));
				vObj.setFood_category_name(rs.getString("food_category_name"));
				vObj.setUser_idx(rs.getInt("user_idx"));

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

	public int insert(SellerVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		//                                                                                                                                                                                                                                                                             1 2 3 4 5 6 7 8 9 1011121314 <- pstmt의 index (Database이므로 1-base)
		String sql = "insert into seller(seller_name, seller_addr, seller_photo, seller_phone, delivery_type, seller_intro, seller_min_order_price, seller_operation_hours, seller_close_days, seller_status, food_category_idx, food_category_name, user_idx, seller_photo_ip) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3. pstmt parameter index 채우기  (resultSet 얻어오기 대신..?)
			pstmt.setString(1, vo.getSeller_name());  
			pstmt.setString(2, vo.getSeller_addr());  
			pstmt.setString(3, vo.getSeller_photo());  
			pstmt.setString(4, vo.getSeller_phone());  
			pstmt.setString(5, vo.getDelivery_type());  
			pstmt.setString(6, vo.getSeller_intro());  
			pstmt.setInt(7, vo.getSeller_min_order_price());  
			pstmt.setString(8, vo.getSeller_operation_hours());  
			pstmt.setString(9, vo.getSeller_close_days());  
			pstmt.setString(10, vo.getSeller_status());  
			pstmt.setInt(11, vo.getFood_category_idx());  
			pstmt.setString(12, vo.getFood_category_name());  
			pstmt.setInt(13, vo.getUser_idx());  
			pstmt.setString(14, vo.getSeller_photo_ip());  

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

	public SellerVo selectOne(int seller_idx) {  //idx에 해당하는 한건의 데이터만 리턴
			// TODO Auto-generated method stub
			
			SellerVo vOb = null;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			//                                                1 <- parameter index
			String sql = "select * from seller where seller_idx=?";
			
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
				
				if (rs.next()) {  //어차피 1건이라 한바퀴라서 while문 필요 없음
					
					//rs의 값을 담을 객체 생성
					vOb = new SellerVo();
					
					//현재 rs위치의 레코드내의 필드(컬럼) 얻어오기 -> 포장
					vOb.setSeller_idx(rs.getInt("seller_idx"));
					vOb.setSeller_name(rs.getString("seller_name"));
					vOb.setSeller_addr(rs.getString("seller_addr"));
					vOb.setSeller_photo(rs.getString("seller_photo"));
					vOb.setSeller_phone(rs.getString("seller_phone"));
					vOb.setDelivery_type(rs.getString("delivery_type"));
					vOb.setSeller_intro(rs.getString("seller_intro"));
					vOb.setSeller_min_order_price(rs.getInt("seller_min_order_price"));
					vOb.setSeller_rating(rs.getInt("seller_rating"));
					vOb.setSeller_review_num(rs.getInt("seller_review_num"));
					vOb.setSeller_operation_hours(rs.getString("seller_operation_hours"));
					vOb.setSeller_close_days(rs.getString("seller_close_days"));
					vOb.setSeller_created_date(rs.getString("seller_created_date"));
					vOb.setSeller_modified_date(rs.getString("seller_modified_date"));
					vOb.setSeller_status(rs.getString("seller_status"));
					vOb.setFood_category_idx(rs.getInt("food_category_idx"));
					vOb.setFood_category_name(rs.getString("food_category_name"));
					vOb.setUser_idx(rs.getInt("user_idx"));
					vOb.setSeller_photo_ip(rs.getString("seller_photo_ip"));

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
			
			return vOb;
		}

	public int update_seller_photo(SellerVo vo) {  //update
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		//                                           1                                              2 <- pstmt의 index (Database이므로 1-base)
		String sql = "update seller set seller_photo=?, seller_modified_date=now() where seller_idx=?";

		try {
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3. pstmt parameter index 채우기  (resultSet 얻어오기 대신..?)
			pstmt.setString(1, vo.getSeller_photo());  
			pstmt.setInt(2, vo.getSeller_idx());   

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

	public int seller_update(SellerVo vo) {  //update
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		//                                       1              2                    3                     4              5                                           6                7               8                         9                         10                  11               12                 13                 14  <- pstmt의 index (Database이므로 1-base)
		String sql = "update seller set user_idx=?, seller_name=?, food_category_idx=?, food_category_name=?, seller_addr=?, seller_modified_date=now(), seller_phone=?, delivery_type=?, seller_intro=?, seller_min_order_price=?, seller_operation_hours=?, seller_close_days=?, seller_status=?, seller_photo_ip=? where seller_idx=?";


		try {
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3. pstmt parameter index 채우기  (resultSet 얻어오기 대신..?)
			pstmt.setInt(1, vo.getUser_idx());  
			pstmt.setString(2, vo.getSeller_name());  
			pstmt.setInt(3, vo.getFood_category_idx());  
			pstmt.setString(4, vo.getFood_category_name()); 
			pstmt.setString(5, vo.getSeller_addr());
			pstmt.setString(6, vo.getSeller_phone());
			pstmt.setString(7, vo.getDelivery_type());
			pstmt.setString(8, vo.getSeller_intro());
			pstmt.setInt(9, vo.getSeller_min_order_price());
			pstmt.setString(10, vo.getSeller_operation_hours());
			pstmt.setString(11, vo.getSeller_close_days());
			pstmt.setString(12, vo.getSeller_status());
			pstmt.setString(13, vo.getSeller_photo_ip());
			pstmt.setInt(14, vo.getSeller_idx());  
			
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

	public int delete(int seller_idx) {  //delete
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		//                                                1 <- pstmt의 index (Database이므로 1-base)
		String sql = "delete from seller where seller_idx=?";

		try {
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3. pstmt parameter index 채우기  (resultSet 얻어오기 대신..?)
			pstmt.setInt(1, seller_idx);  

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

	public SellerVo selectOne(String seller_name) {  //idx에 해당하는 한건의 데이터만 리턴
		// TODO Auto-generated method stub
		
		SellerVo vOb = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//                                                   1 <- parameter index
		String sql = "select * from seller where seller_name=?";
		
		try {
			//JDBC 본코드작성
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();
			
			//2. PreparedStatement 얻어온다
			pstmt = conn.prepareStatement(sql);
			
			//3. pstmt parameter 세팅
			pstmt.setString(1, seller_name);
			
			
			//4. ResultSet 얻어오기
			rs = pstmt.executeQuery(); //사전에 prepareStatement 가 sql문 킵해놓았으므로 인자없이 executeQuery
			
			if (rs.next()) {  //어차피 1건이라 한바퀴라서 while문 필요 없음
				
				//rs의 값을 담을 객체 생성
				vOb = new SellerVo();
				
				//현재 rs위치의 레코드내의 필드(컬럼) 얻어오기 -> 포장
				vOb.setSeller_idx(rs.getInt("seller_idx"));
				vOb.setSeller_name(rs.getString("seller_name"));
				vOb.setSeller_addr(rs.getString("seller_addr"));
				vOb.setSeller_photo(rs.getString("seller_photo"));
				vOb.setSeller_phone(rs.getString("seller_phone"));
				vOb.setDelivery_type(rs.getString("delivery_type"));
				vOb.setSeller_intro(rs.getString("seller_intro"));
				vOb.setSeller_min_order_price(rs.getInt("seller_min_order_price"));
				vOb.setSeller_rating(rs.getInt("seller_rating"));
				vOb.setSeller_review_num(rs.getInt("seller_review_num"));
				vOb.setSeller_operation_hours(rs.getString("seller_operation_hours"));
				vOb.setSeller_close_days(rs.getString("seller_close_days"));
				vOb.setSeller_created_date(rs.getString("seller_created_date"));
				vOb.setSeller_modified_date(rs.getString("seller_modified_date"));
				vOb.setSeller_status(rs.getString("seller_status"));
				vOb.setFood_category_idx(rs.getInt("food_category_idx"));
				vOb.setFood_category_name(rs.getString("food_category_name"));
				vOb.setUser_idx(rs.getInt("user_idx"));
				vOb.setSeller_photo_ip(rs.getString("seller_photo_ip"));

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
		
		return vOb;
	}

	public List<SellerVo> selectList(int user_idx) { //list 형태로 반환

		List<SellerVo> list = new ArrayList<SellerVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;                          // 1
		String sql = "select * from seller where user_idx=?";

		try {
			//JDBC 본코드작성
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. PreparedStatement 얻어온다
			pstmt = conn.prepareStatement(sql);
			
			//3. pstmt parameter 세팅
			pstmt.setInt(1, user_idx);

			//3. ResultSet 얻어오기
			rs = pstmt.executeQuery(); //사전에 prepareStatement 가 sql문 킵해놓았으므로 인자없이 executeQuery

			while (rs.next()) {

				//rs의 값을 담을 객체 생성
				SellerVo vObj = new SellerVo(); //다른 자료도 어차피 value object

				//현재 rs위치의 레코드내의 필드(컬럼) 얻어오기 - vo 포장
				vObj.setSeller_idx(rs.getInt("seller_idx"));
				vObj.setSeller_name(rs.getString("seller_name"));
				vObj.setSeller_addr(rs.getString("seller_addr"));
				vObj.setSeller_photo(rs.getString("seller_photo"));
				vObj.setSeller_phone(rs.getString("seller_phone"));
				vObj.setDelivery_type(rs.getString("delivery_type"));
				vObj.setSeller_intro(rs.getString("seller_intro"));
				vObj.setSeller_min_order_price(rs.getInt("seller_min_order_price"));
				vObj.setSeller_rating(rs.getInt("seller_rating"));
				vObj.setSeller_review_num(rs.getInt("seller_review_num"));
				vObj.setSeller_operation_hours(rs.getString("seller_operation_hours"));
				vObj.setSeller_close_days(rs.getString("seller_close_days"));
				vObj.setSeller_created_date(rs.getString("seller_created_date"));
				vObj.setSeller_modified_date(rs.getString("seller_modified_date"));
				vObj.setSeller_status(rs.getString("seller_status"));
				vObj.setFood_category_idx(rs.getInt("food_category_idx"));
				vObj.setFood_category_name(rs.getString("food_category_name"));
				vObj.setUser_idx(rs.getInt("user_idx"));

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
