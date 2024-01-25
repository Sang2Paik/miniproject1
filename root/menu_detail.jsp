<!-- menu_detail.jsp -->
<!-- 최병훈 : 2024.01.25 pm04:48 Update -->


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


   

			<!-- Contents -->
        <div class="container pt-4 pt-xl-5 c">
	
	        <main id="content">
            <div class="container">
                <div class="row">


                    <article class="col-md-9 article affix-purchase-target">
                        <div class="content-inner" role="toolbar">
                            <div class="page-header">
                                <h1 class="page-title"> 신선 식품 세트 (인기상품)
                                    <small>신선한 재료만 사용합니다</small>
                                </h1>
                            </div><!-- .page-header -->

                            <!-- Tab panes -->
                            <div class="tab-content">

                                <!-- 메뉴 소개 -->
                                <div role="tabpanel" class="tab-pane active" id="description">
                                    <p><img src="${pageContext.request.contextPath}/assets/img/de_a01.jpg" alt="제품정보1"><br></p>
                                    <p><img src="${pageContext.request.contextPath}/assets/img/de_a02.jpg" alt="제품정보2"><br></p>
                                    <p><img src="${pageContext.request.contextPath}/assets/img/de_a03.jpg" alt="제품정보3"><br></p>
                                    <div class="delivery-info block">
                                        <div class="content">
                                            <h4 class="date">지금 주문하면 <span>01월 25일(목)</span> 부터 받아보실 수 있어요!</h4>
                                            <p class="agency">판매자 직배송 상품입니다.</p>
                                        </div>
                                    </div>

                                    <p><img src="${pageContext.request.contextPath}/assets/img/deliver.jpg" alt="배송과정"></p>

                                    

                                </div><!-- /메뉴 소개 -->




                            </div><!-- /.tab-content -->

                        </div><!-- /.content-inner -->

                    </article>

                    <!-- Sidebar -->
                    <aside id="sidebar" class="col-md-3 sidebar">

                        <section class="content-inner purchase-option affix" style="top: 10px;">
                            <div class="order box clearfix">
                                <div class="mobile-toggle"></div>
                                <button class="mobile-share-btn">
                                    
                                </button>
                                <button class="toggle-mobile-menu" type="button">
                                    <span>주문하기</span>
                                </button>

                                <div class="purchase-option-inner">
                                    <h3>구매 옵션</h3>

                                    <div class="price-box module-box" style="display: none;">
                                        <div class="price-item block">
                                            <h4>판매 가격</h4>
                                            <div class="price">
                                                <span class="value value-big" price="6000"> 6,000 </span> 원 ~
                                                <small>상품 가격의 1% 적립</small>
                                            </div>
                                        </div>

                                        <div class="price-shipping block">
                                            <h4>배송비</h4>
                                            <div class="price">
                                                <span class="value"> 2,500 </span> 원 ~

                                                <small>이 식당에서 같은 날짜에<br>50,000 원 이상 구매 시 무료</small>
                                            </div>
                                        </div>
                                    </div><!-- /.price-box -->


                                    <div class="shipping-box module-box">


                                        <div class="item-selection block">

                                            <h4>메뉴 선택하기</h4>

                                            <div class="form-group select-box">
                                                
                                                <select class="form-control select selectProductBundle">
                                                    <option value="" disabled="">메뉴를 선택해주세요.</option>
                                                    <option>무화과 300g(7,500 원)</option>
                                                    <option>건크랜베리 250g(4,800 원)</option>
                                                    <option>건블루베리 200g(10,000 원)</option>
                                                </select>
                                            </div><!-- /.select-box -->

                                        </div><!-- /.item-selection -->


                                        <div class="shipping-date block">

                                            <h4>배송 도착일 선택하기</h4>

                                            <div class="form-group select-box">
                                                <select class="form-control select selectShippingArrivalDate">
                                                    <option disabled="">배송 도착일을 선택해주세요.</option>
                                                    <option value="634187">01월 25일 (목)</option>
                                                    <option value="634310">01월 26일 (금)</option>
                                                    <option value="634426">01월 27일 (토)</option>
                                                    <option value="634593">01월 30일 (화)</option>
                                                    <option value="634734">01월 31일 (수)</option>
                                                    <option value="634861">02월 01일 (목)</option>
                                                    <option value="634991">02월 02일 (금)</option>
                                                    <option value="635113">02월 03일 (토)</option>
                                                    <option value="635237">02월 06일 (화)</option>
                                                </select>
                                            </div>

                                        </div>


                                        <div class="shipping-method block">

                                            <h4>배송방법</h4>

                                            <div class="form-group select-box">
                                                <select class="form-control select selectShippingPrice">
                                                    <option disabled="">배송방법을 선택해주세요.</option>
                                                    <option value="494">전국 택배 (제주 및 도서산간 제외)(3,000 원)</option>
                                                    <option value="495">제주도 및 도서지역(5,500 원)</option>
                                                </select>
                                            </div>

                                        </div>


                                        <div class="item-quantity block noDisplay">
                                            <h4>수량 선택하기</h4>
                                            <div class="form-group select-box">
                                                
                                                <select class="form-control select selectProductPrice">
                                                    <option value="" disabled="">수량를 선택해주세요.</option>
                                                    <option value="1">1세트</option>
                                                    <option value="2">2세트</option>
                                                    <option value="3">3세트</option>
                                                </select>
                                            </div><!-- /.select-box -->
                                        </div>

                                    </div><!-- /.shipping-box -->


                                    <div class="price-total-box module-box">


                                        <div id="valueTooltipContent" class="noDisplay">
                                            <div class="price-total-bundle block">
                                                <h5>상품가격</h5>
                                                <div class="price">
                                                    <span class="value">0</span> 원
                                                </div>
                                            </div>

                                            <div class="price-total-shipping block">
                                                <h5>배송비</h5>
                                                <div class="price">
                                                    <span class="value">0</span> 원
                                                </div>
                                            </div>

                                            <div class="price-additional-shipping block">
                                                <h5>추가 배송비</h5>
                                                <div class="price">
                                                    <span class="value">0</span> 원
                                                </div>
                                            </div>
                                        </div>

                                        <div class="price-total block">
                                            <h5>총 결제금액</h5>
                                            <div class="price">
                                                <span class="value value-big">0 원</span>
                                                <span id="valueTooltip"
                                                    class="glyphicon glyphicon-question-sign pointer"
                                                    style="font-size: 20px" data-toggle="popover"
                                                    data-trigger="focus"></span>
                                            </div>
                                        </div>
                                    </div><!-- /.total-price-box -->

                                    <div><button class="btn wid100 btn_cart">장바구니 담기</button></div>
                                    <div><button class="btn wid100 btn_order">주문하기</button></div>
                                    


                                </div><!-- /.purchase-option-inner -->
                            </div>





                        </section><!-- /.content-inner -->

                    </aside>

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
