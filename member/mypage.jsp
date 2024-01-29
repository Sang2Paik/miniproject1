<!--  최병훈 : 2024.01.29 PM 02:30 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    
    	<!-- Header -->
		<%@ include file="../header.jsp" %>
		<title>마이 페이지</title>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/form.css">
        <!-- Navi SM -->
     	 <%@ include file="../navi_sm.jsp" %>
    
     

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

function del(){
	
	if(confirm("정말 탈퇴하시겠습니까?") == false) 
		return;
	else{
		alert("탈퇴가 완료되었습니다.");
		location.href='delete.do?user_idx='+${user.user_idx};
	}

}


</script>


<style>
	.wid30 {
		width: 28%;
		background-color: #fff;
	}
	tr {
		border-bottom: 1px solid #eee;
	}
	
</style>

</head>
<body>



	<!-- Contents -->
    <div class="container pt-4 pt-xl-5 c">
	
        <main id="content">
        <div class="container">
            <div class="row shop_tt">


                <article class="col-md-12 article affix-purchase-target">
                    <div class="content-inner" role="toolbar">

                        <!--.page-body -->
                        <div class="tab-content">

						
						<table class="table col-md-6">
						<tr><td>


                        <div class="page-header">
                            <h1 class="page-title"> 나의 정보</h1>
                        </div><!-- .page-header -->



                        <div id="my_info">
                        <form class="form-control">
                            <table class="table table-hover">
                            <tr>
                                <th>이름</th>
                                <td><input class="form-control" value="${user.user_name}" placeholder="이름"></td>
                            </tr>
                            <tr>
                                <th>아이디</th>
                                <td><input class="form-control" value="${user.user_id}" placeholder="아이디"></td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td><input class="form-control" value="${user.user_mask_pwd}" placeholder="패스워드"></td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                <td><input class="form-control" value="${user.user_cellphone}" placeholder="연락처"></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input class="form-control" value="${user.user_email}" placeholder="이메일"></td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td><input class="form-control" value="${user.user_addr}" placeholder="주소"></td>
                            </tr>
                            <tr>
                                <th>주문주소</th>
                                <td><input class="form-control" value="${user.user_order_addr}" placeholder="배송주소"></td>
                            </tr>
                            <tr>
                                <th>등급</th>
                                <td><input class="form-control" value="${user.user_grade}" placeholder="등급"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="button" value="수정하기"  class="btn wid30 btn_cart"
                                            onclick="location.href='modify_form.do?user_idx='+${user.user_idx}">
                                    <input type="button" value="탈퇴하기"  class="btn wid30 btn_cart"
                                    onclick="del()">
                                    <input type="button" value="메인페이지" class="btn wid30 btn_cart"
                                            onclick="location.href='../index.jsp'">
                                </td>
                            </tr>

                        </table>

                        </form>
                        </div></td><td>
						
                        

                        
                         <!--.page-body -->
                         <div class="tab-content">

                            <div class="content-inner" role="toolbar">
                            <div class="page-header">
                                <h1 class="page-title"> 쿠폰정보 보기</h1>
                            </div><!-- .page-header -->
                        	</div>
 
                        <div id="my_coupon">
                        <table class="table table-hover table-stripe">

                            <tr>
                                <th>인덱스</th>
                                <th>쿠폰명</th>
                                <th>사용 최소금액</th>
                                <th>할인가</th>
                                <th>사용기한</th>
                                <th>사용여부</th>
                            </tr>
                            <c:forEach var="vo" items="${list}" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>${vo.coupon_name}</td>
                                <td>${vo.coupon_min_order_price}</td>
                                <td>${vo.deducted_price}</td>
                                <td>${vo.coupon_expired_date}</td>
                                <td>${vo.coupon_issued}</td>
                            </tr>
                            
                            </c:forEach>
                            

                        </table>

						</div>
                        </div>



                        
                 </td></tr>
			</table>
						


            </div> <!--  end - 실제 컨텐츠영역 -->

        </div>
    </main><!-- /#content-box -->

</div>




</body>
</html>