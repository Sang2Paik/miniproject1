<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    	<!-- Header -->
		<%@ include file="header.jsp" %>
        <!-- Navi -->
        <%@ include file="navi.jsp" %>




        <!-- Menu list -->
        

    <section class="py-5">
        <div class="container py-5">
            <div class="row mb-4 mb-lg-5">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <h2 class="fw-bold">Products</h2>
                    <p class="text-muted">No matter the project, our team can handle it.&nbsp;</p>
                </div>
            </div>
            <div class="row mx-auto">
                <div class="col">
                    <div data-reflow-type="product-list" data-reflow-layout="cards" data-reflow-order="date_desc" data-reflow-product-link="/product.html?product={id}"></div>
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