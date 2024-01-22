/*

	
	Create table minip_user
	(
		 user_idx  			 int primary key not null auto_increment,
		 user_name  	 	 varchar(100) not null,
		 user_id    		 varchar(100) unique not null,
		 user_pwd   	 	 varchar(100) not null,
		 user_cellphone		 varchar(100) not null,
		 user_email	         varchar(100) not null,
		 user_addr			 varchar(100) not null,
		 user_grade          varchar(100) not null,
		 user_created_date   datetime not null,
		 user_modified_date  datetime not null
	)
	
	Create table minip_coupon
	(
		coupon_idx          	int primary key not null auto_increment,
		user_idx               	int not null,
		coupon_name             varchar(100) not null,
		coupon_content			varchar(100) not null,
		deducted_price			int not null,
		coupon_min_order_price  int not null,
		coupon_created_date     datetime not null,
		coupon_expired_date     datetime not null,
		coupon_status           varchar(100) not null
	)
	
	alter table minip_coupon add constraint fk_minip_user_user_idx foreign key(user_idx) references minip_user(user_idx)
	
	Create table review
	(
		review_idx int primary key not null auto_increment,
		user_idx               	int not null,
		store_idx               int not null,
		menu_idx				int not null,
		menu_rating             int,
		review_content          text,
		review_photo            text,
		review_created_date		datetime not null,
		review_modified_date    datetime not null,
		review_status           varchar(100) not null
	)
	
	create table store
	(
		store_idx				int primary key not null auto_increment,
		store_name				varchar(100) not null,
		food_category_idx       int not null,
		store_addr				varchar(100) not null,
		store_photo				text,
		store_phone				varchar(100) not null,
		delivery_type			varchar(100) not null,
		store_intro				text,
		store_min_order_price	int not null,
		store_rating			int,
		store_review_num        int not null,
		store_operation_hours   varchar(100) not null,
		store_close_days        varchar(100) not null,
		store_created_date      datetime not null,
		store_modified_date		datetime not null,
		store_status			varchar(100) not null
	)
	
	create table food_category
	(
		food_category_idx    int primary key not null auto_increment, 
		food_category_name   varchar(100) not null
	)
	
	create table menu
	(
		menu_idx			int primary key not null auto_increment,
		store_idx			int not null,
		menu_name			varchar(100) not null,
		menu_category_idx   int not null,
		menu_photo          text,
		menu_price          int not null,
		menu_created_date   datetime not null,
		menu_modified_date  datetime not null,
		menu_status         varchar(100) not null,
		menu_rating_avg     int
	)
	
	create table menu_category
	(
		menu_category_idx  int primary key not null auto_increment,
		menu_category_name varchar(100) not null
	)
	
	create table jumun
	(
		jumun_idx				int primary key auto_increment,
		cart_idx				int not null,
		menu_idx				int not null,
		user_idx				int not null,
		store_idx				int not null,
		total_price				int not null,
		pay_method				varchar(100) not null,
		jumun_created_date		datetime not null,
		jumun_modified_date		datetime not null
	)
	
	alter table review add constraint fk_review_user_idx foreign key(user_idx) references minip_user(user_idx)
	alter table review add constraint fk_review_store_idx foreign key(store_idx) references store(store_idx)
	alter table review add constraint fk_review_menu_idx foreign key(menu_idx) references menu(menu_idx)
	
	alter table store add constraint fk_store_food_category_idx foreign key(food_category_idx) references food_category(food_category_idx)
	alter table store add constraint fk_store_food_category_idx foreign key(food_category_idx) references food_category(food_category_idx)
	
	alter table menu add constraint fk_menu_menu_category_idx foreign key(menu_category_idx) references menu_category(menu_category_idx)
	alter table menu add constraint fk_menu_store_idx foreign key(store_idx) references store(store_idx)
	
	create table sale_menu
	(
		sale_idx			int primary key auto_increment,
		menu_idx			int not null,
		store_idx			int not null,
		discount_rate		float not null,
		start_date_time  	datetime not null,
		end_date_time       datetime not null,
		menu_category_idx   int not null
	)
	
	alter table sale_menu add constraint fk_sale_menu_menu_idx foreign key(menu_idx) references menu(menu_idx)
	alter table sale_menu add constraint fk_sale_menu_store_idx foreign key(store_idx) references store(store_idx)
	alter table sale_menu add constraint fk_sale_menu_menu_category_idx foreign key(menu_category_idx) references menu_category(menu_category_idx)
	
	alter table cart add constraint fk_cart_menu_idx foreign key(menu_idx) references menu(menu_idx)
	
	create table cart
	(
		cart_idx	       int primary key not null auto_increment,
		menu_idx		   int not null,
		sale_idx		   int not null,
		menu_count         int not null,
		cart_price         int not null,
		cart_created_date  datetime not null,
		cart_modified_date datetime not null
	)
	
	alter table cart add constraint fk_cart_menu_idx foreign key(menu_idx) references menu(menu_idx)
	alter table cart add constraint fk_cart_sale_idx foreign key(sale_idx) references sale_menu(sale_idx)
	
	select * from menu

*/

