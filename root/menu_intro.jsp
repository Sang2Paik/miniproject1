<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    	<!-- Header -->
	<%@ include file="header.jsp" %>
        <!-- Navi -->
        <%@ include file="navi.jsp" %>






        

      <script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.slim.min.js"></script>

    <!--  menu Style  -->
    <style id="compiled-css" type="text/css">
        body { background: #f4f4f4; }
        .banner { background-image: url(./food_title.jpg); background-repeat: no-repeat;}
    </style>
    <script id="insert"></script>
        


    <div class="container-fluid">
  <div class="px-lg-5">

    <!-- Menu Title -->
    <div class="row py-5">
      <div class="col-lg-12 mx-auto">
        <div class="text-white p-5 shadow-sm rounded banner">
          <h1 class="display-4">추천 메뉴</h1>
          <p class="lead">산지 직송 신싱한 재료로 만든 신선한 먹거리들</p>
          
        </div>
      </div>
    </div>
    <!-- menu title End -->

    <div class="row">


      <!-- Gallery item -->
      <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
        <div class="bg-white rounded shadow-sm"><a href="food_detail.jsp"><img id="menu_photo" name="menu_photo" src="./assets/img/brands/food_p01.jpg" alt="" class="img-fluid card-img-top"></a>
          <div class="p-4">
            <h5> <a href="food_detail.jsp" class="text-dark">스시마츠모토 4.0</a></h5>
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
        <div class="bg-white rounded shadow-sm"><a href="food_detail.jsp"><img id="menu_photo" name="menu_photo" src="./assets/img/brands/food_p02.jpg" alt="" class="img-fluid card-img-top"></a>
          <div class="p-4">
            <h5> <a href="food_detail.jsp" class="text-dark">꿰뚫 평가중</a></h5>
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
        <div class="bg-white rounded shadow-sm"><a href="food_detail.jsp"><img id="menu_photo" name="menu_photo" src="./assets/img/brands/food_p03.jpg" alt="" class="img-fluid card-img-top"></a>
          <div class="p-4">
            <h5> <a href="food_detail.jsp" class="text-dark">비금도 청담점</a></h5>
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
        <div class="bg-white rounded shadow-sm"><a href="food_detail.jsp"><img id="menu_photo" name="menu_photo" src="./assets/img/brands/food_p04.jpg" alt="" class="img-fluid card-img-top"></a>
          <div class="p-4">
            <h5> <a href="food_detail.jsp" class="text-dark">권숙수 무침</a></h5>
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
        <div class="bg-white rounded shadow-sm"><a href="food_detail.jsp"><img id="menu_photo" name="menu_photo" src="./assets/img/brands/food_p05.jpg" alt="" class="img-fluid card-img-top"></a>
          <div class="p-4">
            <h5> <a href="food_detail.jsp" class="text-dark">Pineapple</a></h5>
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
        <div class="bg-white rounded shadow-sm"><a href="food_detail.jsp"><img id="menu_photo" name="menu_photo" src="./assets/img/brands/food_p06.jpg" alt="" class="img-fluid card-img-top"></a>
          <div class="p-4">
            <h5> <a href="food_detail.jsp" class="text-dark">Yellow banana</a></h5>
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


<!-- Navi -->
        <%@ include file="footer.jsp" %>


    </body>

    </html>
