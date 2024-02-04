package vo.seller;

public class SellerVo {
	
	int seller_idx;
	String seller_name;
	String seller_addr;
	String seller_photo;
	String seller_phone;
	String delivery_type;
	String seller_intro;
	int seller_min_order_price;
	int seller_rating;
	int seller_review_num;
	String seller_operation_hours;
	String seller_close_days;
	String seller_created_date;
	String seller_modified_date;
	String seller_status;
	int food_category_idx;
	String food_category_name;
	int user_idx;
	String seller_photo_ip;
	
	//기본생성자
	public SellerVo() {
		// TODO Auto-generated constructor stub
	}
	
	//생성자
	public SellerVo(int seller_idx, String seller_name, String seller_addr, String seller_photo, String seller_phone,
			String delivery_type, String seller_intro, int seller_min_order_price, int seller_rating,
			int seller_review_num, String seller_operation_hours, String seller_close_days, String seller_created_date,
			String seller_modified_date, String seller_status, int food_category_idx, String food_category_name, int user_idx, String seller_photo_ip) {
		super();
		this.seller_idx = seller_idx;
		this.seller_name = seller_name;
		this.seller_addr = seller_addr;
		this.seller_photo = seller_photo;
		this.seller_phone = seller_phone;
		this.delivery_type = delivery_type;
		this.seller_intro = seller_intro;
		this.seller_min_order_price = seller_min_order_price;
		this.seller_rating = seller_rating;
		this.seller_review_num = seller_review_num;
		this.seller_operation_hours = seller_operation_hours;
		this.seller_close_days = seller_close_days;
		this.seller_created_date = seller_created_date;
		this.seller_modified_date = seller_modified_date;
		this.seller_status = seller_status;
		this.food_category_idx = food_category_idx;
		this.food_category_name = food_category_name;
		this.user_idx = user_idx;
		this.seller_photo_ip = seller_photo_ip;
	}
	
	
	//insert시 생성자
	public SellerVo(String seller_name, String seller_addr, String seller_photo, String seller_phone, String delivery_type,
			String seller_intro, int seller_min_order_price, String seller_operation_hours, String seller_close_days,
			String seller_status, int food_category_idx, String food_category_name, int user_idx, String seller_photo_ip) {
		super();
		this.seller_name = seller_name;
		this.seller_addr = seller_addr;
		this.seller_photo = seller_photo;
		this.seller_phone = seller_phone;
		this.delivery_type = delivery_type;
		this.seller_intro = seller_intro;
		this.seller_min_order_price = seller_min_order_price;
		this.seller_operation_hours = seller_operation_hours;
		this.seller_close_days = seller_close_days;
		this.seller_status = seller_status;
		this.food_category_idx = food_category_idx;
		this.food_category_name = seller_status;
		this.user_idx = user_idx;
		this.seller_photo_ip = seller_photo_ip;
	}
	
	


	
	
	public SellerVo(int seller_idx, String seller_name, String seller_addr, String seller_photo, String seller_phone,
			String delivery_type, String seller_intro, int seller_min_order_price, String seller_operation_hours,
			String seller_close_days, int food_category_idx, String food_category_name, int user_idx,
			String seller_photo_ip) {
		super();
		this.seller_idx = seller_idx;
		this.seller_name = seller_name;
		this.seller_addr = seller_addr;
		this.seller_photo = seller_photo;
		this.seller_phone = seller_phone;
		this.delivery_type = delivery_type;
		this.seller_intro = seller_intro;
		this.seller_min_order_price = seller_min_order_price;
		this.seller_operation_hours = seller_operation_hours;
		this.seller_close_days = seller_close_days;
		this.food_category_idx = food_category_idx;
		this.food_category_name = food_category_name;
		this.user_idx = user_idx;
		this.seller_photo_ip = seller_photo_ip;
	}
	//게터세터
	public int getSeller_idx() {
		return seller_idx;
	}
	public String getSeller_photo_ip() {
		return seller_photo_ip;
	}

	public void setSeller_photo_ip(String seller_photo_ip) {
		this.seller_photo_ip = seller_photo_ip;
	}

	public int getFood_category_idx() {
		return food_category_idx;
	}

	public void setFood_category_idx(int food_category_idx) {
		this.food_category_idx = food_category_idx;
	}

	public void setSeller_idx(int seller_idx) {
		this.seller_idx = seller_idx;
	}
	public String getSeller_name() {
		return seller_name;
	}
	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}
	public String getSeller_addr() {
		return seller_addr;
	}
	public void setSeller_addr(String seller_addr) {
		this.seller_addr = seller_addr;
	}
	public String getSeller_photo() {
		return seller_photo;
	}
	public void setSeller_photo(String seller_photo) {
		this.seller_photo = seller_photo;
	}
	public String getSeller_phone() {
		return seller_phone;
	}
	public void setSeller_phone(String seller_phone) {
		this.seller_phone = seller_phone;
	}
	public String getDelivery_type() {
		return delivery_type;
	}
	public void setDelivery_type(String delivery_type) {
		this.delivery_type = delivery_type;
	}
	public String getSeller_intro() {
		return seller_intro;
	}
	public void setSeller_intro(String seller_intro) {
		this.seller_intro = seller_intro;
	}
	public int getSeller_min_order_price() {
		return seller_min_order_price;
	}
	public void setSeller_min_order_price(int seller_min_order_price) {
		this.seller_min_order_price = seller_min_order_price;
	}
	public int getSeller_rating() {
		return seller_rating;
	}
	public void setSeller_rating(int seller_rating) {
		this.seller_rating = seller_rating;
	}
	public int getSeller_review_num() {
		return seller_review_num;
	}
	public void setSeller_review_num(int seller_review_num) {
		this.seller_review_num = seller_review_num;
	}
	public String getSeller_operation_hours() {
		return seller_operation_hours;
	}
	public void setSeller_operation_hours(String seller_operation_hours) {
		this.seller_operation_hours = seller_operation_hours;
	}
	public String getSeller_close_days() {
		return seller_close_days;
	}
	public void setSeller_close_days(String seller_close_days) {
		this.seller_close_days = seller_close_days;
	}
	public String getSeller_created_date() {
		return seller_created_date;
	}
	public void setSeller_created_date(String seller_created_date) {
		this.seller_created_date = seller_created_date;
	}
	public String getSeller_modified_date() {
		return seller_modified_date;
	}
	public void setSeller_modified_date(String seller_modified_date) {
		this.seller_modified_date = seller_modified_date;
	}
	public String getSeller_status() {
		return seller_status;
	}
	public void setSeller_status(String seller_status) {
		this.seller_status = seller_status;
	}
	public String getFood_category_name() {
		return food_category_name;
	}
	public void setFood_category_name(String food_category_name) {
		this.food_category_name = food_category_name;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

		
}
