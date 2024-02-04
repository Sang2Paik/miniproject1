<!-- 최병훈 : 2024.01.26 pm07:55 -->
<!-- 이영준 : 2024.01.29 am11:30 -->

<!-- seller_menu_reg_form.jsp -->
<!-- 상점 메뉴 수정 페이지 -->



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

	const regular_num = /^[0-9]{1,}$/;  /* 1,하면 무한대, max가 없음 */

	function send(f) {
		
		//입력사항체크(제목/내용/사진)
		// 변수는 html 상 받아오는 정보 (name으로 받아오는 parameter)
		let menu_name 	   = f.menu_name.value;
		let menu_category  = f.menu_category.value;
		let menu_price     = f.menu_price.value;
		let menu_detail    = f.menu_detail.value;
		let menu_photo 	   = f.menu_photo.value;
		
		if(menu_name==''){
			alert('메뉴이름을 입력하세요');
			f.menu_name.value='';
			f.menu_name.focus();
			return;
		}
		if(menu_category==''){
			alert('메뉴카테고리를 입력하세요');
			f.menu_category.value='';
			f.menu_category.focus();
			return;
		}
		// 정규식 이용 : 숫자체크
	 	if(regular_num.test(menu_price)==false){
			alert("최소주문금액은 숫자로 입력하세요");	
		    f.menu_price.value="";  //값지우기
		    f.menu_price.focus();   //포커스 넣기
			return; 
	 	}
		
		f.action = 'menu_reg.do'; //SellerMenuRegAction
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
                        
                        
                        <form method="POST" enctype="multipart/form-data">

	<input type="hidden" name="seller_idx" value="${ seller_vo.seller_idx }" class="form-control select selectShippingArrivalDate"> 		
                        
                        
                        
                        
                            <div class="page-header">
                                <h1 class="page-title"> 메뉴등록</h1>
                            </div><!-- .page-header -->

                            <!--.page-body -->
                            <!-- <div class="tab-content"> -->
	
	
                                    <div class="delivery-info block">
										<div class="container mt-3">
										
										
							
										
										  <table class="table table-striped">

										   
			<tr>
				<th>메뉴이름: </th>
				<td>
					<input class="form-control" name="menu_name" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>메뉴카테고리 </th>
				<td>
					<select class="form-control" name=menu_category id="menu_category" class="form-control select selectShippingArrivalDate">
						<c:forEach var="vo" items='${ menu_category_list }' varStatus="i">
							<!-- value가 넘어감 -->
							<option value="${ vo.menu_category_idx }/${ vo.menu_category_name }">${ vo.menu_category_name }</option>
						</c:forEach>	
					</select>
				</td>
			</tr>
			<tr>
				<th>메뉴가격 </th>
				<td>
					<input class="form-control" name="menu_price" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			
			<tr>
				<th>메뉴소개 </th>
				<td>
					<textarea class="form-control" rows="5" cols="" name="menu_detail" class="form-control select selectShippingArrivalDate"></textarea>
				</td>
			</tr>
			<tr>
				<th>사진 </th>
				<td>
					<input type="file"  name="menu_photo" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
      	  			<td colspan="2" align="center">
      	  				<input type="button" class="btn wid30 btn_cart"  type="button" value="등록하기" 
      	  				       onclick="send(this.form);">
      	  				<input type="button" class="btn wid30 btn_cart"  type="button" value="상점목록보기" 
      	  				       onclick="location.href='seller_page.do?user_idx=${user.user_idx}'">
      	  			</td>
      	  		</tr>
	
										   
										  </table>
										  
										  
										  
										  
									<!-- </div> -->
								</div>
							</div>
                        	<!-- End // .page-body -->

						</form>

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
