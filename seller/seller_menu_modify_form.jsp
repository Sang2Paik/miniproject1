<!-- 최병훈 : 2024.01.26 pm04:55 -->

<!-- seller_menu_modify_form.jsp -->

<!-- 상점 메뉴 수정 폼 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
    
	<!-- Header -->
	<%@ include file="/header.jsp" %>
	<!-- Navi -->
	<%@ include file="/navi_sm.jsp" %>
	
<title>상점 메뉴수정</title>

    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/itemDetail.css">
    <link rel="stylesheet" type="text/css" href="https://site-assets.fontawesome.com/releases/v6.5.1/css/all.css">
    
<!-- Bootstrap 3.x library -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
		.text_left{
		width: 100%;
		border: 1px solid #eee;
		text-align: left;
		padding: 10px;
		font-size: 12px;
		margin: 10px 0px;
		}
		
		.t {
		border: 1px solid red;}
		
		.wid40{
		width: 48%;
		}
		
</style>

<script type="text/javascript">

	function send(f) {
		
		// 입력사항체크(제목/내용/사진)
		// 변수는 html 상 받아오는 정보 (name으로 받아오는 parameter)
		let menu_name  = f.menu_name.value;
		let menu_category  = f.menu_category.value;
		let menu_price  = f.menu_price.value;
		let menu_status  = f.menu_status.value;
		let menu_detail  = f.menu_detail.value;

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
		if(menu_price==''){
			alert('메뉴가격을 입력하세요');
			f.menu_price.value='';
			f.menu_price.focus();
			return;
		}
		
		if(menu_detail==''){
			alert('내용을 입력하세요');
			f.menu_detail.value='';
			f.menu_detail.focus();
			return;
		}
		
		f.action = 'menu_modify.do'; //SellerMenuModifyAction
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
        formData.append("menu_idx", '${ menu_vo.menu_idx }');
        formData.append("menu_photo", $("#ajaxFile")[0].files[0]);  //parameter이름(menu_photo)을 폼데이터 안에 줌
        
        /*  
        <form method='POST' encType="multipart/form-data">
        	<input name = "menu_idx" value="${ vo.menu_idx }">
        	<input name = "file" value="menu_photo">
        </form>
        */

       $.ajax({
             url  : "menu_photo_upload.do", //SellerMenuPhotoUploadAction
             type : "POST",
             data : formData,  //{"menu_idx":menu_idx, "":  , ...}
             processData : false,
             contentType : false,  //ajax시에는 반드시 잡아야 함
             dataType    : 'json',
             success : function(result_data) {
            	 //result_data = {"menu_photo":"aaa.jpg"}
            	 
            	 $("#my_img").attr("src","../upload/" + result_data.menu_photo);
             },
             error : function(err){
            	 alert(err.responseText);
             }
       });
	 }
	

</script>




			<!-- Contents -->
        <div class="container pt-4 pt-xl-5 c">
	
	        <main id="content">
           	 <div class="container">
                <div class="row shop_tt">


                    <article class="col-md-12 article affix-purchase-target">
                        <div class="content-inner" role="toolbar">
                            <div class="page-header">
                                <h1 class="page-title"> 메뉴수정하기</h1>
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

	<input type="hidden" name="menu_idx" value="${ menu_vo.menu_idx }">
	<input type="hidden" name="seller_idx" value="${ seller_vo.seller_idx }">	
	

      	  	<table class="table table-striped">
      	  		<!-- 이미지와 제목/내용 수정 이원화, 현재 파일에서는 제목/내용만 수정, 이미지는 ajax로 수정(background 통신) -->
      	  		 <tbody>
      	  		<tr>
      	  			<th>메뉴이름</th>
      	  			<td><input class="form-control" name="menu_name" value="${ menu_vo.menu_name }"></td>
      	  		</tr>
      	  		<tr>
      	  			<th>메뉴카테고리</th>
      	  				<td>
      	  				<select class="form-control" name=menu_category id="menu_category">
							<c:forEach var="vo" items='${ menu_category_list }' varStatus="i">
								<!-- value가 넘어감 -->
								<option value="${ vo.menu_category_idx }/${ vo.menu_category_name }">${ vo.menu_category_name }</option>
							</c:forEach>	
						</select>
      	  				</td>
      	  		</tr>
      	  		<tr>
      	  			<th>메뉴가격</th>
      	  			<td><input class="form-control" name="menu_price" value="${ menu_vo.menu_price }"></td>
      	  		</tr>
      	  		
      	  		<tr>
      	  			<th>메뉴소개</th>
      	  			<td>
      	  				<textarea class="form-control" rows="5" cols="" name="menu_detail">${ menu_vo.menu_detail }</textarea>
      	  			</td>
      	  		</tr>
      	  		<tr>
      	  			<th>등록이미지</th>
      	  			<td>
      	  				<img id="my_img" src="../upload/${ menu_vo.menu_photo }">
      	  				<br>
      	  				<br>
      	  				<input class="btn wid100 btn_cart" type="button" value="이미지수정" onclick="ajaxFileUpload();">
      	  			</td>
      	  		</tr>
      	  		<tr>
      	  			<th>메뉴상태</th>
      	  			<td>
						<select class="form-control" name="menu_status" id="menu_status">
							<option value="주문가능">주문가능</option>
							<option value="주문불가">주문불가</option>
						</select>
					</td>
      	  		</tr>
      	  	
      	  		<tr>
      	  			<th>확인사항</th>
      	  			<td>
      	  				<input class="btn wid40 btn_cart" type="button" value="수정하기"
      	  				       onclick="send(this.form);">
      	  				<input class="btn wid40 btn_cart" type="button" value="상점목록보기" 
      	  				       onclick="location.href='seller_page.do?user_idx=${user.user_idx}'">
      	  			</td>
      	  		</tr>
 				</tbody>
      	  	</table>
     	  

</form>



									
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