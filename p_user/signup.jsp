<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    	<!-- Header -->
		<%@ include file="header.jsp" %>
        <!-- Navi -->
        <%@ include file="navi.jsp" %>




        <!-- 회원가입 -->
        

    <section class="py-5">
        <img class="tt_image" src="assets/img/brands/top_banner.png">
        <div class="container py-5">
            <div class="row mb-4 mb-lg-5">
                
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <p class="fw-bold text-success mb-2">Sign up</p>
                    <h2 class="fw-bold">회원등록</h2>
                    
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 col-xl-4">
                    <div class="card">
                        <div class="card-body text-center d-flex flex-column align-items-center">
                            
                                 <!-- 입력폼 시작 --> <!-- 백상희 수정 : 오후 4시 56분  -->
                            <form method="post" data-bs-theme="light">
									<input type="radio" name="user_grade" id="tab-1" value="buyer" checked="checked" onclick="handleRadioClick(this);">일반
									<input type="radio" name="user_grade" id="tab-2" value="seller" onclick="handleRadioClick(this);">판매자
									<input type="radio" name="user_grade" id="tab-3" value="admin" onclick="handleRadioClick(this);">관리자

								<c:choose>
									<c:when test="${param.user_grade eq 'seller'}">
										<div class="mb-3">
											<input id="user_name" name="user_name" class="form-control"
												placeholder="고객명">
											<div class="mb-3" id="user_name_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_id" name="user_id" class="form-control"
												placeholder="아이디">
											<div class="mb-3" id="user_id_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_pwd" name="user_pwd" class="form-control"
												type="password" placeholder="비밀번호">
											<div class="mb-3" id="user_pwd_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_cellphone" name="user_cellphone"
												class="form-control" placeholder="연락처">
											<div class="mb-3" id="user_cellphone_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_email" name="user_email" class="form-control"
												type="email" placeholder="Email">
										</div>
										<div class="mb-3" id="user_email_msg"></div>
									</c:when>
									<c:when test="${param.user_grade eq 'admin'}">
										<div class="mb-3">
											<input id="user_name" name="user_name" class="form-control"
												placeholder="고객명">
											<div class="mb-3" id="user_name_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_id" name="user_id" class="form-control"
												placeholder="아이디">
											<div class="mb-3" id="user_id_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_pwd" name="user_pwd" class="form-control"
												type="password" placeholder="비밀번호">
											<div class="mb-3" id="user_pwd_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_cellphone" name="user_cellphone"
												class="form-control" placeholder="연락처">
											<div class="mb-3" id="user_cellphone_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_email" name="user_email" class="form-control"
												type="email" placeholder="Email">
										</div>
										<div class="mb-3" id="user_email_msg"></div>
									</c:when>
									<c:otherwise>
										<div class="mb-3">
											<input id="user_name" name="user_name" class="form-control"
												placeholder="고객명">
											<div class="mb-3" id="user_name_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_id" name="user_id" class="form-control"
												placeholder="아이디">
											<div class="mb-3" id="user_id_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_pwd" name="user_pwd" class="form-control"
												type="password" placeholder="비밀번호">
											<div class="mb-3" id="user_pwd_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_cellphone" name="user_cellphone"
												class="form-control" placeholder="연락처">
											<div class="mb-3" id="user_cellphone_msg"></div>
										</div>

										<div class="mb-3">
											<input id="user_email" name="user_email" class="form-control"
												type="email" placeholder="Email">
										</div>
										<div class="mb-3" id="user_email_msg"></div>

										<div class="mb-3">
											<input id="user_addr" name="user_addr" class="form-control"
												placeholder="주소">
										</div>
										<div class="mb-3" id="user_addr_msg"></div>

										<div class="mb-3">
											<input id="user_order_addr" name="user_order_addr"
												class="form-control" placeholder="배송주소">
											<div class="mb-3" id="user_order_addr_msg"></div>

										</div>
									</c:otherwise>
								</c:choose>
								
                                <input type="button"
											class="btn btn-primary shadow d-block w-100" id="btn_signup"
											onclick="send(this.form);" value="회원가입" disabled="disabled">
                            </form>
                            <!-- // 입력폼 끝 -->


                           <p class="text-muted">Already have an account?&nbsp;<a href="loginform.do">Log in</a></p> <!-- 백상희 오후 4시 48분: 경로 변경 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>




        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>


        <!-- Footer -->
        <%@ include file="footer.jsp" %>



    </body>

    </html>
