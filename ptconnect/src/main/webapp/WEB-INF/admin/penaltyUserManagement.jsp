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

    <title>패널티 회원 관리</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/css/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/penaltyUserManagement.css" rel="stylesheet">

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
                    <h1 class="h3 my-5 pl-3 text-gray-800 font-weight-bold">패널티 회원 관리</h1>
                    

	                    

                    <div class="row">

                        <div class="col-lg-12">

                            <!-- Circle Buttons -->
                            <div class="card shadow mb-4">
                            	
                            	<div class="row div-filter my-3">
			                    	<div class="col-md-6 div-status">
			                    		<div class="div-button">
			                    			<ul class="ul-status">
			                    				<li class="li-status">
			                    					<a href="#" class="status-item">
			                    						총 패널티 회원<span class="span-count"> 1000</span>
			                    					</a>
			                    				</li>
			                    				<li class="li-status">
			                    					<a href="#" class="status-item">
			                    						일반회원<span class="span-count"> 666</span>
			                    					</a>
			                    				</li>
			                    				<li class="li-status">
			                    					<a href="#" class="status-item">
			                    						트레이너<span class="span-count"> 300</span>
			                    					</a>
			                    				</li>
			                    				<li class="li-status">
			                    					<a href="#" class="status-item">
			                    						센터<span class="span-count"> 34</span>
			                    					</a>
			                    				</li>
			                    			</ul>
			                    		</div>
			                    	</div>
			                    	<div class="col-md-6 div-search">
			                    		<button type="button" class="btn btn-discord br-radi-0">
			                    			<i class="fas fa-search fa-sm"></i>
			                    		</button>
	                    				<div class="div-label">
			                    			<label class="label-search">
			                    				<input type="text" class="bg-light input-search">
			                    			</label>
	                    				</div>
			                    	</div>
			                    </div>
                            	
                            	<table class="table tb1">
                            		<tr>
                            			<th>회원번호</th>
                            			<th>이름</th>
                            			<th>분류</th>	<!-- 일반회원, 트레이너, 센터 -->
                            			<th>이메일</th>
                            			<th>주소</th>
                            			<th>가입일</th>
                            			<th>신고수</th>
                            			<th>상태</th>
                            		</tr>
                            		<c:forEach var="i" begin="1" end="9" step="1">
                            			<tr>
	                            			<td class="td1">0000${i}</td>
	                            			<td class="td1">이름${i}</td>
	                            			<td class="td1">회원분류${i}</td>
	                            			<td class="td1">${i}${i}${i}${i}@${i}${i}${i}${i}.com</td>
	                            			<td class="td1">주소${i}</td>
	                            			<td class="td1">2023-12-2${i} 17:50:0${i}</td>
	                            			<td class="td1">${i}</td>
	                            			<td class="td1">상태${i}</td>
	                            		</tr>
                            		</c:forEach>
                            	</table>
                            	
                            	<!-- 페이징 영역 시작 -->
                            	<div class="row my-4">
                            		<div class="col-lg-12">
                            			<div class="pagination-area">
                            				<ul class="pagination">
                            					<!-- disabled : 페이지 버튼 비활성 -->
                            					<li class="paginate_button page-item previous disabled">	
                            						<a href="#" aria-controls="dataTable" class="page-link">
                            							◀
                            						</a>
                            					</li>
                            					<c:forEach var="i" begin="1" end="5" step="1">
                            						<c:choose>
                            							<c:when test="${i eq 1}">
                            								<li class="paginate_button page-item active">
			                            						<a href="#" aria-controls="dataTable" class="page-link">
			                            							${i}
			                            						</a>
			                            					</li>
                            							</c:when>
                            							<c:otherwise>
                            								<li class="paginate_button page-item">
			                            						<a href="#" aria-controls="dataTable" class="page-link">
			                            							${i}
			                            						</a>
			                            					</li>
                            							</c:otherwise>
                            						</c:choose>
		                            						
                            					</c:forEach>
	                            					
                            					<li class="paginate_button page-item next">
                            						<a href="#" aria-controls="dataTable" class="page-link">
                            							▶
                            						</a>
                            					</li>
                            				</ul>
                            			</div>
									</div>
                            	</div>
								<!-- 페이징 영역 끝-->
								
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