package action.coupon;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.coupon.CouponDao;
import vo.coupon.CouponVo;

/**
 * Servlet implementation class CouponIssuedAction
 */
@WebServlet("/coupon_issued_action.do")
public class CouponIssuedAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 수신인코딩 설정
		request.setCharacterEncoding("utf-8");

		System.out.println("CouponIssuedAction");

		// 파라메터 받기
		String coupon_name = request.getParameter("coupon_name");
		String user_id = request.getParameter("user_id");
		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		
		
		// 성공 시 true, 실패 시 false를 반환하도록 작성
		boolean issued = true;
		// 쿠폰 이름과 유저아이디, 유저 고유번호로 해당쿠폰 가져오기
		CouponVo vo = CouponDao.getInstance().selectOne_user(coupon_name, user_id, user_idx);
		
		//vo.getCoupon_issued().isEmpty();
		// 선택하며 issued된 쿠폰이름(issued에 쿠폰 이름이 들어감)과 유저 아이디가 맞으면 계정이 받은 쿠폰이기 때문에 false반환
		if(vo != null) {
			issued = false;
			PrintWriter out = response.getWriter();
			out.append("{\"data\": " + issued + "}");
			out.flush();
			out.close();
		}else {
			// 여기에서 쿠폰 발행 로직을 수행하고, 발행 성공 여부를 isSuccess에 저장
			boolean isSuccess = yourCouponIssuingLogic(coupon_name, user_idx, user_id);
			// JSON 형태로 응답을 구성합니다.
			PrintWriter out = response.getWriter();
			out.append("{\"data\": " + isSuccess + "}");
			out.flush();
	
			out.close();
		}
	} // end : action

	// 쿠폰 발행 로직을 수행하는 메서드
	private boolean yourCouponIssuingLogic(String coupon_name, int user_idx, String user_id) {
		// TODO Auto-generated method stub
		
		CouponVo select_coupon = CouponDao.getInstance().selectOne(coupon_name, "N");
			
			if(select_coupon.getUser_id()==null) {
				select_coupon.setUser_id(user_id);
				select_coupon.setCoupon_issued(coupon_name);
				select_coupon.setUser_idx(user_idx);
				//발행
				CouponDao.getInstance().update_user_issued(select_coupon);
				//발행 됐을 때 true
				return true;
			}else {
				return false;
		}
	} // end : yourCouponIssuingLogic
}
