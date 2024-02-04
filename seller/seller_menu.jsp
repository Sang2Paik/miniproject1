<!-- 최병훈 : 2024.01.26 pm05:11 -->

<!-- seller_menu.jsp -->
<!-- 상점 메뉴정보 페이지 -->



<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
	<!-- Header -->
	<%@ include file="/header.jsp" %>
	<!-- Navi -->
<%-- 	<%@ include file="/navi_sm.jsp" --%> %>

    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/itemDetail.css">
    <link rel="stylesheet" type="text/css" href="https://site-assets.fontawesome.com/releases/v6.5.1/css/all.css">
    
    <style type="text/css">
	
		.text_left{
		width: 100%;
		border: 1px solid #eee;
		text-align: left;
		padding: 10px;
		font-size: 12px;
		margin: 10px 0px;
		}
	
    </style>


   

			<!-- Contents -->
        <div class="container pt-4 pt-xl-5 c">
	
	        <main id="content">
            <div class="container">
                <div class="row shop_tt">


                    <article class="col-md-9 article affix-purchase-target">
                        <div class="content-inner" role="toolbar">
                            <div class="page-header">
                                <h1 class="page-title"> 착한식당
                                    <small>신선한 재료만 사용합니다</small>
                                </h1>
                            </div><!-- .page-header -->

                            <!--.page-body -->
                            <div class="tab-content">
	
	
                                    <div class="delivery-info block">
										<div class="container mt-3">
										  <h2>주문 조회</h2>
										  <table class="table table-striped">
										    <thead>
										      <tr>
										        <th>Firstname</th>
										        <th>Lastname</th>
										        <th>Email</th>
										      </tr>
										    </thead>
										    <tbody>
										      <tr>
										        <td>John</td>
										        <td>Doe</td>
										        <td>john@example.com</td>
										      </tr>
										      <tr>
										        <td>Mary</td>
										        <td>Moe</td>
										        <td>mary@example.com</td>
										      </tr>
										      <tr>
										        <td>July</td>
										        <td>Dooley</td>
										        <td>july@example.com</td>
										      </tr>
										    </tbody>
										  </table>
										</div>
                                    </div>
                                
                                
                            </div>
                        	<!-- End // .page-body -->
                        </div>
                    </article>










                    <!-- Sidebar -->
                    <aside id="sidebar" class="col-md-3 sidebar">

                        <section class="content-inner purchase-option affix" style="top: 10px;">
                            <div class="order box clearfix">
                                <div class="mobile-toggle"></div>
                                <button class="mobile-share-btn">
                                    
                                </button>
                                

                                <div class="purchase-option-inner">
                                    

                                    


                                    <div class="shipping-box module-box">


                                        <div class="block">
                                            <h4 name="" class="pd10">상점이름<br></h4>
											<h4 name="" class="text_left">착한식당</h4>
                                        </div>

                                        <div class="block">
                                            <h4 name="" class="pd10">주소<br></h4>
                                            <h4 name="" class="text_left">서울시 서초구 서초대로 77길 41</h4>
                                        </div><!-- /.item-selection -->

                                        <div class="block">
                                            <h4 name="" class="pd10">영업 시간<br></h4>
                                            <h4 name="" class="text_left">10:00 ~ 22:00</h4>
                                        </div><!-- /.item-selection -->

                                        <div class="block">
                                            <h4 name="" class="pd10">휴무일<br></h4>
                                            <h4 name="" class="text_left">연중무휴</h4>
                                        </div>

                                        <div class="block">
                                            <h4 name="" class="pd10">상태<br></h4>
                                            <h4 name="" class="text_left">영업중</h4>
                                        </div>
                                        
                                        <div class="block">
                                            <h4 name="" class="pd10">음식카테고리<br></h4>
                                            <h4 name="" class="text_left">
                                                <img id="menu_photo" class="menu_icon" 
                                                name="menu_photo" src="${pageContext.request.contextPath}/assets/img/cate_asian.png" alt="동양음식">
												<img id="menu_photo" class="menu_icon" 
												name="menu_photo" src="${pageContext.request.contextPath}/assets/img/cate_jpan.png" alt="일식"> 
												<img id="menu_photo" class="menu_icon" 
												name="menu_photo" src="${pageContext.request.contextPath}/assets/img/cate_kor.png" alt="한식"> 
                                            </h4>
                                        </div>

                                        <div class="block">
                                            <h4 name="" class="pd10">평점<br></h4>
											<h4 name="" class="text_left">★★★★☆</h4>
                                        </div><!-- /.item-selection -->

                                        
                                    </div><!-- /.total-price-box -->

                                    <div><button class="btn wid100 btn_cart">메뉴등록</button></div>
                                    <div><button class="btn wid100 btn_order">타임세일등록</button></div>
                                    


                                </div><!-- /.purchase-option-inner -->
                            </div>





                        </section><!-- /.content-inner -->

                    </aside>

                </div>

            </div>
        </main><!-- /#content-box -->
	
</div>

        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>


		<!-- Footer -->
        <%@ include file="/footer.jsp" %>


    </body>

    </html>
