<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    	<!-- Header -->
		<%@ include file="../main/header.jsp" %>
        <!-- Navi -->
        <%@ include file="../main/navi.jsp" %>




        <!-- Shopping cart -->
        

    <section class="py-5">
        <div class="container py-5">
            <div class="row mx-auto">
                <div class="col">
                    <div data-reflow-type="shopping-cart" id="cart_list"></div>
                </div>
            </div>
        </div>
    </section>




        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>




        <!-- Footer -->
        <%@ include file="../main/footer.jsp" %>

    </body>

    </html>