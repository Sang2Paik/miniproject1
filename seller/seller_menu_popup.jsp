<!-- 최병훈 : 2024.01.26 pm04:55 -->

<!-- seller_menu_popup.jsp -->
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
	
	function del() {
		//alert(g_p_idx + "삭제");
		
		if(confirm('정말 삭제하시겠습니까?')==false) return;
		
		//삭제
		location.href="menu_delete.do?menu_idx=" + g_menu_idx;      //SellerMenuDeleteAction
		
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
	
    </style>


   

			<!-- Contents -->
        <div class="container pt-4 pt-xl-5 c">
	
	        <main id="content">
            <div class="container">
                <div class="row shop_tt">


                    <article class="col-md-12 article affix-purchase-target">
                        <div class="content-inner" role="toolbar">
                            <div class="page-header">
                                <h1 class="page-title"> 메뉴이름</h1>
                            </div><!-- .page-header -->

                            <!--.page-body -->
                            <div class="tab-content">
	
	
                                    <div class="delivery-info block">
										<div class="container mt-3">
										
										
 
										
		
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
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
 		<!-- seller_manager_view의 attribute style똑같이 적용 (jsp include했으므로) -->
        <input id="btn_popup_update" type="button" class="btn wid30 btn_cart"value="수정"
               onclick="modify_form();">
        <input id="btn_popup_delete" type="button" class="btn wid30 btn_cart" value="삭제"
               onclick="del();">
        <input type="button" class="btn btn-default" class="btn wid30 btn_cart" value="닫기">
        
      </div>
    </div>

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
        </main><!-- /#content-box -->
	
</div>

        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>


		<!-- Footer -->
        <%@ include file="/footer.jsp" %>


    </body>

    </html>
