package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.member.MemberVo;

public class MemberDao {
	
	static MemberDao single = null;

	public static MemberDao getInstance() {

		if (single == null)
			single = new MemberDao();
		return single;
	}

	private MemberDao() {

	}
	
	public List<MemberVo> selectList() {

		List<MemberVo> list = new ArrayList<MemberVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user";

		try {
			//JDBC 본코드 작성
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. 명령 처리객체 (PreparedStatement 얻어오기)
			pstmt = conn.prepareStatement(sql);

			//3. ResultSet 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				//rs의 값을 담을 객체 생성
				MemberVo vObj = new MemberVo();
				
				vObj.setUser_idx(rs.getInt("user_idx"));
				vObj.setUser_name(rs.getString("user_name"));
				vObj.setUser_id(rs.getString("user_id"));
				vObj.setUser_pwd(rs.getString("user_pwd"));
				vObj.setUser_cellphone(rs.getString("user_cellphone"));
				vObj.setUser_addr(rs.getString("user_addr"));
				vObj.setUser_email(rs.getString("user_email"));
				vObj.setUser_order_addr(rs.getString("user_order_addr"));
				vObj.setUser_grade(rs.getString("user_grade"));
				vObj.setUser_created_date(rs.getString("user_created_date"));
				vObj.setUser_modified_date(rs.getString("user_modified_date"));
				vObj.setUser_proof(rs.getString("user_proof"));
				
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
	
	public List<MemberVo> selectList(String user_grade) {

		List<MemberVo> list = new ArrayList<MemberVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user where user_grade=? order by user_idx ASC";

		try {
			//JDBC본코드 작성
			//1.Connection얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement 얻어온다
			pstmt = conn.prepareStatement(sql);
			
			//찾아올 테이블 값 넣어주기
			pstmt.setString(1, user_grade);
			
			//3.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			while (rs.next()) {

				//rs의 값을 담을 객체생성
				MemberVo vObj = new MemberVo();

				//현재 rs위치의 레코드내의 필드(컬럼)값 얻어오기->포장
				//컬럼값 가져오기
				vObj.setUser_id(rs.getString("user_id"));
				vObj.setUser_idx(rs.getInt("user_idx"));
				vObj.setUser_name(rs.getString("user_name"));
				vObj.setUser_pwd(rs.getString("user_pwd"));
				vObj.setUser_order_addr(rs.getString("user_order_addr"));
				vObj.setUser_grade(rs.getString("user_grade"));
				vObj.setUser_cellphone(rs.getString("user_cellphone"));
				vObj.setUser_addr(rs.getString("user_addr"));
				vObj.setUser_created_date(rs.getString("user_created_date"));
				vObj.setUser_email(rs.getString("user_email"));
				vObj.setUser_modified_date(rs.getString("user_modified_date"));
				vObj.setUser_proof(rs.getString("user_proof"));
				
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
	}
	
	public MemberVo selectOne(int user_idx) {
		// TODO Auto-generated method stub

		MemberVo vObj = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user where user_idx=?";

		try {

			conn = DBService.getInstance().getConnection();

			pstmt = conn.prepareStatement(sql);

			// 쿼리문에 대한 set
			pstmt.setInt(1, user_idx);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				vObj = new MemberVo();

				//컬럼값 가져오기
				vObj.setUser_id(rs.getString("user_id"));
				vObj.setUser_idx(rs.getInt("user_idx"));
				vObj.setUser_name(rs.getString("user_name"));
				vObj.setUser_pwd(rs.getString("user_pwd"));
				vObj.setUser_order_addr(rs.getString("user_order_addr"));
				vObj.setUser_grade(rs.getString("user_grade"));
				vObj.setUser_cellphone(rs.getString("user_cellphone"));
				vObj.setUser_addr(rs.getString("user_addr"));
				vObj.setUser_created_date(rs.getString("user_created_date"));
				vObj.setUser_email(rs.getString("user_email"));
				vObj.setUser_modified_date(rs.getString("user_modified_date"));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

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

		return vObj;
	}
	
	public MemberVo selectOne(String user_id) {
		// TODO Auto-generated method stub

		MemberVo vObj = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user where user_id=?";

		try {

			conn = DBService.getInstance().getConnection();

			pstmt = conn.prepareStatement(sql);

			// 쿼리문에 대한 set
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {

				vObj = new MemberVo();

				//컬럼값 가져오기
				vObj.setUser_id(rs.getString("user_id"));
				vObj.setUser_idx(rs.getInt("user_idx"));
				vObj.setUser_name(rs.getString("user_name"));
				vObj.setUser_pwd(rs.getString("user_pwd"));
				vObj.setUser_order_addr(rs.getString("user_order_addr"));
				vObj.setUser_grade(rs.getString("user_grade"));
				vObj.setUser_cellphone(rs.getString("user_cellphone"));
				vObj.setUser_addr(rs.getString("user_addr"));
				vObj.setUser_created_date(rs.getString("user_created_date"));
				vObj.setUser_email(rs.getString("user_email"));
				vObj.setUser_modified_date(rs.getString("user_modified_date"));
				vObj.setUser_proof(rs.getString("user_proof"));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

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

		return vObj;
	}
	
	public int insert(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into user(user_name, user_id, user_pwd, user_cellphone, user_email, user_addr, user_order_addr, user_grade, user_proof)"
				+ "				values(?,?,?,?,?,?,?,?,?)";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();
			//2.pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);
			//3.pstmt parameter index 채우기
			pstmt.setString(1, vo.getUser_name());
			pstmt.setString(2, vo.getUser_id());
			pstmt.setString(3, vo.getUser_pwd());
			pstmt.setString(4, vo.getUser_cellphone());
			pstmt.setString(5, vo.getUser_email());
			pstmt.setString(6, vo.getUser_addr());
			pstmt.setString(7, vo.getUser_order_addr());
			pstmt.setString(8, vo.getUser_grade());
			pstmt.setString(9, vo.getUser_proof());

			//4.DB insert
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
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
	
	public int update(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update user set user_order_addr=? where user_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();
			//2.pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);
			//3.pstmt parameter index 채우기
			pstmt.setString(1, vo.getUser_order_addr());
			pstmt.setInt(2, vo.getUser_idx());
			//4.DB update
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
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
	
	public int delete(int user_idx) {
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from user where user_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();
			//2.pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);
			//3.pstmt parameter index 채우기
			pstmt.setInt(1, user_idx);
			//4.DB delete
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
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
	
	public int update_modify(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update user set user_name=?, user_pwd=?, user_cellphone=?, user_email=?, user_addr=?, user_order_addr=?, user_modified_date=now() where user_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();
			//2.pstmt 얻어오기
			pstmt = conn.prepareStatement(sql);
			//3.pstmt parameter index 채우기
			pstmt.setString(1, vo.getUser_name());
			pstmt.setString(2, vo.getUser_pwd());
			pstmt.setString(3, vo.getUser_cellphone());
			pstmt.setString(4, vo.getUser_email());
			pstmt.setString(5, vo.getUser_addr());
			pstmt.setString(6, vo.getUser_order_addr());
			pstmt.setInt(7, vo.getUser_idx());

			//4.DB update
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
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
	
}
