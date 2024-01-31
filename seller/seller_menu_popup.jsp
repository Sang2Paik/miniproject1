<!-- 최병훈 : 2024.01.29 pm05:30 -->


<!-- 최병훈 : 2024.01.26 pm04:55 -->

<!-- seller_menu_popup.jsp -->
<!-- 메뉴 상세 팝업 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>


    <!-- Bootstrap 5.3.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/Navbar-Centered-Brand-icons.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/itemDetail.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="https://site-assets.fontawesome.com/releases/v6.5.1/css/all.css">
    <!-- Font 210Supersize -->
    <script src="${pageContext.request.contextPath}/assets/js/font210.js"></script>
    

<script type="text/javascript">
	
	function del() {
		//alert(g_p_idx + "삭제");
		
		if(confirm('정말 삭제하시겠습니까?')==false) return;
		
		//삭제
		location.href="menu_delete.do?menu_idx=" + g_menu_idx +"&seller_idx=" + g_seller_idx ;      //SellerMenuDeleteAction
		
	} //end:del()
	
	function modify_form() {
		
		location.href="menu_modify_form.do?menu_idx=" + g_menu_idx + "&seller_idx=" + g_seller_idx;    //SellerMenuModifyFormAction
		
	}//end:modify_form()

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
		
		wid30{
			width: 30%;
		}
		#popup_image_box {
			width: 200px;
			height: 300px;
			float: left;
		}
		
		#popup_content_box {
			float: left;
		}
		
		.cm {	margin: 0px auto;	}
		.cp {	padding: 0px auto;	}
		.ct {	text-align: center;	}
		.pop_btn {	width: 130px; height: 60px}
		.pop_aside {width: 100%; padding: 10px; background-color: #eee; border: 1px solid #c45654}
		.pop_bside {width: 100%; padding: 10px; background-color: #eee; border: 2px solid #c45654; line-height: 30px;}
		.solid { width: 250px; border-bottom: 1px solid #ccc; text-indent: 10px; padding-bottom: 5px;}
		
	
    </style>


</head>
										
										
 
<body>								




<!-- Button to Open the Modal -->
<button  style="display:none;" id="btn_modal" type="button"  data-bs-toggle="modal" data-bs-target="#myModal">
  Open modal
</button>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" id="popup_menu_name">메뉴이름</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body col-md-12">
		<div id="popup_image_box">
			<img id="popup_image" src="" width="200px">
		</div>
		<div id="popup_content_box">
		  	<div class="solid" id="popup_menu_category_name">메뉴카테고리</div>
		  	<div class="solid"  id="popup_menu_price">메뉴가격</div>
		  	<div class="solid"  id="popup_menu_detail">메뉴소개</div>
		  	<div class="solid"  id="popup_menu_created_date">메뉴생성일</div>
		  	<div class="solid"  id="popup_menu_modified_date">메뉴수정일</div>
		  	<div class="solid"  id="popup_menu_rating_avg">메뉴평점</div>
		  	<div class="solid"  id="popup_menu_status">메뉴상태</div>
		 </div>
		</div>
		
		
        

      <!-- Modal footer -->
      <div class="modal-footer cm" style="clear:both; text-align: center">
      <i><input id="btn_popup_update" type="button" class="btn wid30 btn_menu pop_btn" value="수정"
               onclick="modify_form();"></i>
      <i><input id="btn_popup_delete" type="button" class="btn wid30 btn_menu pop_btn" value="삭제"
               onclick="del();"></i>
      <i><input id="btn_popup_close" type="button" class="btn wid30 btn_menu pop_btn" value="닫기" data-bs-dismiss="modal"></i>
        <!-- <button id="btn_popup_close" type="button" class="btn wid30 btn_menu" data-bs-dismiss="modal">Close</button> -->
      </div>

    </div>
  </div>
</div>		

		
<!-- Modal -->
<!-- <div id="myModal" class="modal" role="dialog">
  <div class="modal-dialog">

    Modal content
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">닫기</button>
        <h4 class="modal-title" id="popup_menu_name">메뉴이름</h4>
      </div>
      <div class="modal-body">
      	<div id="popup_image_box">
      		<img id="popup_image" src="" width=150>
      	</div>
        <div id="popup_content_box">
        	<div id="popup_menu_category_name">메뉴카테고리</div>
        	<div id="popup_menu_price">메뉴가격</div>
        	<div id="popup_menu_detail">메뉴소개</div>
        	<div id="popup_menu_created_date">메뉴생성일</div>
        	<div id="popup_menu_modified_date">메뉴수정일</div>
        	<div id="popup_menu_rating_avg">메뉴평점</div>
        	<div id="popup_menu_status">메뉴상태</div>
        </div>
      </div>
      <div class="modal-footer" style="clear:both; text-align: center">
 		seller_manager_view의 attribute style똑같이 적용 (jsp include했으므로)
        <input id="btn_popup_update" type="button" class="btn wid30 btn_cart"value="수정"
               onclick="modify_form();">
        <input id="btn_popup_delete" type="button" class="btn wid30 btn_cart" value="삭제"
               onclick="del();">
        <input type="button" class="btn btn-default" data-dismiss="modal" class="btn wid30 btn_cart" value="닫기">
        
      </div>
    </div>

  </div>
</div> -->
										
										
				










</div>
</article>

                </div>

            </div>
        </main><!-- /#content-box -->
	
</div>

        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>

</body>

</html>
