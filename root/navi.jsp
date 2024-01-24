<%-- 이영준(2/23 12:00) --%>
<%-- Category Menupan  메뉴링크 수정 01.23. 17:38 최병훈--%> 

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

    <nav class="navbar navbar-expand-md sticky-top navbar-shrink py-3 navbar-light" id="mainNav">
        <div class="container">
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <button class="btn_up" type="button" onclick="find_addr();">등록</button><input type="text" id="location" class="nav_loc" placeholder="위치정보">
            <div class="collapse navbar-collapse" id="navcol-1">
                 <ul class="navbar-nav mx-auto navbar-expand-md">
                
                <!-- 백상희 : 20240124 경로 수정 -->
                    <li class="nav-item"><a class="btn_m c" href="index.jsp"><img src="${ pageContext.request.contextPath }/assets/img/home.svg" alt="Home"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="menu.jsp"><img src="${ pageContext.request.contextPath }/assets/img/clipboard.svg" alt="Menu"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="review.jsp"><img src="${ pageContext.request.contextPath }/assets/img/pen-tool.svg" alt="review"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="contacts.jsp"><img src="${ pageContext.request.contextPath }/assets/img/message-circle.svg" alt="qna"></a></li>
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
        <!-- 백상희 : 20240124 경로 수정 -->
        <div class="container pt-4 pt-xl-5 c"><img class="tt_image" src="${ pageContext.request.contextPath }/assets/img/brands/top_banner.png"></div>

        <!-- Category Menupan  메뉴링크 수정 01.23. 17:38 최병훈--> 
         <!-- 백상희 : 20240124 수정 시작 -->
        <div class="container pt-4 pt-xl-1 c" id="food_category_idx">
            <a class="btn_e" href="#"><img name="food_category_idx" class="category" src="${ pageContext.request.contextPath }/assets/img/products/cate_market.png" width="100px" href="#" alt="1"></a>
            <a class="btn_e" href="#"><img name="food_category_idx" class="category" src="${ pageContext.request.contextPath }/assets/img/products/cate_kor.png" width="100px" href="#" alt="2"></a>
            <a class="btn_e" href="#"><img name="food_category_idx" class="category" src="${ pageContext.request.contextPath }/assets/img/products/cate_china.png" width="100px" href="#" alt="3"></a>
            <a class="btn_e" href="#"><img name="food_category_idx" class="category" src="${ pageContext.request.contextPath }/assets/img/products/cate_jpan.png" width="100px" href="#" alt="4"></a>
            <a class="btn_e" href="#"><img name="food_category_idx" class="category" src="${ pageContext.request.contextPath }/assets/img/products/cate_asian.png" width="100px" href="#" alt="5"></a>
            <a class="btn_e" href="#"><img name="food_category_idx" class="category" src="${ pageContext.request.contextPath }/assets/img/products/cate_night.png" width="100px" href="#" alt="6"></a>
            <a class="btn_e" href="#"><img name="food_category_idx" class="category" src="${ pageContext.request.contextPath }/assets/img/products/cate_past.png" width="100px" href="#" alt="7"></a>
            <a class="btn_e" href="#"><img name="food_category_idx" class="category" src="${ pageContext.request.contextPath }/assets/img/products/cate_chicken.png" width="100px" href="#" alt="8"></a>
            <a class="btn_e" href="#"><img name="food_category_idx" class="category" src="${ pageContext.request.contextPath }/assets/img/products/cate_disert.png" width="100px" href="#" alt="9"></a>
            <a class="btn_e" href="#"><img name="food_category_idx" class="category" src="${ pageContext.request.contextPath }/assets/img/products/cate_leg.png" width="100px" href="#" alt="10"></a>
            <a class="btn_e" href="#"><img name="food_category_idx" class="category" src="${ pageContext.request.contextPath }/assets/img/products/cate_pizza.png" width="100px" href="#" alt="11"></a>
        </div>
        <!-- 백상희 : 20240124 수정 끝 -->
        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>

        
