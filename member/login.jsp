<!-- login.jsp -->
<!--  최병훈 : 2024.01.29 PM 02:30 수정 -->



<!-- 최병훈 2024.01.25 pm 12:46 / 스타일 변경 assest/css/form.css 파일 style.css파일 업데이트 필요 -->
<!-- 최병훈 2024.01.29 am11:56 로그인폼 적용 -->



<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    	<!-- Header -->
		<%@ include file="../header.jsp" %>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/form.css">
		
        <!-- Navi -->
        <%@ include file="../navi_sm.jsp" %> 

        <!-- login Form -->
        <!-- 2024.01.29 최병훈 Login form -->
        

    <section class="py-0">
        <div class="container">

            <div class="row d-flex justify-content-center">
                <div class="col-md-6 col-xl-4">
                    <div class="card  illustration_l">
                        <div class="card-body text-center d-flex flex-column align-items-center">
                            
                            <form method="post" data-bs-theme="light">
                                <div class="mb-3"><input id="user_id" name="user_id" class="form-control" type="text" placeholder="아이디"></div>
                                <div class="mb-3"><input id="user_pwd" name="user_pwd" class="form-control" type="password" placeholder="패스워드"></div>
                                
                               <!-- 백상희: 20240124 수정 시작 -->
                                <div class="mb-3"><input class="btn_login" type="button" value="Log in" onclick="send(this.form);"></div>
                                
                                <!-- 백상희: 20240124 수정 끝 -->
                            </form>
                            <p class="text-muted">Forgot your password?</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


        <!-- line -->
        <div class="container pt-4 pt-xl-5 c"><hr></div>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<script type="text/javascript">
	function show_message() {

		if ("${ param.reason eq 'fail_id'}" == "true") {
			alert("아이디가 틀렸습니다.");
		}

		if ("${ param.reason eq 'fail_pwd'}" == "true") {
			alert("비밀번호가 틀렸습니다.");
		}
	}

	function send(f) {

		let user_id = f.user_id.value.trim();
		let user_pwd = f.user_pwd.value.trim();

		if (user_id == "") {
			alert("아이디를 입력해주세요.");
			f.user_id.value = "";
			f.user_id.focus();
			return;
		}

		if (user_pwd == "") {
			alert("비밀번호를 입력해주세요.");
			f.user_pwd.value = "";
			f.user_pwd.focus();
			return;
		}

		f.action = "login.do";
		f.submit();

	}
</script>

<!-- Footer -->
        <%@ include file="../footer.jsp" %>


    </body>

    </html>