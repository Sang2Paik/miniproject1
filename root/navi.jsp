<%-- 이영준(2/23 12:00) --%>
<%-- Category Menupan  메뉴링크 수정 01.23. 17:38 최병훈--%> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>

<body>

    <%-- 이영준(2/23 12:00) 등록 클릭 시(onclick) 다음 API연결 --%>	
	<%@ include file='addr_reg.jsp' %>

    <nav class="navbar navbar-expand-md sticky-top navbar-shrink py-3 navbar-light" id="mainNav">
        <div class="container">
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <button class="btn_up" type="button" onclick="find_addr();">등록</button><input type="text" id="location" class="nav_loc" placeholder="위치정보">
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav mx-auto navbar-expand-md">
                    <li class="nav-item"><a class="btn_m c" href="index.jsp"><img src="./assets/img/home.svg" alt="Home"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="menu.jsp"><img src="./assets/img/clipboard.svg" alt="Menu"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="review.jsp"><img src="./assets/img/pen-tool.svg" alt="review"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="contacts.jsp"><img src="./assets/img/message-circle.svg" alt="qna"></a></li>
                </ul>
		   <c:if test="${ empty sessionScope.user }"><!-- 백상희 오후 4시 22분 수정 -->
                	<a id="login" role="button" href="loginform.do" class="btn btn_e">로그인</a>
               		<a id="signup" role="button" href="signupform.do" class="btn btn_e">회원가입</a> 
                </c:if>
                
                <c:if test="${ not empty sessionScope.user }"><!-- 백상희 오후 4시 22분 수정 -->
                	<span>${ sessionScope.user.user_name } 님 환영합니다.</span>
                	<a id="login" role="button" href="logout.do" class="btn btn_e">로그아웃</a>
                	<a id="cart" role="button" href="shopping-cart.jsp" class="btn btn_e">장바구니</a>
                </c:if>
            </div>
        </div>
    </nav>



    <div class="bg-primary-gradient">
        <!-- Top Banner -->
        <div class="container pt-4 pt-xl-5 c"><img class="tt_image" src="assets/img/brands/top_banner.png"></div>

        <!-- Category Menupan  메뉴링크 수정 01.23. 17:38 최병훈--> 
        <div class="container pt-4 pt-xl-1 c">
            <a class="btn_e" href="#"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_market.png" width="100px" href="#" alt="전통시장"></a>
            <a class="btn_e" href="menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_kor.png" width="100px" href="#" alt="한식"></a>
            <a class="btn_e" href="menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_china.png" width="100px" href="#" alt="중식"></a>
            <a class="btn_e" href="menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_jpan.png" width="100px" href="#" alt="일식"></a>
            <a class="btn_e" href="menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_asian.png" width="100px" href="#" alt="동양"></a>
            <a class="btn_e" href="menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_night.png" width="100px" href="#" alt="야식"></a>
            <a class="btn_e" href="menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_past.png" width="100px" href="#" alt="분식"></a>
            <a class="btn_e" href="menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_chicken.png" width="100px" href="#" alt="치킨"></a>
            <a class="btn_e" href="menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_disert.png" width="100px" href="#" alt="후식"></a>
            <a class="btn_e" href="menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_leg.png" width="100px" href="#" alt="족발"></a>
            <a class="btn_e" href="menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_pizza.png" width="100px" href="#" alt="피자"></a>
        </div>
        
        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>

        
