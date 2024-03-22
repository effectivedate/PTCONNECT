<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>상품 거래 상세</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/css/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/tradedProductViewDetail.css" rel="stylesheet">

</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        
        <!-- Sidebar -->
        <jsp:include page="./side_bar.jsp"></jsp:include>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 my-5 text-gray-800 font-weight-bold text-center">상품 거래 상세</h1>
                    

	                    

                    <div class="row">

                        <div class="col-lg-6 div-receipt">

                            <div class="card shadow mb-5">
                            	<div class="card-header py-3">
                            		<a href="../tradedProductList" class="btn btn-icon-split btn-discord">
                            			<span class="icon">
	                            			<i class="fas fa-arrow-left"></i>
                            			</span>
                            			<span class="text font-weight-bold">상품 거래 내역</span>
                            		</a>
                            		
                            	</div>
                            	<div class="card-body p-5">
                            		<div class="my-4 d-flex jc-between">
                            			<span class="text-gray-800 text-lg font-weight-bold">주문번호</span>
                            			<span class="">${po.odNo}</span>
                            		</div>
                            		<div class="my-4 d-flex jc-between">
                            			<span class="text-gray-800 text-lg font-weight-bold">결제일</span>
                            			<span class="">${po.odDate}</span>
                            		</div>
                            		<div class="my-4 d-flex jc-between">
                            			<span class="text-gray-800 text-lg font-weight-bold">판매자</span>
                            			<span class="">${po.tnName}</span>
                            		</div>
                            		<div class="my-4 d-flex jc-between">
                            			<span class="text-gray-800 text-lg font-weight-bold">구매자</span>
                            			<div class="">
                            				<c:choose>
                            					<c:when test="${not empty po.nmName}">
                            						<span class="">${po.nmName}</span>
                            					</c:when>
                            					<c:when test="${not empty po.mbName}">
                            						<span class="">${po.mbName}</span>
                            					</c:when>
                            				</c:choose>
                            			</div>
                            		</div>
                            		<div class="my-4 d-flex jc-between">
                            			<span class="text-gray-800 text-lg font-weight-bold">구매자연락처</span>
                            			<div class="">
                            				<c:choose>
                            					<c:when test="${not empty po.nmPhone}">
                            						<span class="">${po.nmPhone}</span>
                            					</c:when>
                            					<c:when test="${not empty po.mbPhone}">
                            						<span class="">${po.mbPhone}</span>
                            					</c:when>
                            				</c:choose>
                            			</div>
                            		</div>
                            		<div class="my-4 d-flex div-discount jc-between">
                            			<span class="my-2 text-gray-800 text-lg font-weight-bold">할인내역</span>
                            			<div class="py-2 pl-3 d-flex jc-between">
	                            			<span class="d-flex align-items-center text-gray-800 font-weight-bold">쿠폰</span>
	                            			<div class="d-flex div-amount">
	                            				<span class="">쿠폰 이름 ( - 20 % )</span>
		                            			<input type="text" class="ml-3 input-amount" readonly value="${po.odCoupon}">
	                            			</div>
                            			</div>
	                            		<div class="py-2 pl-3 d-flex jc-between">
                            				<span class="d-flex align-items-center text-gray-800 font-weight-bold">포인트</span>
                            				<div class="d-flex div-amount">
		                            			<input type="text" class="input-amount" readonly value="${po.odPoint}">
                            				</div>
                            			</div>
                            		</div>
                            		<div class="my-4 d-flex jc-between">
                            			<span class="text-gray-800 text-lg font-weight-bold">총 결제금액</span>
                            			<div class="d-flex div-amount">
	                            			<input type="text" class="input-amount" readonly value="${po.odPrice}">
                            			</div>
                            		</div>
                            		<div class="my-4 d-flex jc-between">
                            			<span class="text-gray-800 text-lg font-weight-bold">결제수단</span>
                            			<span class="">${po.pmCard}/${po.pmMethod}</span>
                            		</div>
                            	</div>
                            </div>

                        </div>

                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/css/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/css/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/css/admin/js/sb-admin-2.min.js"></script>
	
	<script>
		
	</script>
	
</body>
</html>