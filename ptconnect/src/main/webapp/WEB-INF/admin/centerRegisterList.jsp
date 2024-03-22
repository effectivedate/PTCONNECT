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

    <title>센터 등록 요청</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/css/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/index.css" rel="stylesheet">

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
                    <h1 class="h3 my-5 pl-3 text-gray-800 font-weight-bold">센터 등록 요청</h1>

                    <div class="row">

                        <div class="col-lg-12">

                            <!-- Circle Buttons -->
                            <div class="card shadow mb-4">
                            	<table class="table tb1">
                            		<tr>
                            			<th>승인번호</th>
                            			<th>센터 이름</th>
                            			<th>센터 연락처</th>
                            			<th>센터 위치</th>
                            			<th>이메일</th>
                            			<th>사업자번호</th>
                            			<th>가입일</th>
                            			<th>승인여부</th>
                            		</tr>
                            		<c:if test="${not empty cList}">
	                            		<c:forEach var="cio" items="${cList}">
	                            			<tr>
		                            			<td>${cio.ctNo}</td>
		                            			<td>${cio.ctName}</td>
		                            			<td>${cio.mbPhone}</td>
		                            			<td>${cio.mbAddr}</td>
		                            			<td>${cio.mbEmail}</td>
		                            			<td>${cio.ctBn}</td>
		                            			<td>${cio.mbDate}</td>
		                            			<td>
		                            				<div>
		                            					<div onclick="doCheck(${cio.ctNo})" class="btn btn-circle color-discord doCheck">
		                            						<i class="fas fa-check"></i>
		                            					</div>
		                            					<div onclick="unDoCheck(${cio.ctNo})" class="btn btn-circle color-cancel unDoCheck">
		                            						<i class="fas fa-times"></i>
		                            					</div>
		                            				</div>
		                            			</td>
		                            		</tr>
	                            		</c:forEach>
                            		</c:if>
                            	</table>
                            	
                            	<c:if test="${empty cList}">
                            			<div style="padding: 150px 0;">
                            				<h2 style="font-weight: bold; text-align: center;">등록 요청한 센터가 없습니다!</h2>
                            			</div>
                            	</c:if>
                            	
                            	<!-- 페이징 영역 시작 -->
                            	<div class="row my-4">
                            		<div class="col-lg-12">
                            			<div class="pagination-area">
                            				<ul class="pagination">
                            					<li class="paginate_button page-item previous">
													<c:if test="${pm.prev eq true}">
                            						<a href="${pm.prev}" aria-controls="dataTable" class="page-link">
                            							◀
                            						</a>
                            						</c:if>
                            					</li>
                            					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
                            						<c:choose>
                            							<c:when test="${i eq currentPage}">
                            								<li class="paginate_button page-item active">
			                            						<a href="${pageContext.request.contextPath}/admin/centerRegisterList/${i}" aria-controls="dataTable" class="page-link">
			                            							${i}
			                            						</a>
			                            					</li>
                            							</c:when>
                            							<c:otherwise>
                            								<li class="paginate_button page-item">
			                            						<a href="${pageContext.request.contextPath}/admin/centerRegisterList/${i}" aria-controls="dataTable" class="page-link">
			                            							${i}
			                            						</a>
			                            					</li>
                            							</c:otherwise>
                            						</c:choose>
		                            						
                            					</c:forEach>
	                            					
                            					<li class="paginate_button page-item next">
												<c:if test="${pm.next eq true && pm.endPage > 0}">
                            						<a href="${pm.next}" aria-controls="dataTable" class="page-link">
                            							▶
                            						</a>
                            					</c:if>
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
	$(document).ready(function(){
		if(${not empty msg}){
			alert('${msg}');
		}
	});
</script>
<script>
	function doCheck(value){
		if(confirm('승인하시겠습니까?')){
			location.href="${pageContext.request.contextPath}/admin/centerRegister/"+value+"/${pm.currentPage}";
		}
	}
</script>
</body>
</html>