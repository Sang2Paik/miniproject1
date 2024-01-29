<!-- 최병훈2024.01.26  -->
<!-- 이영준2024.01.29 --> 
<!-- seller_menu_view.jsp -->
<!-- 상점 메뉴 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- jstl library (foreach, fn..등) --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Bootstrap library -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/itemDetail.css">
<link rel="stylesheet" type="text/css" href="https://site-assets.fontawesome.com/releases/v6.5.1/css/all.css">

<script type="text/javascript">

	//전역변수
	let g_menu_idx;       //수정/삭제할 menu_idx
	let g_seller_idx;     
	let g_menu_photo;     //menu 파일명

	
	function show_detail(menu_idx) {
	
		//alert(menu_idx+"상세보기");

		//Ajax이용 menu_idx에 해당하는 게시물 정보 가져와서
	 	$.ajax({
			url		 : "menu_one.do",  //SellerMenuOneAction
			data	 : {"menu_idx" : menu_idx},
			dataType : "json",
			success	 : function (res_data) {
				//res_data={"menu_idx":1, "menu_name":"이름", "menu_category":"내용",...}
				
				//수정 삭제, 다운로드 등 위해
				g_menu_idx 	 = res_data.menu_idx ;
				g_seller_idx = res_data.seller_idx
				g_menu_photo = res_data.menu_photo ;
				let created_date = res_data.menu_created_date.substr(0,10);
				let modified_date = res_data.menu_modified_date.substr(0,10);
				
				//alert(g_menu_photo);
				//팝업창에 띄우기
				//팝업창 (Modal)
				//$("#myModal").modal({backdrop: "static"});   //jquery $, backdro static : 모달 밖의 창 눌러도 안닫힘
				//$("#myModal").modal();
				$("#btn_modal").click();
				
		
				
				$("#popup_menu_name").html(res_data.menu_name);
				$("#popup_menu_category_name").html("<b>카테고리: </b>" +res_data.menu_category_name);
				$("#popup_menu_price").html("<b>가격: </b>" +res_data.menu_price);
				$("#popup_menu_detail").html("<b>메뉴소개: </b>" +res_data.menu_detail);
				$("#popup_menu_created_date").html("<b>생성날짜: </b>" + created_date);
				$("#popup_menu_modified_date").html("<b>수정날짜: </b>" + modified_date);
				$("#popup_menu_rating_avg").html("<b>평점: </b>" +res_data.menu_rating_avg);
				$("#popup_menu_status").html("<b>상태: </b>" +res_data.menu_status);
				
				//<img id="popup_image" src="">
				$("#popup_image").attr("src", "../upload/" + res_data.menu_photo)
 
			},
			error	 : function (err) {
				alert(err.responseText)
			}
		}); //end: ajax
	} // end:show_detail
	
	function logout() {
		if(confirm('정말 로그아웃하시겠습니까?')==false) return;
		
		//로그아웃 처리 필요
		alert('로그아웃처리 필요!')
		location.href="../index.jsp";  
	}

</script>


<style type="text/css">
	#menu_photo{
		width: 100px;
		height: 100px;
	}
	.t{
		border: 1px solid red;}
	
	.wid50{
		width: 50%;
	}
	
	.wid30{
		width: 40%;
	}
	
	.blank_msg{color:#333; 
	background-color: #eee; 
	border-top-left-radius:10px;
	border-top-right-radius:10px;
	}
	
	.tpd{
	padding: 5px;
	}
	
	.btnbg{
	background-color: #fff;}
	
</style>

</head>
<body>



<!-- Header -->
<%@ include file="/header.jsp" %>
<!-- Navi -->
<%@ include file="/navi_sm.jsp" %>

<%@include file="seller_menu_popup.jsp" %>



			<!-- Contents -->
        <div class="container pt-4 pt-xl-5 c">
	
	        <main id="content">
            <div class="container">
                <div class="row shop_tt">


                    <article class="col-md-12 article affix-purchase-target">
                        <div class="content-inner" role="toolbar">
                        
                        
          
                        
                            <div class="page-header">
                                <h1 class="page-title"> '${ seller_vo.seller_name }'의 메뉴목록</h1>
                            </div><!-- .page-header -->

                            <!--.page-body -->
                            <div class="tab-content">
	
	
                                    <div class="delivery-info block">
										<div class="container mt-3">





<div>
	<div>
<%-- 	 <h2>'${ seller_vo.seller_name }'의 Menu</h2> --%>
		<!-- 등록된 메뉴가 없으면 -->
		<c:if test="${ empty menu_list }">
			<div class="blank_msg">
				<p style="color: red">등록된 메뉴가 없습니다.</p>
			</div>
		</c:if>
		<c:if test="${ !empty menu_list }">
		<table class="table table-striped">
		    <tbody>
			<tr>
				<th>번호</th>
				<th>메뉴이름</th>
				<th>메뉴카테고리</th>
				<th>메뉴사진</th>
				<th>메뉴가격</th>
				<th>메뉴상세</th>

			</tr>
		
		<!-- for(MenuVo vo : list) 동일 -->
			<c:forEach var="vo" items="${ menu_list }" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td>${vo.menu_name}</td>
				<td>${vo.menu_category_name}</td>
				<td>
					<img id="menu_photo" src="${ pageContext.request.contextPath }/upload/${ vo.menu_photo }">
				</td>
				<td>${vo.menu_price}</td>

				<td>
					 <!-- 메뉴 수정 메뉴 팝업창에서 처리 예정-->
		            <input type="button" class="btn btn-primary"  class="btn wid30 btn_cart"
		                   value="메뉴상세" onclick="show_detail('${ vo.menu_idx }');">
		            
	            </td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		</c:if>
	<br>
	
	<input type="button" class="btn btn_cart"  value="메뉴등록" onclick="location.href='menu_reg_form.do?seller_idx=${ seller_vo.seller_idx }'">
	<input type="button" class="btn btn_cart"  value="상점목록보기" onclick="location.href='seller_page.do?user_idx=${user.user_idx}'">
	
	</div>
</div>
                                    </div>
                                  </div>
                                
                                
                            </div>
                        	<!-- End // .page-body -->
                        </div>
                    </article>


				</div>
			</div>
		</main>
	</div>

</body>
</html>
