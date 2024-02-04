package vo.seller;

public class MenuCategoryVo {
	
	int menu_category_idx;
	String menu_category_name;
	
	public MenuCategoryVo() {
		// TODO Auto-generated constructor stub
	}

	public MenuCategoryVo(int menu_category_idx, String menu_category_name) {
		super();
		this.menu_category_idx = menu_category_idx;
		this.menu_category_name = menu_category_name;
	}

	public int getMenu_category_idx() {
		return menu_category_idx;
	}
	public void setMenu_category_idx(int menu_category_idx) {
		this.menu_category_idx = menu_category_idx;
	}
	public String getMenu_category_name() {
		return menu_category_name;
	}
	public void setMenu_category_name(String menu_category_name) {
		this.menu_category_name = menu_category_name;
	}
	
	

}
