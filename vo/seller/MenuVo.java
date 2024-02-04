package vo.seller;

public class MenuVo {
	
	int menu_idx;     //auto_increment
	int seller_idx;
	String menu_name;
	int menu_category_idx;
	String menu_category_name;
	String menu_photo;
	int menu_price;
	String menu_created_date;   // default now()
	String menu_modified_date;  // default now()
	String menu_status;         // default '주문가능'
	int menu_rating_avg;        // default 0
	String menu_photo_ip;
	String menu_detail;
	
	
	//기본 생성자
	public MenuVo() {
		// TODO Auto-generated constructor stub
	}
	
	//메뉴 등록시 필요한 생성자
	public MenuVo(int seller_idx, String menu_name, int menu_category_idx, String menu_category_name, String menu_photo, int menu_price,
			String menu_photo_ip, String menu_detail) {
		super();
		this.seller_idx = seller_idx;
		this.menu_name = menu_name;
		this.menu_category_idx = menu_category_idx;
		this.menu_category_name = menu_category_name;
		this.menu_photo = menu_photo;
		this.menu_price = menu_price;
		this.menu_photo_ip = menu_photo_ip;
		this.menu_detail = menu_detail;
	}
	
	//메뉴 수정시 필요한 생성자
	public MenuVo(int menu_idx, String menu_name, int menu_category_idx, String menu_category_name, String menu_photo,
			int menu_price, String menu_status, String menu_photo_ip, String menu_detail) {
		super();
		this.menu_idx = menu_idx;
		this.menu_name = menu_name;
		this.menu_category_idx = menu_category_idx;
		this.menu_category_name = menu_category_name;
		this.menu_photo = menu_photo;
		this.menu_price = menu_price;
		this.menu_status = menu_status;
		this.menu_photo_ip = menu_photo_ip;
		this.menu_detail = menu_detail;
	}
	

	public int getMenu_idx() {
		return menu_idx;
	}



	public void setMenu_idx(int menu_idx) {
		this.menu_idx = menu_idx;
	}

	public int getSeller_idx() {
		return seller_idx;
	}

	public void setSeller_idx(int seller_idx) {
		this.seller_idx = seller_idx;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public void setMenu_category_name(String menu_category_name) {
		this.menu_category_name = menu_category_name;
	}

	public String getMenu_category_name() {
		return menu_category_name;
	}

	public String getMenu_photo() {
		return menu_photo;
	}

	public void setMenu_photo(String menu_photo) {
		this.menu_photo = menu_photo;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_created_date() {
		return menu_created_date;
	}

	public void setMenu_created_date(String menu_created_date) {
		this.menu_created_date = menu_created_date;
	}

	public String getMenu_modified_date() {
		return menu_modified_date;
	}

	public void setMenu_modified_date(String menu_modified_date) {
		this.menu_modified_date = menu_modified_date;
	}

	public String getMenu_status() {
		return menu_status;
	}

	public void setMenu_status(String menu_status) {
		this.menu_status = menu_status;
	}

	public int getMenu_rating_avg() {
		return menu_rating_avg;
	}

	public void setMenu_rating_avg(int menu_rating_avg) {
		this.menu_rating_avg = menu_rating_avg;
	}

	public String getMenu_photo_ip() {
		return menu_photo_ip;
	}

	public void setMenu_photo_ip(String menu_photo_ip) {
		this.menu_photo_ip = menu_photo_ip;
	}

	public String getMenu_detail() {
		return menu_detail;
	}

	public void setMenu_detail(String menu_detail) {
		this.menu_detail = menu_detail;
	}

	public int getMenu_category_idx() {
		return menu_category_idx;
	}

	public void setMenu_category_idx(int menu_category_idx) {
		this.menu_category_idx = menu_category_idx;
	}
	

	
	
	



	
	
	
	

	
	

}
