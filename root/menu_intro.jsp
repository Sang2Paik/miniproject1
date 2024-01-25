<!-- menu_intro.jsp -->
<!-- 최병훈 : 2024.01.25 pm04:48 Update -->



<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    	<!-- Header -->
		<%@ include file="/header.jsp" %>
		<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <!-- Navi -->
        <%@ include file="/navi_sm.jsp" %>
 
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/itemDetail.css">
    <link rel="stylesheet" type="text/css" href="https://site-assets.fontawesome.com/releases/v6.5.1/css/all.css">
    

    <!--  menu Style  -->
    <style id="compiled-css" type="text/css">
        body { background: #f4f4f4; }
        .banner { background-image: url(${pageContext.request.contextPath}/assets/img/food_title.jpg); background-repeat: no-repeat;}
    </style>
    <script id="insert"></script>
        


		<!-- Contents -->
        <div class="container pt-4 pt-xl-5 c">
       
       
       
       
		




    <div class="container-fluid">
  <div class="px-lg-5">

    <!-- Menu Title -->
    <div class="row py-5">
      <h1 class="display-4">추천 메뉴</h1>
          <p class="lead">산지 직송 신싱한 재료로 만든 신선한 먹거리들</p>
    </div>
    <!-- menu title End -->

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
    
  </div>
</div>




        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>
        
        
        
</div>
		<!-- Contents End -->
     

		<!-- footer -->
        <%@ include file="/footer.jsp" %>


    </body>

    </html>
