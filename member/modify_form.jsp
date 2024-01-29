<!-- modify_form.jsp -->
<!--  최병훈 : 2024.01.29 PM 02:30 수정 -->

<!--  JSTL LIBRALY 사용 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



    
    	<!-- Header -->
		<%@ include file="../header.jsp" %>
		<title>회원 정보 수정</title>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/form.css">
        <!-- Navi SM -->
     	 <%@ include file="../navi_sm.jsp" %>
    
    
        <!-- 회원 정보 수정 -->
     


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 주소검색API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	$("#user_pwd").keyup(function(event){
    	
    	var pwd_regExp = /^[a-z]+[a-z0-9]{5,19}$/g;
    	let user_pwd = $(this).val();
    	
    	if(pwd_regExp.test(user_pwd)==false){
    		$("#user_pwd_msg").html("영문자로 시작하는 6~20자(숫자포함 가능)").css("color","red");
    		$("#user_pwd_msg").css("font-size","15px");    		
    	}else{
    		$("#user_pwd_msg").html("");
    	}
    	
    })/* function : keyup for pwd */
    
    $("#user_cellphone").keyup(function(event){
    	
    	var cellphone_regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
    	let user_cellphone = $(this).val();
    	
    	if(cellphone_regExp.test(user_cellphone)==false){
    		$("#user_cellphone_msg").html("형식에 맞춰 입력하세요.(xxx-xxxx-xxxx) ").css("color","red");
    		$("#user_cellphone_msg").css("font-size","15px"); 
    	}else{
    		$("#user_cellphone_msg").html("");
    	}
    	
    })/* function : keyup for cellphone */
    
    $("#user_email").keyup(function(event){
    	
    	var email_regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    	let user_email = $(this).val();
    	
    	if(email_regExp.test(user_email)==false){
    		$("#user_email_msg").html("유효하지 않은 이메일 형식입니다.").css("color","red");
    		$("#user_email_msg").css("font-size","15px"); 
    	}else{
    		$("#user_email_msg").html("");
    	}
    })/* function : keyup for email */
	
});

function find_addr() {
	
	//Daum API 주소 받아서 넣는 방법
    new daum.Postcode({
        oncomplete: function(data) {
        	
        	//data = {"address", "경기 성남시 분당구 판교역로 166"...}
        	//alert(data.address);
        	$("#user_addr").val(data.address);  		
        	
        }
    }).open();
	
}//end:find_addr()

function find_order_addr() {
	
	//Daum API 주소 받아서 넣는 방법
    new daum.Postcode({
        oncomplete: function(data) {
        	
        	//data = {"address", "경기 성남시 분당구 판교역로 166"...}
        	//alert(data.address);
        	$("#user_order_addr").val(data.address);  		
        	
        }
    }).open();
	
}//end:find_order_addr()

function send(f){
	
	if (user_order_addr == "") {
		alert("위치 검색을 위해 주소를 입력해주세요.");
		f.user_order_addr.value = "";
		f.user_order_addr.focus();
		return;
	}
	
	f.action = "modify.do";
	f.submit();
}

function del(){
	
	location.href="delete.do?user_idx="+${user.user_idx};
}

</script>

<style>
	.wid50 {
		width: 45%;
		background-color: #eee;
	}
	
</style>
</head>
<body>

        <div class="container py-5">
            <div class="row mb-4 mb-lg-5">
                
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <p class="fw-bold text-success mb-2">
                    
                    </p>
                    
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 col-xl-4">
                
                    <div class="card">
                    
                        <div class="card-body text-center d-flex flex-column align-items-center illustration_m">
                            







<div id="modify_form">
	<form>
		<input type="hidden" name="user_idx" value="${vo.user_idx}" class="form-control">

		<div class="mb-3">
			<input id="user_name" name="user_name" class="form-control"
				 value="${vo.user_name}" placeholder="이름">
			<div class="mb-3" id="user_name_msg"></div>
		</div>
		
		<div class="mb-3">
			<input id="user_id" name="user_id" class="form-control"
				 value="${vo.user_id}" placeholder="아이디" readonly="readonly">
			<div class="mb-3" id="user_id_msg"></div>
		</div>

		<div class="mb-3">
			<input id="user_pwd" name="user_pwd" class="form-control" type="password" 
			 value="${vo.user_pwd}" placeholder="비밀번호">
			<div class="mb-3" id="user_pwd_msg"></div>
		</div>

	<div class="mb-3">
		<input id="user_cellphone" name="user_cellphone" class="form-control"
		  value="${vo.user_cellphone}" placeholder="연락처">
		<div class="mb-3" id="user_cellphone_msg"></div>
	</div>

	<div class="mb-3">
		<input id="user_email" name="user_email" class="form-control"
		 value="${vo.user_email}" type="email" placeholder="Email">
	</div>
	<div class="mb-3" id="user_email_msg"></div>

	<div class="mb-3">
		<input id="user_addr" name="user_addr" class="form-control"
		 value="${vo.user_addr}" placeholder="주소">
		<input class="btn_login" type="button" value="주소검색" id="btn_find_addr">
	</div>
	<div class="input_msg" id="user_addr_msg"></div>

	<div class="mb-3">
		<input id="user_order_addr" name="user_order_addr"
		 value="${vo.user_order_addr}"	 class="form-control" placeholder="배송주소">
		<input class="btn_login" type="button" value="주소검색" id="btn_find_order_addr">
	</div>
	<div class="mb-3" id="user_order_addr_msg"></div>
	
	<div class="mb-3">
		<input name="user_grade" id="user_grade"
		value="${vo.user_grade}" readonly="readonly" 
		class="form-control" placeholder="등급">
	</div>
	<div class="mb-3" id="user_grade_msg"></div>
	<div class="mb-3">
	<input class="btn_login wid50" type="button" value="수정하기" onclick="send(this.form)">
	<input class="btn_login wid50" type="button" value="돌아가기" onclick="location.href='mypage.do?user_idx='+${vo.user_idx}"></div>

		
	</form>
</div>





</div>
                    </div>
                </div>
            </div>
        </div>
    












</body>
</html>