<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    	<!-- Header -->
		<%@ include file="../header.jsp" %>
        <!-- Navi -->
        <%@ include file="../navi.jsp" %>

        <!-- login Form -->
        

    <section class="py-5">
        <div class="container py-5">
            <div class="row mb-4 mb-lg-5">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <p class="fw-bold text-success mb-2">Login</p>
                    <h2 class="fw-bold">Welcome back</h2>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 col-xl-4">
                    <div class="card">
                        <div class="card-body text-center d-flex flex-column align-items-center">
                            <div class="bs-icon-xl bs-icon-circle bs-icon-primary shadow bs-icon my-4"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"></path>
                                </svg></div>
                            <form method="post" data-bs-theme="light">
                                <div class="mb-3"><input id="user_id" name="user_id" class="form-control" type="text" placeholder="아이디"></div>
                                <div class="mb-3"><input id="user_pwd" name="user_pwd" class="form-control" type="password" placeholder="패스워드"></div>
                                
                               <!-- 백상희: 20240124 수정 시작 -->
                                <div class="mb-3"><input class="btn btn-primary shadow d-block w-100" type="button" value="Log in" onclick="send(this.form);"></div>
                                
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
        <div class="container pt-4 pt-xl-1 c"><hr></div>
<!-- 백상희: 20240124 수정 시작 -->
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
<!-- 백상희: 20240124 수정 시작 -->

<!-- Footer -->
        <%@ include file="../footer.jsp" %>


    </body>

    </html>
