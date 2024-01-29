<!-- 최병훈 : 2024.01.26 pm05:50 -->
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
	
		.text_left{
		width: 100%;
		border: 1px solid #eee;
		text-align: left;
		padding: 10px;
		font-size: 12px;
		margin: 10px 0px;
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


                    <article class="col-md-9 article affix-purchase-target">
                        <div class="content-inner" role="toolbar">
                            <div class="page-header">
                                <h1 class="page-title"> ${vo.seller_name} 상세정보
                                    <small>신선한 재료만 사용합니다</small>
                                </h1>
                            </div><!-- .page-header -->

                            <!-- Tab panes -->
                            <div class="tab-content">

                                <!-- 메뉴 소개 -->
                                <div role="tabpanel" class="tab-pane active" id="description">
                                    <p><img id="seller_photo" src="${ pageContext.request.contextPath }/upload/${ vo.seller_photo }"></p>
                                    
                                    <div class="delivery-info block">
                                        <div class="content">
                                            <h4 class="date">대 표 메 뉴</h4>
                                    	<br><br><br>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
    <div class="row">


      <!-- Gallery item -->
      <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
        <div class="bg-white rounded shadow-sm"><a href="menu_detail.jsp"><img id="menu_photo" name="menu_photo" 
        src="${pageContext.request.contextPath}/assets/img/food_p01.jpg" alt="메뉴사진" class="img-fluid card-img-top  product"></a>
          <div class="p-4 productsub">
            <h5> <a href="menu_detail.jsp" class="text-dark">스시마츠모토 4.0</a></h5>
            <p class="small text-muted mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
            <div class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
              <p class="small mb-0"><i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold"></span></p>
              <div class="badge badge-danger px-3 rounded-pill font-weight-normal">New</div>
            </div>
          </div>
        </div>
      </div>
      <!-- End -->

      <!-- Gallery item -->
      <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
        <div class="bg-white rounded shadow-sm"><a href="menu_detail.jsp"><img id="menu_photo" name="menu_photo" 
        src="${pageContext.request.contextPath}/assets/img/food_p02.jpg" alt="" class="img-fluid card-img-top product"></a>
          <div class="p-4 productsub">
            <h5> <a href="menu_detail.jsp" class="text-dark">꿰뚫 평가중</a></h5>
            <p class="small text-muted mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
            <div class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
              <p class="small mb-0"><i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold"></span></p>
              <div class="badge badge-primary px-3 rounded-pill font-weight-normal">Trend</div>
            </div>
          </div>
        </div>
      </div>
      <!-- End -->

      <!-- Gallery item -->
      <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
        <div class="bg-white rounded shadow-sm"><a href="menu_detail.jsp"><img id="menu_photo" name="menu_photo" 
        src="${pageContext.request.contextPath}/assets/img/food_p03.jpg" alt="" class="img-fluid card-img-top product"></a>
          <div class="p-4 productsub">
            <h5> <a href="menu_detail.jsp" class="text-dark">비금도 청담점</a></h5>
            <p class="small text-muted mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
            <div class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
              <p class="small mb-0"><i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold"></span></p>
              <div class="badge badge-warning px-3 rounded-pill font-weight-normal text-white">Featured</div>
            </div>
          </div>
        </div>
      </div>
      <!-- End -->

      <!-- Gallery item -->
      <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
        <div class="bg-white rounded shadow-sm"><a href="menu_detail.jsp"><img id="menu_photo" name="menu_photo" 
        src="${pageContext.request.contextPath}/assets/img/food_p04.jpg" alt="" class="img-fluid card-img-top product"></a>
          <div class="p-4 productsub">
            <h5> <a href="menu_detail.jsp" class="text-dark">권숙수 무침</a></h5>
            <p class="small text-muted mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
            <div class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
              <p class="small mb-0"><i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold"></span></p>
              <div class="badge badge-success px-3 rounded-pill font-weight-normal">Hot</div>
            </div>
          </div>
        </div>
      </div>
      <!-- End -->

      <!-- Gallery item -->
      <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
        <div class="bg-white rounded shadow-sm"><a href="menu_detail.jsp"><img id="menu_photo" name="menu_photo" 
        src="${pageContext.request.contextPath}/assets/img/food_p05.jpg" alt="" class="img-fluid card-img-top product"></a>
          <div class="p-4 productsub">
            <h5> <a href="menu_detail.jsp" class="text-dark">Pineapple</a></h5>
            <p class="small text-muted mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
            <div class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
              <p class="small mb-0"><i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold"></span></p>
              <div class="badge badge-primary px-3 rounded-pill font-weight-normal">New</div>
            </div>
          </div>
        </div>
      </div>
      <!-- End -->

      <!-- Gallery item -->
      <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
        <div class="bg-white rounded shadow-sm"><a href="menu_detail.jsp"><img id="menu_photo" name="menu_photo" 
        src="${pageContext.request.contextPath}/assets/img/food_p06.jpg" alt="" class="img-fluid card-img-top product"></a>
          <div class="p-4 productsub">
            <h5> <a href="menu_detail.jsp" class="text-dark">Yellow banana</a></h5>
            <p class="small text-muted mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
            <div class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
              <p class="small mb-0"><i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold"></span></p>
              <div class="badge badge-warning px-3 rounded-pill font-weight-normal text-white">Featured</div>
            </div>
          </div>
        </div>
      </div>
      <!-- End -->

      <!-- Gallery item -->
      <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
        <div class="bg-white rounded shadow-sm"><a href="menu_detail.jsp"><img id="menu_photo" name="menu_photo" 
        src="${pageContext.request.contextPath}/assets/img/food_p06.jpg" alt="" class="img-fluid card-img-top product"></a>
          <div class="p-4 productsub">
            <h5> <a href="menu_detail.jsp" class="text-dark">Yellow banana</a></h5>
            <p class="small text-muted mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
            <div class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
              <p class="small mb-0"><i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold"></span></p>
              <div class="badge badge-warning px-3 rounded-pill font-weight-normal text-white">Featured</div>
            </div>
          </div>
        </div>
      </div>
      <!-- End -->

      <!-- Gallery item -->
      <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
        <div class="bg-white rounded shadow-sm"><a href="menu_detail.jsp"><img id="menu_photo" name="menu_photo" 
        src="${pageContext.request.contextPath}/assets/img/food_p06.jpg" alt="" class="img-fluid card-img-top product"></a>
          <div class="p-4 productsub">
            <h5> <a href="menu_detail.jsp" class="text-dark">Yellow banana</a></h5>
            <p class="small text-muted mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
            <div class="d-flex align-items-center justify-content-between rounded-pill bg-light px-3 py-2 mt-4">
              <p class="small mb-0"><i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold"></span></p>
              <div class="badge badge-warning px-3 rounded-pill font-weight-normal text-white">Featured</div>
            </div>
          </div>
        </div>
      </div>
      <!-- End -->


    </div>
    
                                    
                                    
                                    <!-- Event Coupon -->
        <div class="container pt-4 pt-xl-5 c">

                <h2 class="fw-bold st">EVENT COUPON</h2>

            <div class="row row-cols-md-3 d-flex justify-content-center">
                <div class="d-flex flex-column align-items-center align-items-sm-start">
                    <p class="bg-body-tertiary border rounded border-0 p-4 c">
                    <img src="${pageContext.request.contextPath}/assets/img/coupon_a.jpg" width="100%"></p><button class="btn_e" type="button" style="margin: 0px auto">쿠폰받기</button>
                </div>                <div class="d-flex flex-column align-items-center align-items-sm-start">
                    <p class="bg-body-tertiary border rounded border-0 p-4 c">
                    <img src="${pageContext.request.contextPath}/assets/img/coupon_b.jpg" width="100%"></p><button class="btn_e" type="button" style="margin: 0px auto">쿠폰받기</button>
                </div>                <div class="d-flex flex-column align-items-center align-items-sm-start">
                    <p class="bg-body-tertiary border rounded border-0 p-4 c">
                    <img src="${pageContext.request.contextPath}/assets/img/coupon_c.jpg" width="100%"></p><button class="btn_e" type="button" style="margin: 0px auto">쿠폰받기</button>
                </div>
            </div>
        </div>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                        </div>
                                    </div>

                                    

                                    

                                </div><!-- /메뉴 소개 -->




                            </div><!-- /.tab-content -->

                        </div><!-- /.content-inner -->

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

                                        <div class="block">
                                            <h4 name="" class="pd10">소개<br></h4>
                                            <h4 name="" class="text_left">${vo.seller_intro}</h4>
                                        </div>

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
