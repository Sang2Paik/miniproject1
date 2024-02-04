package vo.member; //백상희 생성 

public class MemberVo {
		
	 int user_idx; 			 
	 String user_name;
	 String user_id;    		 
	 String user_pwd;  	 	 
	 String user_cellphone;		 
	 String user_email;	         
	 String user_addr;		 
	 String user_order_addr;     
	 String user_grade;          
	 String user_created_date;  
	 String user_modified_date;
	 String user_proof;
	 String user_mask_pwd;
	 	 
	 
	 public String getUser_mask_pwd() {
		 
		int len = user_pwd.length();
		int half = len/2;
		
		StringBuffer sb = new StringBuffer();
		sb.append(user_pwd.substring(0, half));
		for(int i=0; i<len-half;i++) {
			sb.append("*");
		}		 
		return sb.toString();
	}


	public void setUser_mask_pwd(String user_mask_pwd) {
		this.user_mask_pwd = user_mask_pwd;
	}


	public String getUser_proof() {
		return user_proof;
	}


	public void setUser_proof(String user_proof) {
		this.user_proof = user_proof;
	}


	public MemberVo() {
		// TODO Auto-generated constructor stub
	}
	 
	 
	public MemberVo(String user_name, String user_id, String user_pwd, String user_cellphone, String user_email,
			String user_addr, String user_order_addr, String user_grade, String user_proof) {
		super();
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_cellphone = user_cellphone;
		this.user_email = user_email;
		this.user_addr = user_addr;
		this.user_order_addr = user_order_addr;
		this.user_grade = user_grade;
		this.user_proof = user_proof;
	}
	
	
	public MemberVo(int user_idx, String user_name, String user_id, String user_pwd, String user_cellphone,
			String user_email, String user_addr, String user_order_addr, String user_grade) {
		super();
		this.user_idx = user_idx;
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_cellphone = user_cellphone;
		this.user_email = user_email;
		this.user_addr = user_addr;
		this.user_order_addr = user_order_addr;
		this.user_grade = user_grade;
	}


	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_cellphone() {
		return user_cellphone;
	}
	public void setUser_cellphone(String user_cellphone) {
		this.user_cellphone = user_cellphone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_order_addr() {
		return user_order_addr;
	}
	public void setUser_order_addr(String user_order_addr) {
		this.user_order_addr = user_order_addr;
	}
	public String getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}
	public String getUser_created_date() {
		return user_created_date;
	}
	public void setUser_created_date(String user_created_date) {
		this.user_created_date = user_created_date;
	}
	public String getUser_modified_date() {
		return user_modified_date;
	}
	public void setUser_modified_date(String user_modified_date) {
		this.user_modified_date = user_modified_date;
	}
	 
	 
	 

}
