<!-- 최병훈 : 2024.01.26 pm04:55 -->

<!-- seller_modify_form.jsp -->
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


<script type="text/javascript">

	function send(f) {
		
		// 입력사항체크(제목/내용/사진)
		// 변수는 html 상 받아오는 정보 (name으로 받아오는 parameter)
		let seller_name  = f.seller_name.value;
		let seller_addr  = f.seller_addr.value;
		let seller_phone  = f.seller_phone.value;
		let seller_operation_hours  = f.seller_operation_hours.value;
		let seller_close_days  = f.seller_close_days.value;

		
		if(seller_name==''){
			alert('상점이름을 입력하세요');
			f.seller_name.value='';
			f.seller_name.focus();
			return;
		}
		if(seller_addr==''){
			alert('주소를 입력하세요');
			f.seller_addr.value='';
			f.seller_addr.focus();
			return;
		}
		if(seller_phone==''){
			alert('전화번호를 입력하세요');
			f.seller_phone.value='';
			f.seller_phone.focus();
			return;
		}

		if(seller_operation_hours==''){
			alert('영업시간을 입력하세요');
			f.seller_operation_hours.value='';
			f.seller_operation_hours.focus();
			return;
		}
		if(seller_close_days==''){
			alert('휴무일을 입력하세요');
			f.seller_close_days.value='';
			f.seller_close_days.focus();
			return;
		}

		
		f.action = 'seller_modify.do'; //SellerModifyAction
		f.submit();
		
	}
	
	function ajaxFileUpload() {
	       // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
	       $("#ajaxFile").click();
	}
	
	function photo_upload() {

		//파일선택->취소시
		if( $("#ajaxFile")[0].files[0]==undefined)return;  //ajax파일은 내부적으로 배열로 관리됨 0: 첫번째 파일
		   
		//파일 선택이 되었으면   	   
		var form = $("ajaxForm")[0];
        var formData = new FormData(form);
        formData.append("seller_idx", '${ seller_vo.seller_idx }');
        formData.append("seller_photo", $("#ajaxFile")[0].files[0]);  //parameter이름(menu_photo)을 폼데이터 안에 줌
        
        /*  
        <form method='POST' encType="multipart/form-data">
        	<input name = "menu_idx" value="${ vo.menu_idx }">
        	<input name = "file" value="menu_photo">
        </form>
        */

       $.ajax({
             url  : "seller_photo_upload.do", //SellerPhotoUploadAction
             type : "POST",
             data : formData,  //{"seller_idx":seller_idx, "":  , ...}
             processData : false,
             contentType : false,  //ajax시에는 반드시 잡아야 함
             dataType    : 'json',
             success : function(result_data) {
            	 //result_data = {"seller_photo":"aaa.jpg"}
            	 
            	 $("#my_img").attr("src","../upload/" + result_data.seller_photo);
             },
             error : function(err){
            	 alert(err.responseText);
             }
       });
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
		
		.wid40{
		width: 40%;
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
                                <h1 class="page-title"> 상점수정하기</h1>
                            </div><!-- .page-header -->

                            <!--.page-body -->
                            <div class="tab-content">
	
	
                                    <div class="delivery-info block">
										<div class="container mt-3">
										
										
<!-- 파일수정용 폼 -->
<!--화일업로드용 폼  -->
<form enctype="multipart/form-data" id="ajaxForm" method="post">
    <input id="ajaxFile" type="file"  style="display:none;"  onChange="photo_upload();" >
    <!-- 이미지 수정 버튼을 클릭하면 위 file type이 눌린것처럼 (display:none-> hidden) -->
</form>
              
              		
<!-- 내용수정용 폼 -->
<form>
	<input type="hidden" name="seller_idx" value="${ seller_vo.seller_idx }">	
	<input type="hidden" name="user_idx" value="${ user.user_idx }">										
										
										
										
										
										  <table class="table table-striped">

										    <tbody>
			<tr>
				<th>상점이름</th>
				<td>
					<input class="form-control" name="seller_name" value="${ seller_vo.seller_name }" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>상점사진 </th>
				<td>
					<img id="my_img" src="../upload/${ seller_vo.seller_photo }">
      	  				<br>
      	  				<br>
      	  				<input class="btn wid100 btn_cart" type="button" value="이미지수정" onclick="ajaxFileUpload();">
				</td>
			</tr>
			<tr>
				<th>음식카테고리 </th>
				<td>
					<select class="form-control" name=food_category id="food_category" class="form-control select selectShippingArrivalDate">
							<c:forEach var="vo" items='${ food_category_list }' varStatus="i">
								<!-- value가 넘어감 -->
								<option value="${ vo.food_category_idx }/${ vo.food_category_name }">${ vo.food_category_name }</option>
							</c:forEach>	
						</select>
				</td>
			</tr>
			
			<tr>
				<th>주소 </th>
				<td>
					<input class="form-control" name="seller_addr" value="${ seller_vo.seller_addr }" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>전화번호 </th>
				<td>
					<input class="form-control" name="seller_phone" value="${ seller_vo.seller_phone }" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>포장/배달여부 </th>
				<td>
					<select name='delivery_type' id="delivery_type" class="form-control select selectShippingArrivalDate">
							<option	value="포장">포장</option>
							<option	value="배달">배달</option>
							<option	value="포장&배달">포장&배달</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>소개 </th>
				<td>
					<input class="form-control" name="seller_intro" value="${ seller_vo.seller_intro }" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>최소주문금액 </th>
				<td>
					<input class="form-control" name="seller_min_order_price" value="${ seller_vo.seller_min_order_price }" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>영업시간 </th>
				<td>
					<input class="form-control" name="seller_operation_hours" value="${ seller_vo.seller_operation_hours }" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>휴무일</th>
				<td>
					<input class="form-control" name="seller_close_days" value="${ seller_vo.seller_close_days }" class="form-control select selectShippingArrivalDate">
				</td>
			</tr>
			<tr>
				<th>상태 </th>
				<td>
					<select name="seller_status" id="seller_status" class="form-control select selectShippingArrivalDate">
						<option value="주문가능">주문가능</option>
						<option value="주문불가">주문불가</option>
					</select>
				</td>
			</tr>
	
										    </tbody>
										  </table>



	</form>
	


<div class="purchase-option-inner">
						<div><input type="button" class="btn wid40 btn_cart" value="등록하기" onclick="send(this.form);">
						<input type="button" class="btn wid40 btn_cart" value="메인페이지" onclick="location.href='../index.jsp'"></div>
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
