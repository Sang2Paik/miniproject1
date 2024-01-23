package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
				vObj.setUser_cellphone(rs.getString("user_cellphone"));


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
	
}
