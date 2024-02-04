<!-- 최병훈 : 2024.01.31 am 10:04 // 상점제목+소개수정 강조용 폰트추가 f210 supersize-->
<!-- 최병훈 : 2024.01.26 pm 05:50 -->
<!-- 이영준 : 2024.01.29 am 10:50 -->


<!-- seller.jsp -->
<!-- 가맹점 점포 소개페이지 -->



<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
	<!-- Header -->
	<%@ include file="/header.jsp" %>
	<!-- Navi -->
	<%@ include file="/navi_sm.jsp" %>

    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/itemDetail.css">
    <link rel="stylesheet" type="text/css" href="https://site-assets.fontawesome.com/releases/v6.5.1/css/all.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <style type="text/css">
		@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
		}
		.text_left{
			width: 100%;
			border: 1px solid #eee;
			text-align: left;
			padding: 10px;
			font-size: 12px;
			margin: 10px 0px;
		}
		
		.image{
			max-width: 800px;
		}
		
		.in_pd{
			padding-top: 10px;
		}
		
		.fpre{
		    font-family: 'Pretendard-Regular', sans-serif;
		    font-size: 20px;
		    line-height: 30px;
		    text-align: justify;
		}
    </style>


<script type="text/javascript">

	function del() {
		
		var seller_idx = ${vo.seller_idx};
		var user_idx = ${user.user_idx};
		
		if(confirm('정말 삭제하시겠습니까?')==false) return;
		//삭제
		location.href='seller_delete.do?seller_idx=' + seller_idx + '&user_idx=' + user_idx;  //SellerDeleteAction
	}

</script>
   

			<!-- Contents -->
        <div class="container pt-4 pt-xl-5 c">
	
	        <main id="content">
            <div class="container">
                <div class="row shop_tt">


                    <article class="col-md-9 article affix-purchase-target in_pd">
                        <div class="content-inner" role="toolbar">
                            <div class="seller_detail page-header">
                            <!-- Font 210 Supersize 2024.01.31 최병훈 - 가게이름 / 가게 소개 수정 -->
                                <h1 class="page-title f210"> ${vo.seller_name}</h1>
                                <h4 name="" class="text_left fpre">
                                <img class=image id="seller_photo" src="${ pageContext.request.contextPath }/upload/${ vo.seller_photo }"><br>
                                ${vo.seller_intro}</h4>
                            <!-- //End -  Font 210 Supersize 2024.01.31 최병훈 -->
                            </div><!-- .page-header -->

                            <!-- Tab panes -->
                            <div class="tab-content">
								
                                <!-- 메뉴 소개 -->
                                <div role="tabpanel" class="tab-pane active" id="">
                                    
                                </div>
                                <!-- /메뉴 소개-->
                                    


                        	<!-- /.content-inner -->
						</div>
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
											<h4 name="" class="text_left">${vo.seller_name} </h4>
                                        </div>
                                        
                                        <div class="block">
                                            <h4 name="" class="pd10">음식카테고리<br></h4>
                                            <h4 name="" class="text_left">${vo.food_category_name}</h4>
                                        </div>

                                        <div class="block">
                                            <h4 name="" class="pd10">주소<br></h4>
                                            <h4 name="" class="text_left">${vo.seller_addr}</h4>
                                        </div>

                                        <div class="block">
                                            <h4 name="" class="pd10">전화번호<br></h4>
                                            <h4 name="" class="text_left">${vo.seller_phone}</h4>
                                        </div>

                                        <div class="block">
                                            <h4 name="" class="pd10">포장/배달여부<br></h4>
                                            <h4 name="" class="text_left">${vo.delivery_type}</h4>
                                        </div>
										<!--  최병훈 : 2024.01.30 소개위치 타이틀쪽으로 이동
                                        <div class="block">
                                            <h4 name="" class="pd10">소개<br></h4>
                                            <h4 name="" class="text_left">${vo.seller_intro}</h4>
                                        </div>-->

                                        <div class="block">
                                            <h4 name="" class="pd10">최소주문금액<br></h4>
                                            <h4 name="" class="text_left">${vo.seller_min_order_price}</h4>
                                        </div>

                                        <div class="block">
                                            <h4 name="" class="pd10">운영시간<br></h4>
                                            <h4 name="" class="text_left">${vo.seller_operation_hours}</h4>
                                        </div>

                                        <div class="block">
                                            <h4 name="" class="pd10">휴무일<br></h4>
                                            <h4 name="" class="text_left">${vo.seller_close_days}</h4>
                                        </div>

                                        <div class="block">
                                            <h4 name="" class="pd10">상태<br></h4>
                                            <h4 name="" class="text_left">${vo.seller_status}</h4>
                                        </div>

                                        <div class="block">
                                            <h4 name="" class="pd10">평점<br></h4>
											<h4 name="" class="text_left">★★★★☆</h4>
                                        </div><!-- /.item-selection -->

                                        
                                    </div><!-- /.total-price-box -->
									<input type="button" value="메뉴보기" class="btn wid100 btn_cart" onclick="location.href='seller_menu_view.do?seller_idx='+${ vo.seller_idx }">
									<input type="button" value="상점수정" class="btn wid100 btn_cart" onclick="location.href='seller_modify_form.do?seller_idx='+${ vo.seller_idx }">
									<input type="button" value="상점삭제" class="btn wid100 btn_order" onclick="del();">
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
