package dao.coupon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.coupon.CouponVo;

public class CouponDao {

	static CouponDao single = null;

	public static CouponDao getInstance() {

		if (single == null)
			single = new CouponDao();
		return single;
	}

	private CouponDao() {
		// TODO Auto-generated constructor stub
	}
	
	
	public List<CouponVo> selectList() {

		List<CouponVo> list = new ArrayList<CouponVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from coupon order by coupon_idx";

		try {
			//JDBC본코드 작성
			//1.Connection얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement 얻어온다
			pstmt = conn.prepareStatement(sql);

			//3.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			while (rs.next()) {

				//rs의 값을 담을 객체생성
				CouponVo vObj = new CouponVo();

				//현재 rs위치의 레코드내의 필드(컬럼)값 얻어오기->포장
				vObj.setCoupon_idx(rs.getInt("coupon_idx"));
				vObj.setUser_idx(rs.getInt("user_idx"));
				vObj.setUser_id(rs.getString("user_id"));
				vObj.setCoupon_name(rs.getString("coupon_name"));
				vObj.setCoupon_content(rs.getString("coupon_content"));
				vObj.setDeducted_price(rs.getInt("deducted_price"));
				vObj.setCoupon_min_order_price(rs.getInt("coupon_min_order_price"));
				vObj.setCoupon_created_date(rs.getString("coupon_created_date"));
				vObj.setCoupon_expired_date(rs.getString("coupon_expired_date"));
				vObj.setCoupon_issued(rs.getString("coupon_issued"));
				vObj.setCoupon_status(rs.getString("coupon_status"));
				
				//생성된 vo ArrayList담는다
				list.add(vObj);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			//마무리 코드 작성
			try {
				//열린역순
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

		return list;
	} // end : selectList

	
	
	
	public CouponVo selectOne(int coupon_idx) {
		// TODO Auto-generated method stub

		CouponVo vObj = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from coupon where coupon_idx=?";

		try {
			//JDBC본코드 작성
			//1.Connection얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement 얻어온다
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 셋팅
			pstmt.setInt(1, coupon_idx);
			
			//4.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			if (rs.next()) {

				//rs의 값을 담을 객체생성
				vObj = new CouponVo();

				//현재 rs위치의 레코드내의 필드(컬럼)값 얻어오기->포장
				vObj.setCoupon_idx(rs.getInt("coupon_idx"));
				vObj.setUser_idx(rs.getInt("user_idx"));
				vObj.setUser_id(rs.getString("user_id"));
				vObj.setCoupon_name(rs.getString("coupon_name"));
				vObj.setCoupon_content(rs.getString("coupon_content"));
				vObj.setDeducted_price(rs.getInt("deducted_price"));
				vObj.setCoupon_min_order_price(rs.getInt("coupon_min_order_price"));
				vObj.setCoupon_created_date(rs.getString("coupon_created_date"));
				vObj.setCoupon_expired_date(rs.getString("coupon_expired_date"));
				vObj.setCoupon_issued(rs.getString("coupon_issued"));
				vObj.setCoupon_status(rs.getString("coupon_status"));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			//마무리 코드 작성
			try {
				//열린역순
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
	} // end : selectOne
	
	
	public CouponVo selectOne(String coupon_name, String coupon_issued) {
		// TODO Auto-generated method stub

		CouponVo vObj = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//													 1                   2 LIMIT : 중복행 중 제일 첫번째의 행만 출력
		String sql = "select * from coupon where coupon_name=? and coupon_issued=? LIMIT 1";

		try {
			//JDBC본코드 작성
			//1.Connection얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement 얻어온다
			pstmt = conn.prepareStatement(sql);
			
			//3.pstmt parameter 셋팅
			pstmt.setString(1, coupon_name);
			pstmt.setString(2, coupon_issued);
			
			//4.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			if (rs.next()) {

				//rs의 값을 담을 객체생성
				vObj = new CouponVo();

				//현재 rs위치의 레코드내의 필드(컬럼)값 얻어오기->포장
				vObj.setUser_id(rs.getString("user_id"));
				vObj.setCoupon_idx(rs.getInt("coupon_idx"));
				vObj.setCoupon_name(rs.getString("coupon_name"));
				vObj.setCoupon_content(rs.getString("coupon_content"));
				vObj.setDeducted_price(rs.getInt("deducted_price"));
				vObj.setCoupon_min_order_price(rs.getInt("coupon_min_order_price"));
				vObj.setCoupon_created_date(rs.getString("coupon_created_date"));
				vObj.setCoupon_expired_date(rs.getString("coupon_expired_date"));
				vObj.setCoupon_issued(rs.getString("coupon_issued"));
				vObj.setCoupon_status(rs.getString("coupon_status"));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			//마무리 코드 작성
			try {
				//열린역순
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
	
	public CouponVo selectOne_user(String coupon_name, String user_id, int user_idx) {
		// TODO Auto-generated method stub

		CouponVo vObj = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//													 1             2              3       
		String sql = "select * from coupon where coupon_name=? and user_id=? and user_idx=? ";

		try {
			//JDBC본코드 작성
			//1.Connection얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement 얻어온다
			pstmt = conn.prepareStatement(sql);
			
			//3.pstmt parameter 셋팅
			pstmt.setString(1, coupon_name);
			pstmt.setString(2, user_id);
			pstmt.setInt(3, user_idx);
			
			//4.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			if (rs.next()) {

				//rs의 값을 담을 객체생성
				vObj = new CouponVo();

				//현재 rs위치의 레코드내의 필드(컬럼)값 얻어오기->포장
				vObj.setUser_id(rs.getString("user_id"));
				vObj.setCoupon_idx(rs.getInt("coupon_idx"));
				vObj.setCoupon_name(rs.getString("coupon_name"));
				vObj.setCoupon_content(rs.getString("coupon_content"));
				vObj.setDeducted_price(rs.getInt("deducted_price"));
				vObj.setCoupon_min_order_price(rs.getInt("coupon_min_order_price"));
				vObj.setCoupon_created_date(rs.getString("coupon_created_date"));
				vObj.setCoupon_expired_date(rs.getString("coupon_expired_date"));
				vObj.setCoupon_issued(rs.getString("coupon_issued"));
				vObj.setCoupon_status(rs.getString("coupon_status"));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			//마무리 코드 작성
			try {
				//열린역순
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
	
	
	
	public int delete(int coupon_idx) {
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		//                              
		String sql = "delete from coupon where coupon_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();
			//2.pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index 채우기
			pstmt.setInt(1, coupon_idx);
			
			//4. DB delete
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			try {
				//열린역순
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
	} // end : delete
	
	
	
	
	public int update(CouponVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		//                              	      1             2                3                4                        5                     6                  7
		String sql = "update coupon set user_idx =?,coupon_name=?,coupon_content=?,deducted_price=?,coupon_min_order_price=?,coupon_expired_date=? where coupon_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();
			//2.pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index 채우기
			pstmt.setInt(1, vo.getUser_idx());
			pstmt.setString(2, vo.getCoupon_name());
			pstmt.setString(3, vo.getCoupon_content());
			pstmt.setInt(4, vo.getDeducted_price());
			pstmt.setInt(5, vo.getCoupon_min_order_price());
			pstmt.setString(6, vo.getCoupon_expired_date());
			pstmt.setInt(7, vo.getCoupon_idx());
			
			
			//4. DB update
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			try {
				//열린역순
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
	
	public int update_user_issued(CouponVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		//                              		 1         2              3                4                5                        6                     7               8                  9
		String sql = "update coupon set user_idx=?,user_id=?, coupon_name=?,coupon_content=?,deducted_price=?,coupon_min_order_price=?,coupon_expired_date=?,coupon_issued=? where coupon_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();
			//2.pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index 채우기
			pstmt.setInt(1, vo.getUser_idx());
			pstmt.setString(2, vo.getUser_id());
			pstmt.setString(3, vo.getCoupon_name());
			pstmt.setString(4, vo.getCoupon_content());
			pstmt.setInt(5, vo.getDeducted_price());
			pstmt.setInt(6, vo.getCoupon_min_order_price());
			pstmt.setString(7, vo.getCoupon_expired_date());
			pstmt.setString(8, vo.getCoupon_issued());
			pstmt.setInt(9, vo.getCoupon_idx());
			
			
			//4. DB update
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			try {
				//열린역순
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
	
	public int insert(CouponVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		//               																								                      	           
		String sql = "insert into coupon(coupon_name, coupon_content, deducted_price, coupon_min_order_price, coupon_expired_date) values(?,?,?,?,?)";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();
			//2.pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index 채우기
			pstmt.setString(1, vo.getCoupon_name());
			pstmt.setString(2, vo.getCoupon_content());
			pstmt.setInt(3, vo.getDeducted_price());
			pstmt.setInt(4, vo.getCoupon_min_order_price());
			pstmt.setString(5, vo.getCoupon_expired_date());

			//4. DB insert
			res = pstmt.executeUpdate(); // insert

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			try {
				//열린역순
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
	
	public List<CouponVo> selectCoupon(int user_idx) {

		List<CouponVo> list = new ArrayList<CouponVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from coupon where user_idx=?";

		try {
			//JDBC 본코드 작성
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. 명령 처리객체 (PreparedStatement 얻어오기)
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_idx);
			
			//3. ResultSet 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				//rs의 값을 담을 객체 생성
				CouponVo vObj = new CouponVo();
				
				vObj.setUser_id(rs.getString("user_id"));
				vObj.setCoupon_idx(rs.getInt("coupon_idx"));
				vObj.setCoupon_name(rs.getString("coupon_name"));
				vObj.setCoupon_content(rs.getString("coupon_content"));
				vObj.setDeducted_price(rs.getInt("deducted_price"));
				vObj.setCoupon_min_order_price(rs.getInt("coupon_min_order_price"));
				vObj.setCoupon_created_date(rs.getString("coupon_created_date"));
				vObj.setCoupon_expired_date(rs.getString("coupon_expired_date"));
				vObj.setCoupon_issued(rs.getString("coupon_issued"));
				vObj.setCoupon_status(rs.getString("coupon_status"));

				//생성된 vo를 ArrayList담는다
				list.add(vObj);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			// 마무리 코드 작성

			try {
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

		return list;
	}
	
	
}
