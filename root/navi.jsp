<%-- 이영준(2/23 12:00) --%>

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
                <a id="login" role="button" href="login.jsp" class="btn btn_e">로그인</a>
                <a id="signup" role="button" href="signup.jsp" class="btn btn_e">회원가입</a>
                <a id="cart" role="button" href="shopping-cart.jsp" class="btn btn_e">장바구니</a>
            </div>
        </div>
    </nav>

        <nav class="navbar navbar-expand-md sticky-top navbar-shrink py-3 navbar-light" id="mainNav">
        <div class="container"><a class="navbar-brand d-flex align-items-center" href="/"><span class="bs-icon-sm bs-icon-circle bs-icon-primary shadow d-flex justify-content-center align-items-center me-2 bs-icon"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-bezier">
                        <path fill-rule="evenodd" d="M0 10.5A1.5 1.5 0 0 1 1.5 9h1A1.5 1.5 0 0 1 4 10.5v1A1.5 1.5 0 0 1 2.5 13h-1A1.5 1.5 0 0 1 0 11.5v-1zm1.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1zm10.5.5A1.5 1.5 0 0 1 13.5 9h1a1.5 1.5 0 0 1 1.5 1.5v1a1.5 1.5 0 0 1-1.5 1.5h-1a1.5 1.5 0 0 1-1.5-1.5v-1zm1.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1zM6 4.5A1.5 1.5 0 0 1 7.5 3h1A1.5 1.5 0 0 1 10 4.5v1A1.5 1.5 0 0 1 8.5 7h-1A1.5 1.5 0 0 1 6 5.5v-1zM7.5 4a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1z"></path>
                        <path d="M6 4.5H1.866a1 1 0 1 0 0 1h2.668A6.517 6.517 0 0 0 1.814 9H2.5c.123 0 .244.015.358.043a5.517 5.517 0 0 1 3.185-3.185A1.503 1.503 0 0 1 6 5.5v-1zm3.957 1.358A1.5 1.5 0 0 0 10 5.5v-1h4.134a1 1 0 1 1 0 1h-2.668a6.517 6.517 0 0 1 2.72 3.5H13.5c-.123 0-.243.015-.358.043a5.517 5.517 0 0 0-3.185-3.185z"></path>
                    </svg></span><span>동네가게</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="product.html">Menu</a></li>
                    <li class="nav-item"><a class="nav-link" href="review.html">Review</a></li>
                    <li class="nav-item"><a class="nav-link" href="contacts.html">Contacts</a></li>
                    <li class="nav-item"></li>
                </ul><a class="btn btn-primary shadow" role="button" href="login.html">로그인</a><a href="#"><button class="btn btn-primary" id="signup" type="button">회원가입</button></a><a href="#"><button class="btn btn-primary" type="button">장바구니</button></a>
            </div>
        </div>
    </nav>


    <div class="bg-primary-gradient">
        <!-- Top Banner -->
        <div class="container pt-4 pt-xl-5 c"><img class="tt_image" src="assets/img/brands/top_banner.png"></div>

        <!-- Category Menupan -->
        <div class="container pt-4 pt-xl-1 c">
            <a class="btn_e" href="#"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_market.png" width="100px" href="#" alt="전통시장"></a>
            <a class="btn_e" href="#"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_kor.png" width="100px" href="#" alt="한식"></a>
            <a class="btn_e" href="#"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_china.png" width="100px" href="#" alt="중식"></a>
            <a class="btn_e" href="#"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_jpan.png" width="100px" href="#" alt="일식"></a>
            <a class="btn_e" href="#"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_asian.png" width="100px" href="#" alt="동양"></a>
            <a class="btn_e" href="#"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_night.png" width="100px" href="#" alt="야식"></a>
            <a class="btn_e" href="#"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_past.png" width="100px" href="#" alt="분식"></a>
            <a class="btn_e" href="#"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_chicken.png" width="100px" href="#" alt="치킨"></a>
            <a class="btn_e" href="#"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_disert.png" width="100px" href="#" alt="후식"></a>
            <a class="btn_e" href="#"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_leg.png" width="100px" href="#" alt="족발"></a>
            <a class="btn_e" href="#"><img id="food_category_name" name="food_category_name" class="category" src="assets/img/products/cate_pizza.png" width="100px" href="#" alt="피자"></a>
        </div>
        
        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>

        
