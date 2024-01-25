<!-- signup.jsp -->
<%-- 최병훈 2024.01.25 pm 12:46 / 스타일 변경 assest/css/form.css 파일 style.css파일 업데이트 필요 --%>

<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    	<!-- Header -->
		<%@ include file="../header.jsp" %>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/form.css">
        <!-- Navi -->
        <%@ include file="../navi_sm.jsp" %>




        <!-- 회원가입 -->
        

    <section class="py-5">
    
    <!-- 백상희 : 20240124 배너 중복으로 삭제  -->
      <!--   <img class="tt_image" src="../assets/img/brands/top_banner.png"> -->
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
                    
                        <div class="card-body text-center d-flex flex-column align-items-center illustration_s">
                            
                             <!-- 입력폼 시작 --> <!-- 백상희 수정 : 20240124 시작 -->
                            
                            <form method="POST" enctype="multipart/form-data" data-bs-theme="light">
                            <%-- <img src="${pageContext.request.contextPath}/assets/img/signup_img.png" alt="illustration" class="illustration_s" /> --%>
									<input type="radio" name="user_grade" value="buyer" checked="checked">일반
									<input type="radio" name="user_grade" value="seller">판매자
									<input type="radio" name="user_grade" value="admin">관리자
									<hr>

										<div class="mb-3">
											<input id="user_name" name="user_name" class="form-control"
												placeholder="고객명">
											<div class="input_msg" id="user_name_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_id" name="user_id" class="form-control"
												placeholder="아이디">
											<div class="input_msg" id="user_id_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_pwd" name="user_pwd" class="form-control"
												type="password" placeholder="비밀번호">
											<div class="input_msg" id="user_pwd_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_cellphone" name="user_cellphone"
												class="form-control" placeholder="연락처">
											<div class="input_msg" id="user_cellphone_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_email" name="user_email" class="form-control"
												type="email" placeholder="Email">
										</div>
										<div class="input_msg" id="user_email_msg"></div>

										<div class="mb-3">
											<input id="user_addr" name="user_addr" class="form-control"
												placeholder="주소">
											<input class="btn_login" type="button" value="주소검색" id="btn_find_addr">
										</div>
										<div class="input_msg" id="user_addr_msg"></div>

										<div class="mb-3">
											<input id="user_order_addr" name="user_order_addr"
												class="form-control" placeholder="배송주소">
											<div class="input_msg" id="user_order_addr_msg"></div>
										</div>
										
										<div class="mb-3">
											<input type="file" id="user_proof" name="user_proof"
												class="form-control" placeholder="증빙파일">
											<div class="input_msg" id="user_proof_msg"></div>
										</div>
								
                                <input type="button"
											class="btn btn_login d-block" id="btn_signup"
											 value="회원가입" disabled="disabled" onclick="send(this.form);">
                            </form>
                            <!-- // 입력폼 끝 -->
                           <!-- 백상희: 20240124 수정 끝 -->
                           <p class="text-muted">Already have an account?&nbsp;<a href="loginform.do">Log in</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



	<!-- 백상희: 20240124 수정 시작 -->
        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> <!-- jQuery수정 -->
    <!-- 주소검색API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">/* 백상희 javascript 수정 */
    
    $("#user_id").keyup(function(event){
    	
    	var id_regExp = /^[a-z]+[a-z0-9]{5,19}$/g;
    	   	
    	let user_id = $(this).val();
    	
    	if(id_regExp.test(user_id)==false){
    		$("#user_id_msg").html("영문자로 시작하는 6~20자(숫자포함 가능)").css("color","silver");
    		$("#user_id_msg").css("font-size","10px");
    		return;
    	}
    	
    	$.ajax({
    		
    		url : "check_id.do",
    		data: {"user_id": user_id},
    		dataType: "json",
    		success: function(res_data){
    			if(res_data.result){
    				$("#user_id_msg").html("사용가능한 아이디입니다.") .css("color","rgb(130, 203, 245)");
    				$("#user_id_msg").css("font-size","10px");
    				$("#btn_signup").attr("disabled", false);
    				
    			}else{
    				$("#user_id_msg").html("중복된 아이디입니다.") .css("color","rgb(130, 203, 245)");	
    				$("#user_id_msg").css("font-size","10px");
    			}
    		},
    		error: function(err){
    			alert(err.responseText);
    		}	
    	})

    })/* function : keyup for id */
    
    $("#user_pwd").keyup(function(event){
    	
    	var pwd_regExp = /^[a-z]+[a-z0-9]{5,19}$/g;
    	let user_pwd = $(this).val();
    	
    	if(pwd_regExp.test(user_pwd)==false){
    		$("#user_pwd_msg").html("영문자로 시작하는 6~20자(숫자포함 가능)").css("color","silver");
    		$("#user_pwd_msg").css("font-size","10px");    		
    	}else{
    		$("#user_pwd_msg").html("");
    	}
    	
    })/* function : keyup for pwd */
    
    $("#user_cellphone").keyup(function(event){
    	
    	var cellphone_regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
    	let user_cellphone = $(this).val();
    	
    	if(cellphone_regExp.test(user_cellphone)==false){
    		$("#user_cellphone_msg").html("형식에 맞춰 입력하세요.(xxx-xxxx-xxxx) ").css("color","#888");
    		$("#user_cellphone_msg").css("font-size","12px"); 
    	}else{
    		$("#user_cellphone_msg").html("");
    	}
    	
    })/* function : keyup for cellphone */
    
    $("#user_email").keyup(function(event){
    	
    	var email_regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    	let user_email = $(this).val();
    	
    	if(email_regExp.test(user_email)==false){
    		$("#user_email_msg").html("유효하지 않은 이메일 형식입니다.").css("color","#888");
    		$("#user_email_msg").css("font-size","12px"); 
    	}else{
    		$("#user_email_msg").html("");
    	}
    })/* function : keyup for email */
    
    $("#btn_find_addr").click(function(){
    	new daum.Postcode({
    		oncomplete: function(data){
    			
    			$("#user_addr").val(data.address);	
    		}
    	}).open();
    })
 	   
	$("#user_proof").hide(); 
    $("#btn_find_addr").show();
      
    $("input[name='user_grade']").change(function(){
      	 
    	    	
    	/* 어드민의 경우 */
    	if($("input[name='user_grade']:checked").val() == 'admin'){
    		$("#user_addr").hide();
    	    $("#user_order_addr").hide();
    	    $("#user_proof").hide();
    	    $("#btn_find_addr").hide();
    	}
    	
    	/* 소상공인의 경우 */
    	if($("input[name='user_grade']:checked").val() == 'seller'){
    		$("#user_addr").show();
    		$("#btn_find_addr").show();
    	    $("#user_order_addr").hide();
    		$("#user_proof").show();
    	}
    	
    	/* 일반유저의 경우 */
    	if($("input[name='user_grade']:checked").val() == 'buyer'){
    		$("#user_addr").show();
    	    $("#user_order_addr").show();
    	    $("#btn_find_addr").show();
    	    $("#user_proof").hide();
    	}
    	
    })
    
    function send(f){
    	
    	alert("회원가입이 완료되었습니다.");
    	f.action = "insert.do";
    	f.submit();
    	
    }
 
    </script>
	<!-- 백상희: 20240124 수정 끝 -->
        <!-- Footer -->
        <%@ include file="../footer.jsp" %>

    </body>

    </html>
