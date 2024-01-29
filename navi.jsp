<!--  최병훈 : 2024.01.29 PM 02:30 수정 -->


<%-- 이영준(1/23 12:00) --%>
<%-- 최병훈 Category Menupan  메뉴링크 수정 01.23. 17:38 --%> 
<%-- 최병훈 전체링크 수정 01.24. 05:20 --%> 
<%-- 최병훈 (01/25. 08:30 - file/link 재설정, class수정) --%> 
<%-- 최병훈 (01/25. 10:02 - category alt="숫자로 변경") --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 백상희 수정 : 20240126 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69bce271416004cb8d851f7b18a22898&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 백상희 :20240126 수정 시작 -->
<script type="text/javascript">
	var data;	
	var map;
	var coords;
	$(document).ready(function(){
		
		$("#map").hide();
				
		$("#menu_box img").click(function(){
			
			if("${not empty sessionScope.user}" == "true"){
				$("#map").show();
			}	
			
			if("${empty sessionScope.user}" == "true"){
				alert("로그인 후 이용해주세요.");
				return;
			}
		$("#btn_location").hide();
		$("#location").hide();
		$("#intro_banner").hide();
			
			//alert($(this).prop("src"));
			let food_category_name = $(this).prop("alt");
			
			/* 백상희 수정 지도부분 20240126*/
			
			 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    	    mapOption = {
	    	        center: new kakao.maps.LatLng(37.5012587, 127.0251386), // 지도의 중심좌표
	    	        level: 5 // 지도의 확대 레벨
	    	    };  

	    	// 지도를 생성합니다    
	    	map = new kakao.maps.Map(mapContainer, mapOption); 
	    	
	    	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		    var mapTypeControl = new kakao.maps.MapTypeControl();

		    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		    var zoomControl = new kakao.maps.ZoomControl();
		    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	    	// 주소-좌표 변환 객체를 생성합니다
	    	var geocoder = new kakao.maps.services.Geocoder();
	    	
	    	// 주소를 넣은 값을 불러와야함
			 let address = $("#location").val(); 
	    	// 주소로 좌표를 검색합니다
	    	geocoder.addressSearch(address, function(result, status) {
		
	    	coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	    	
	    	/* 가게 리스트 부분  */
		
			let indsMclsCode;
			
			if(food_category_name=="전통시장") 
				indsMclsCode = "G205";
			else if(food_category_name=="한식")
				indsMclsCode = "I201";
			else if(food_category_name=="중식")
				indsMclsCode = "I202";
			else if(food_category_name=="일식")
				indsMclsCode = "I203";
			else if(food_category_name=="양식")
				indsMclsCode = "I204";
			else if(food_category_name=="아시안")
				indsMclsCode = "I205";
			else if(food_category_name=="야식")
				indsMclsCode = "I211";
			else if(food_category_name=="분식")
				indsMclsCode = "I210";
			else if(food_category_name=="디저트")
				indsMclsCode = "I212";
			
			 				
 				$.ajax({
 					url : "seller/search.do",
 					data : {"cx" : result[0].x, 
 							"cy" : result[0].y, 
 							"indsMclsCode" : indsMclsCode
 					},
 					dataType : "json",
 					 success: function(res_data) {
						
 						//console.log(res_data);
 						data = res_data;
 						
 						 
 						show_markers();
 	 
 				        let htmlString = '<table><tr><th>번호</th><th>음식 카테고리명</th><th>가게 이름</th><th>도로명 주소</th></tr>';
				        $.each(res_data, function(index, obj) {
 				            htmlString += '<tr>';
 				            htmlString += '<td>' + index + '</td>';
 				            htmlString += '<td>' + obj.indsMclsNm + '</td>';
 				            htmlString += '<td>' + obj.bizesNm + '</td>';
 				            htmlString += '<td>' + obj.rdnmAdr + '</td>';
 				            htmlString += '</tr>';
 				        });

 				        htmlString += '</table>';

 				        $("#store_display").html(htmlString);

 				    },
 					error: function(err){
 						alert(err.responseText);
 					}
 				});//ajax end
	    	
	   	}); // geocoder search end  
	     	
			
		})	
	})
			
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	function show_markers(){
		
		// 정상적으로 검색이 완료됐으면 
  	    // if (status === kakao.maps.services.Status.OK) {
  	        // 결과값으로 받은 위치를 마커로 표시합니다
  	        var marker = new kakao.maps.Marker({
  	            map: map,
  	            position: coords
  	        });

  	        // 인포윈도우로 장소에 대한 설명을 표시합니다
  	        var infowindow = new kakao.maps.InfoWindow({
  	            content: '<div style="width:150px;text-align:center;padding:6px 0;">현재위치</div>'
  	        });
  	        infowindow.open(map, marker);

  	     
			 // for문 돌려서 좌표와 이름 구하기
		 	for (let i = 0; i < data.length; i++) {
				//좌표찍기
				
				// 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
									    
			    // 마커를 생성합니다
			    var marker1 = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: new kakao.maps.LatLng(data[i].lat, data[i].lon), // 마커를 표시할 위치
			        title : data[i].bizesNm, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			    
			 	// 인포윈도우로 장소에 대한 설명을 표시합니다
	   	        var infowindow = new kakao.maps.InfoWindow({
	   	            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + data[i].bizesNm + '</div>'
	   	        });
	   	        infowindow.open(map, marker1);

			}
  	      
  	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
  	        map.setCenter(coords);
 
  	  //  } // status search end 
		
	}
		
</script>
<!-- 백상희 :20240126 수정 끝 -->
</head>

<body>

    <%-- 이영준(2/23 12:00) 등록 클릭 시(onclick) 다음 API연결 --%>	
	<%@ include file='addr_reg.jsp' %> 


 	
    <nav class="navbar navbar-expand-md sticky-top navbar-shrink py-3 navbar-light bg_e" id="mainNav">
        <div class="container">
        <!-- 2024.01.29 최병훈 세션정보 없을때 disable -->
        <button disabled="disabled" id="btn_location" class="btn btn_e" type="button" onclick="find_addr();" style="opacity: 0.3">등록</button>
        <input type="text" disabled="disabled" id="location" class="nav_loc" placeholder="로그인 필요" value="${user.user_order_addr}" style="opacity: 0.5">
		<!-- /// End: 2024.01.29 최병훈 세션정보 없을때 disable -->
		
		
        <c:if test="${not empty sessionScope.user}">
        	<button id="btn_location" class="btn btn_e" type="button" onclick="find_addr();">등록</button>
	        <!-- 백상희 20240125 : 주문위치값 불러오는 부분 수정 -->
	        <input type="text" id="location" class="nav_loc" placeholder="주문위치 설정" value="${user.user_order_addr}">
	    </c:if>
        
                        
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
        <span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav mx-auto navbar-expand-sd">
                <!-- 최병훈 01.24 AM 05:21 링크수정 -->
                <!-- 백상희 : 20240124 경로 수정 -->
                <!-- 20240125 href/class 수정 css파일다시 받으세용~ -->
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/index.jsp"><img src="${ pageContext.request.contextPath }/assets/img/dongne_logo.png" alt="Home"></a></li>
                    
                    <!-- 최병훈 01.29 Menu hidden 
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/seller/menu.jsp"><img src="${ pageContext.request.contextPath }/assets/img/clipboard.svg" alt="Menu"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/review/review.jsp"><img src="${ pageContext.request.contextPath }/assets/img/pen-tool.svg" alt="review"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/contacts.jsp"><img src="${ pageContext.request.contextPath }/assets/img/message-circle.svg" alt="qna"></a></li>
                    -->
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
                		<a id="seller_page" role="button" href="${ pageContext.request.contextPath }/seller/seller_page.do?user_idx=${user.user_idx}" class="btn btn_e">판매자 페이지</a>
                	</c:if>
                	
                	<c:if test="${ user.user_grade eq 'buyer'}">
                		<a id="login" role="button" href="${ pageContext.request.contextPath }/member/logout.do" class="btn btn_e">로그아웃</a>
                		<a id="cart" role="button" class="btn btn_e" onclick="location.href='${ pageContext.request.contextPath }/member/mypage.do?user_idx='+${user.user_idx}">마이 페이지</a>
               		</c:if>
                </c:if>
  
                <!-- 백상희 20240124 수정 끝-->
            </div>
        </div>
    </nav>



    <div class="bg-primary-gradient">
        <!-- Top Banner -->
        <div class="container pt-1 pt-xl-5 c top_margin"><img class="tt_image" src="${ pageContext.request.contextPath }/assets/img/top_banner.png"></div>
	</div>
        <!-- Category Menupan  메뉴링크 수정 01.23. 17:38 최병훈--> 
        <!-- Category Menupan  메뉴링크 수정 01.24. 05:22 최병훈--> 
        <!-- 최병훈 : 20240125 href/class 수정 css파일다시 받으세용~ -->
       
        <div id="menu_box" class="container pt-4 pt-xl-1 c">
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_market.png" alt="전통시장"></a></div>
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_kor.png" alt="한식"></a></div>
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_china.png" alt="중식"></a></div>
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_jpan.png" alt="일식"></a></div>
			<div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_others.png" alt="양식"></a></div> <!-- 그림을 바꿔야함 -->
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_asian.png" alt="아시안"></a></div>
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_night.png" alt="야식"></a></div>
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_past.png" alt="분식"></a></div>
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_disert.png" alt="디저트"></a></div>

        </div>
        

        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>