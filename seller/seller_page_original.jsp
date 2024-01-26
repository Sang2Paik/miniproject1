<!-- 최병훈 : 2024.01.26 pm04:55 -->

<!-- seller_page_original.jsp -->
<!-- 상점페이지 -->



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


   

			<!-- Contents -->
        <div class="container pt-4 pt-xl-5 c">
	
	        <main id="content">
            <div class="container">
                <div class="row shop_tt">


                    <article class="col-md-9 article affix-purchase-target">
                        <div class="content-inner" role="toolbar">
                        
                        
          
                        
                            <div class="page-header">
                                <h1 class="page-title"> 상점목록</h1>
                            </div><!-- .page-header -->

                            <!--.page-body -->
                            <div class="tab-content">
	
	
                                    <div class="delivery-info block">
										<div class="container mt-3">
										
					
<div id="seller_dis">

<!-- 상점 출력창 -->					
										
										
										
										  <table class="table table-striped">

										    <tbody>
			<tr>
			<th>번호 </th>
			<th>상점이름 </th> 
			<th>주소 </th>
			<th>전화번호 </th>
			<th>사진 </th>
			<th>포장/배달여부 </th>
			<th>소개 </th>
			<th>최소주문금액 </th>
			<th>운영시간</th>
			<th>휴무일</th>
			<th>상태 </th>
			<th>음식카테고리 </th>
			<th>메뉴보기 </th>
			<th>상점수정 </th>
		</tr>
			<c:forEach var="vo" items="${seller_list}" varStatus="i">
			<tr>
				<td>${ i.count }</td>
				<td>${vo.seller_name}</td>
				<td>${vo.seller_addr}</td>
				<td>${vo.seller_phone}</td>			
				<td>${vo.seller_photo}</td>			
				<td>${vo.delivery_type}</td>			
				<td>${vo.seller_intro}</td>			
				<td>${vo.seller_min_order_price}</td>			
				<td>${vo.seller_operation_hours}</td>			
				<td>${vo.seller_close_days}</td>			
				<td>${vo.seller_status}</td>			
				<td>${vo.food_category_name}</td>			
				<td>
					<input type="button" value="메뉴보기" onclick="location.href='seller_menu_view.do?seller_idx='+${ vo.seller_idx }">
				</td>			
				<td>
					<input type="button" value="상점수정" onclick="location.href='seller_modify_form.do'">
				</td>			

			</tr>		
		</c:forEach>	
	
										    </tbody>
										  </table>



<!-- 메뉴 출력창 -->
<div id="menu_disp">

<h3>[ ${ vo.seller_name }] 메뉴목록</h3>
</div>
	













										</div>
                                    </div>
                                
                                
                            </div>
                        	<!-- End // .page-body -->
                        </div>
                    </article>











					<div class="purchase-option-inner">
						<div><input type="button" class="btn wid100 btn_cart" value="등록하기" onclick="send(this.form);"></div>
						<div><input type="button" class="btn wid100 btn_cart" value="메인페이지" onclick="location.href='../index.jsp'"></div>
                	</div>
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
