<%-- 이영준(1/23 12:00) --%>
<%-- 최병훈 Category Menupan  메뉴링크 수정 01.23. 17:38 --%> 
<%-- 최병훈 전체링크 수정 01.24. 05:20 --%> 
<%-- 최병훈 (01/25. 08:30 - file/link 재설정, class수정) --%> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 백상희 :20240124 수정 시작 -->
<script type="text/javascript">
			
			$(document).ready(function(){
				$("#food_category_name img").click(function(){
					
					let food_category_name = $(this).attr("alt");
					/* 가게 인트로로 바꿔야 함 */
					location.href="${pageContext.request.contextPath}/seller/seller_intro.do?food_category_name="+food_category_name;
					
				})	
			})
			
		
</script>
<!-- 백상희 :20240124 수정 끝 -->
</head>

<body>

    <%-- 이영준(2/23 12:00) 등록 클릭 시(onclick) 다음 API연결 --%>	
	<%@ include file='addr_reg.jsp' %>


 
    <nav class="navbar navbar-expand-md sticky-top navbar-shrink py-3 navbar-light bg_e" id="mainNav">
        <div class="container">
        <button class="btn btn_e" type="button" onclick="find_addr();">등록</button>
        <input type="text" id="location" class="nav_loc" placeholder="위치정보">
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
        <span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav mx-auto navbar-expand-sd">
                <!-- 최병훈 : 2.240124 AM 05:21 링크수정 -->
                <!-- 백상희 : 20240124 경로 수정 -->
                <!-- 최병훈 : 20240125 AM 08:30 href/class 수정 css파일다시 받으세용~ -->
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/index.jsp"><img src="${ pageContext.request.contextPath }/assets/img/home.svg" alt="Home"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/seller/menu.jsp"><img src="${ pageContext.request.contextPath }/assets/img/clipboard.svg" alt="Menu"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/review/review.jsp"><img src="${ pageContext.request.contextPath }/assets/img/pen-tool.svg" alt="review"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/contacts.jsp"><img src="${ pageContext.request.contextPath }/assets/img/message-circle.svg" alt="qna"></a></li>
                </ul>
                
                <!-- 백상희 20240124 수정 시작-->
                <c:if test="${ empty sessionScope.user }">
                	<a id="login" role="button" href="${ pageContext.request.contextPath }/member/loginform.do" class="btn btn_e">로그인</a>
               		<a id="signup" role="button" href="${ pageContext.request.contextPath }/member/signupform.do" class="btn btn_e">회원가입</a> 
                </c:if>
                
                <c:if test="${ not empty sessionScope.user}">
                	<span>${ sessionScope.user.user_name } 님 환영합니다.</span>
                	                	
                	<c:if test="${ user.user_grade eq 'admin'}">
                		<a id="login" role="button" href="${ pageContext.request.contextPath }/member/logout.do" class="btn btn_e">로그아웃</a>
                		<a id="admin_page" role="button" href="${ pageContext.request.contextPath }/admin/admin_page.do" class="btn btn_e">관리자 페이지</a>
                	</c:if>	
                	
                	<c:if test="${ user.user_grade eq 'seller'}">
                		<a id="login" role="button" href="${ pageContext.request.contextPath }/member/logout.do" class="btn btn_e">로그아웃</a>
                		<a id="seller_page" role="button" href="${ pageContext.request.contextPath }/seller/seller_page.do" class="btn btn_e">판매자 페이지</a>
                	</c:if>
                	
                	<c:if test="${ user.user_grade eq 'buyer'}">
                		<a id="login" role="button" href="${ pageContext.request.contextPath }/member/logout.do" class="btn btn_e">로그아웃</a>
                		<a id="cart" role="button" href="${ pageContext.request.contextPath }/jumun/shopping-cart.do" class="btn btn_e">장바구니</a>
               		</c:if>
                </c:if>
  
                <!-- 백상희 20240124 수정 끝-->
            </div>
        </div>
    </nav>



    <div class="bg-primary-gradient">
        <!-- Top Banner -->
        <div class="container pt-1 pt-xl-5 c top_margin"><img class="tt_image" src="${ pageContext.request.contextPath }/assets/img/top_banner.png"></div>

        <!-- Category Menupan  메뉴링크 수정 01.23. 17:38 최병훈--> 
        <!-- Category Menupan  메뉴링크 수정 01.24. 05:22 최병훈--> 
        <!-- 백상희 : 20240124 수정 시작 -->
        <!-- 최병훈 : 20240125 href/class 수정 css파일다시 받으세용~ -->
        <div id="menu_box" class="container pt-4 pt-xl-1 c">
        	<div><a class="" href="${ pageContext.request.contextPath }/seller/menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_brand.png"  alt="브랜드관"></a></div>
            <div><a class="" href="${ pageContext.request.contextPath }/seller/menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_market.png" alt="전통시장"></a></div>
            <div><a class="" href="${ pageContext.request.contextPath }/seller/menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_kor.png" alt="한식"></a></div>
            <div><a class="" href="${ pageContext.request.contextPath }/seller/menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_china.png" alt="중식"></a></div>
            <div><a class="" href="${ pageContext.request.contextPath }/seller/menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_jpan.png" alt="일식"></a></div>
            <div><a class="" href="${ pageContext.request.contextPath }/seller/menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_asian.png" alt="동양"></a></div>
            <div><a class="" href="${ pageContext.request.contextPath }/seller/menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_night.png" alt="야식"></a></div>
            <div><a class="" href="${ pageContext.request.contextPath }/seller/menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_past.png" alt="분식"></a></div>
            <div><a class="" href="${ pageContext.request.contextPath }/seller/menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_chicken.png" alt="치킨"></a></div>
            <div><a class="" href="${ pageContext.request.contextPath }/seller/menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_disert.png" alt="후식"></a></div>
            <div><a class="" href="${ pageContext.request.contextPath }/seller/menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_leg.png" alt="족발"></a></div>
            <div><a class="" href="${ pageContext.request.contextPath }/seller/menu_intro.jsp"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_pizza.png" alt="피자"></a></div>
        </div>
        <!-- 백상희 : 20240124 수정 끝 -->
        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>

        
