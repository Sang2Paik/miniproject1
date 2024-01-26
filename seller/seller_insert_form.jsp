<!-- 최병훈 : 2024.01.26 pm04:55 -->

<!-- seller_insert_form.jsp -->
<!-- 상점페이지 -->



<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
	<!-- Header -->
	<%@ include file="/header.jsp" %>
	<!-- Navi -->
	<%@ include file="/navi_sm.jsp" %>

    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/itemDetail.css">
    <link rel="stylesheet" type="text/css" href="https://site-assets.fontawesome.com/releases/v6.5.1/css/all.css">
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<script type="text/javascript">
	function send(f){
			
			let seller_name = $("#seller_name").val();
			let seller_addr = $("#seller_addr").val();
			let seller_photo = $("#seller_photo").val();
			let seller_phone = $("#seller_phone").val();
			let delivery_type = $("#delivery_type").val();
			let seller_intro = $("#seller_intro").val();
			let seller_min_order_price = $("#seller_min_order_price").val();
			let seller_operation_hours = $("#seller_operation_hours").val();
			let seller_close_days = $("#seller_close_days").val();
			let seller_status = $("#seller_status").val();
			let food_category = $("#food_category").val();
			
			//입력사항체크
			if(seller_name==''){
				alert('상점이름을 입력하세요');
				f.seller_name.value='';
				f.seller_name.focus();
				return;
			}
			if(seller_addr==''){
				alert('상점주소를 입력하세요');
				f.seller_addr.value='';
				f.seller_addr.focus();
				return;
			}
			if(seller_photo==''){
				alert('상점사진을 입력하세요');
				f.seller_photo.value='';
				f.seller_photo.focus();
				return;
			}
			if(seller_phone==''){
				alert('상점전화번호을 입력하세요');
				f.seller_phone.value='';
				f.seller_phone.focus();
				return;
			}
			if(delivery_type==''){
				alert('배달/포장가능 여부를 입력하세요');
				f.delivery_type.value='';
				f.delivery_type.focus();
				return;
			}
			if(seller_intro==''){
				alert('상점소개를 입력하세요');
				f.seller_intro.value='';
				f.seller_intro.focus();
				return;
			}
			if(seller_min_order_price==''){
				alert('최소주문금액을 입력하세요');
				f.seller_min_order_price.value='';
				f.seller_min_order_price.focus();
				return;
			}
			if(delivery_type==''){
				alert('배달/포장가능 여부를 입력하세요');
				f.delivery_type.value='';
				f.delivery_type.focus();
				return;
			}
			if(seller_operation_hours==''){
				alert('영업시간을 입력하세요');
				f.seller_operation_hours.value='';
				f.seller_operation_hours.focus();
				return;
			}
			if(seller_close_days==''){
				//월~일로만 입력하도록 유효성 체크 필요!
				alert('휴무일을 입력하세요');
				f.seller_close_days.value='';
				f.seller_close_days.focus();
				
				return;
			}
			
			f.action = "seller_insert.do"; //SellerInsertAction
			f.submit();
			

	}
</script>



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


                    <article class="col-md-12 article affix-purchase-target">
                        <div class="content-inner" role="toolbar">
                            <div class="page-header">
                                <h1 class="page-title"> 상점등록</h1>
                            </div><!-- .page-header -->

                            <!--.page-body -->
                            <div class="tab-content">
	
	
                                    <div class="delivery-info block">
										<div class="container mt-3">
										
										
<form id="ajaxForm" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="user_idx" value="${ user.user_idx }"> 
										
										
										
										
										
										
										  <table class="table table-striped">

										    <tbody>
			<tr>
				<th>상점이름: </th>
				<td>
					<input name="seller_name" id="seller_name" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>주소: </th>
				<td>
					<input name="seller_addr" id="seller_addr" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>전화번호: </th>
				<td>
					<input name="seller_phone" id="seller_phone" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			
			<tr>
				<th>배달/포장: </th>
				<td>
					<select name='delivery_type' id="delivery_type" class="form-control select selectShippingArrivalDate">
						<option	value="포장">포장</option>
						<option	value="배달">배달</option>
						<option	value="포장&배달">포장&배달</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>소개: </th>
				<td>
					<input name="seller_intro" id="seller_intro" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>최소주문금액: </th>
				<td>
					<input name="seller_min_order_price" id="seller_min_order_price" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>운영시간</th>
				<td>
					<input name="seller_operation_hours" id="seller_operation_hours" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>휴무일</th>
				<td>
					<input name="seller_close_days" id="seller_close_days" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>사진: </th>
				<td>
					<input type="file" name="seller_photo" id="seller_photo" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>상태</th>
				<td>
					<select name="seller_status" id="seller_status" class="form-control select selectShippingArrivalDate">
						<option value="주문가능">주문가능</option>
						<option value="주문불가">주문불가</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>음식카테고리</th>
				<td>
	    	  		<select name="food_category" id="food_category">
						<c:forEach var="vo" items='${ food_category_list }' varStatus="i">
							<!-- value가 넘어감 -->
							<option value="${ vo.food_category_idx }/${ vo.food_category_name }">${ vo.food_category_name }</option>
						</c:forEach>	
					</select>
      	  		</td>
			</tr>
			<tr>
				<td colspan="2">
				
					
				</td>
			</tr>	
	
										    </tbody>
										  </table>

<div><input  type="button" class="btn wid100 btn_cart" onclick="send(this.form)" value="상점등록"></div>

	</form>
	<hr>
	<div id="disp">
<%-- 		<table>
			<tr>
				<th>상점이름: </th>
				<th>주소: </th> 
				<th>배달/포장: </th>
				<th>소개: </th>
				<th>최소주문금액: </th>
				<th>쿠폰만료기간: </th>
			</tr>
			<c:forEach var="vo" items="${list}" varStatus="i">
				<tr>
					<td>${ count.i }</td>
					<td>${vo.coupon_idx}</td>
					<td>${vo.coupon_name}</td>
					<td>${vo.coupon_content}</td>			
					<td>${vo.deducted_price}</td>			
					<td>${vo.coupon_min_order_price}</td>			
					<td>${vo.coupon_expired_date}</td>			
				</tr>		
			</c:forEach>
		
		</table> --%>
		
	
	
	</div>














										</div>
                                    </div>
                                
                                
                            </div>
                        	<!-- End // .page-body -->
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
