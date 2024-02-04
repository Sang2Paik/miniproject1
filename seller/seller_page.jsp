<!-- 최병훈 : 2024.01.26 pm04:55 -->
<!-- 이영준 : 2024.01.29 am 10:00  -->


<!-- seller_page.jsp -->
<!-- 판메자 메인 페이지 -->



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
		#seller_photo{
		width: 100px;
		height: 100px;
		}

    </style>


   

			<!-- Contents -->
        <div class="container pt-4 pt-xl-5 c">
	
	        <main id="content">
            <div class="container">
                <div class="row shop_tt">


                    <article class="col-md-12 article affix-purchase-target">
                        <div class="content-inner" role="toolbar">
                        
                        
          
                        
                            <div class="seller_list page-header">
                                <h1 class="seller_list page-title"><i class="f210 cmain">상점목록</i></h1>
                            </div><!-- .page-header -->

                            <!--.page-body -->
                            <!-- <div class="tab-content"> -->
	
	
                                    <div class="delivery-info block">
										<div class="container mt-3">
										
					
<div id="seller_dis">

<!-- 상점 출력창 -->					
										
										
										
										  <table class="table menu_table table-striped">

										    <tbody>
			<tr>
				<th>번호 </th>
				<th>상점이름 </th> 
				<th>사진 </th>
				<th>음식카테고리 </th>
				<th>상세보기 </th>
			</tr>
			<c:forEach var="vo" items="${seller_list}" varStatus="i">
				<tr>
					<td>${ i.count }</td>
					<td>${vo.seller_name}</td>
					<td>
						<img id="seller_photo" src="${ pageContext.request.contextPath }/upload/${ vo.seller_photo }">
					</td>		
					<td>${vo.food_category_name}</td>			
				<td>
					<input type="button" class="btn wid30 btn_menu"  value="상세보기" onclick="location.href='seller_detail.do?seller_idx='+${ vo.seller_idx }">

				</td>			

			</tr>		
		</c:forEach>	
	
										    </tbody>
										  </table>

</div>




										<!-- </div> -->
                                    </div>
                                
                                
                            </div>
                        	<!-- End // .page-body -->
						<input type="button" class="btn wid40 btn_cart" value="상점등록하기" onclick="location.href='seller_insert_form.do'">
						<input type="button" class="btn wid40 btn_cart" value="메인페이지" onclick="location.href='../main.do'">

                        </div>
                        
                	
                    </article>











					
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
