package vo.coupon;

public class CouponVo {

	int coupon_idx, user_idx, deducted_price, coupon_min_order_price;
	String user_id, coupon_name, coupon_content, coupon_created_date, coupon_expired_date, coupon_issued, coupon_status;

	public CouponVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CouponVo(int coupon_idx, int user_idx, int deducted_price, int coupon_min_order_price, String coupon_name,
			String coupon_content, String coupon_created_date, String coupon_expired_date, String user_id,
			String coupon_issued, String coupon_status) {
		super();
		this.coupon_idx = coupon_idx;
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.deducted_price = deducted_price;
		this.coupon_min_order_price = coupon_min_order_price;
		this.coupon_name = coupon_name;
		this.coupon_content = coupon_content;
		this.coupon_created_date = coupon_created_date;
		this.coupon_expired_date = coupon_expired_date;
		this.coupon_issued = coupon_issued;
		this.coupon_status = coupon_status;
	}

	public CouponVo(int deducted_price, int coupon_min_order_price, String coupon_name, String coupon_content,
			String coupon_expired_date) {
		super();
		this.deducted_price = deducted_price;
		this.coupon_min_order_price = coupon_min_order_price;
		this.coupon_name = coupon_name;
		this.coupon_content = coupon_content;
		this.coupon_expired_date = coupon_expired_date;
	}

	public int getCoupon_idx() {
		return coupon_idx;
	}

	public void setCoupon_idx(int coupon_idx) {
		this.coupon_idx = coupon_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getDeducted_price() {
		return deducted_price;
	}

	public void setDeducted_price(int deducted_price) {
		this.deducted_price = deducted_price;
	}

	public int getCoupon_min_order_price() {
		return coupon_min_order_price;
	}

	public void setCoupon_min_order_price(int coupon_min_order_price) {
		this.coupon_min_order_price = coupon_min_order_price;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public String getCoupon_content() {
		return coupon_content;
	}

	public String getCoupon_created_date() {
		return coupon_created_date;
	}

	public void setCoupon_created_date(String coupon_created_date) {
		this.coupon_created_date = coupon_created_date;
	}

	public String getCoupon_expired_date() {
		return coupon_expired_date;
	}

	public void setCoupon_expired_date(String coupon_expired_date) {
		this.coupon_expired_date = coupon_expired_date;
	}

	public String getCoupon_status() {
		return coupon_status;
	}

	public void setCoupon_status(String coupon_status) {
		this.coupon_status = coupon_status;
	}

	public void setCoupon_content(String coupon_content) {
		this.coupon_content = coupon_content;
	}

	public String getCoupon_issued() {
		return coupon_issued;
	}

	public void setCoupon_issued(String coupon_issued) {
		this.coupon_issued = coupon_issued;
	}

}
