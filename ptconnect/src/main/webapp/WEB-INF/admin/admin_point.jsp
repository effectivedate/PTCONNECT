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

    <title>관리자 포인트내역 페이지</title>

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
                    <h1 class="h3 mb-4 text-gray-800">포인트 내역</h1>
                    
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <div class="row">

                        <div class="col-lg-12">

                            <!-- Circle Buttons -->
                            <div class="card shadow mb-4">
                            	<table class="table tb1">
                            		<tr class = "table-head">
                            			<td>주문번호</td>
                            			<td>사용자</td>
                            			<td>내용</td>
                            			<td>변동금액</td>
                            			<td>잔여포인트</td>
                            			<td>변동날짜</td>
                            		</tr>
                            		<c:forEach var="i" begin="1" end="20" step="1">
                            			<tr class = "point-list" data-toggle="modal" data-target="#pointListModal">
                            				<td class="point-order">주문번호${i}</td>
	                            			<td class="point-user">사용자${i}</td>
	                            			<td class="point-cont">상품구매${i}</td>
	                            			<td class="point-change">${i}000p</td>
	                            			<td class="point-remain">${i}0000p</td>
	                            			<td class="point-date">2023.12.${i}</td>
	                            		</tr>
                            		</c:forEach>
                            	</table>
                            	<div class="row mt-4">
                            		<div class="col-lg-12">
                            			<div class="pagination-area">
                            				<ul class="pagination">
                            					<li class="paginate_button page-item previous">
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
    
    <!-- Modal -->
	<div class="modal fade" id="pointListModal" tabindex="-1" role="dialog" aria-labelledby="pointListModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="pointListModalLabel">포인트 상세 정보</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                <table>
	                	<tr>
	                		<td>주문번호</td>
	                		<td></td>
	                	</tr>
	                	<tr>
	                		<td>회원이름</td>
	                		<td></td>
	                	</tr>
	                	<tr>
	                		<td>구매상품</td>
	                		<td></td>
	                	</tr>
	                	<tr>
	                		<td>내용</td>
	                		<td></td>
	                	</tr>
	                	<tr>
	                		<td>변동 포인트</td>
	                		<td></td>
	                	</tr>
	                	<tr>
	                		<td>잔여 포인트</td>
	                		<td></td>
	                	</tr>
	                	<tr>
	                		<td>변동일</td>
	                		<td></td>
	                	</tr>
	                	
	                
	                </table>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
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

</body>
</html>