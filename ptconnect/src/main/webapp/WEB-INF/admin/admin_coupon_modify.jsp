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

    <title>관리자 쿠폰수정 페이지</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/css/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/css/review-admin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/review-admin.css" rel="stylesheet">
    
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
    
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
                    <h1 class="h3 mb-4 text-gray-800">쿠폰 수정</h1>

                    <div class="row">

                        <div class="col-lg-12">

                            <!-- Circle Buttons -->
                            <div class="card shadow mb-4 coupon">
                            	<form id="form" class="form" name="frm">
	                            	<table class="table tb1 ctb">
	                            		<tr>
	                            			<td>쿠폰 이름</td>
	                            			<td><input type="text" class="input-point cname"></td>
	                            		</tr>
	                            		<tr>
	                            			<td>할인율</td>
	                            			<td><input type="text" class="input-point cperc"> %</td>
	                            		</tr>
	                            		<tr>
	                            			<td>유효기간</td>
	                            			<td>
		                            			<select>
		                            				<option>1일</option>
		                            				<option>7일</option>
		                            				<option>15일</option>
		                            				<option>30일</option>
		                            			</select>
	                            			</td>
	                            		</tr>
	                            		<tr>
	                            			<td>발급대상</td>
	                            			<td>
	                            				<select>
		                            				<option>전체</option>
		                            				<option>신규회원</option>
		                            			</select>
	                            			</td>
	                            		</tr>
	                            	</table>
                            	</form>
                            	
                            	<div class="coupon-creat">
                            		<button class="coupon-creat-btn">수정</button>
                            		<button class="coupon-cancle-btn" onclick="location.href='./admin_coupon_list.jsp'">취소</button>
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
	
	$(document).ready(function() {
		
		$(".coupon-creat-btn").on("click", function() { 
			
			if(confirm("수정하시겠습니까?")) {
				return;
			}else {
				return;
			}
		});
		
		
		$(".coupon-cancle-btn").on("click", function() { 
			location.href="./admin_coupon_list.jsp";
		});
		
	});
	
	</script>
	
</body>
</html>