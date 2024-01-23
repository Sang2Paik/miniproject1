<!--  JSTL LIBRALY 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    	<!-- Header -->
		<%@ include file="../main/header.jsp" %>
        <!-- Navi -->
        <%@ include file="../main/navi.jsp" %>




        <!-- Review -->
        


    <section class="py-5">
        <div class="container py-5">
            <div class="row mb-5">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <h2 class="fw-bold">Heading</h2>
                    <p class="text-muted">Curae hendrerit donec commodo hendrerit egestas tempus, turpis facilisis nostra nunc. Vestibulum dui eget ultrices.</p>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-md-2 mx-auto" style="max-width: 900px;">
                <div class="col mb-4">
                    <div><a href="#"><img class="rounded img-fluid shadow w-100 fit-cover" src="../assets/img/1.jpg" style="height: 250px;"></a>
                        <div class="py-4"><span class="badge bg-primary mb-2">Website</span>
                            <h4 class="fw-bold">Lorem libero donec</h4>
                            <p class="text-muted">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.</p>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div><a href="#"><img class="rounded img-fluid shadow w-100 fit-cover" src="../assets/img/2.jpg" style="height: 250px;"></a>
                        <div class="py-4"><span class="badge bg-primary mb-2">Website</span>
                            <h4 class="fw-bold">Lorem libero donec</h4>
                            <p class="text-muted">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.</p>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div><a href="#"><img class="rounded img-fluid shadow w-100 fit-cover" src="../assets/img3.jpg" style="height: 250px;"></a>
                        <div class="py-4"><span class="badge bg-primary mb-2">Website</span>
                            <h4 class="fw-bold">Lorem libero donec</h4>
                            <p class="text-muted">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.</p>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div><a href="#"><img class="rounded img-fluid shadow w-100 fit-cover" src="../assets/1.jpg" style="height: 250px;"></a>
                        <div class="py-4"><span class="badge bg-primary mb-2">Website</span>
                            <h4 class="fw-bold">Lorem libero donec</h4>
                            <p class="text-muted">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.</p>
                        </div>
                    </div>
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