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

    <title>관리자 쿠폰관리 페이지</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/css/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/review-admin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/css/review-admin.css" rel="stylesheet">
    
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
                    <h1 class="h3 mb-4 text-gray-800">쿠폰 관리</h1>

                    <div class="row">
                    
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

                        <div class="col-lg-12">

                            <!-- Circle Buttons -->
                            <div class="card shadow mb-4">
                            	<table class="table tb1">
                            		<tr class = "table-head">
                            			<td>
                            				<label for="selectAll" class="label-selectAll">
												<input type="checkbox" id="selectAll" class="selectAll">
											</label>
                            			</td>
                            			<td>쿠폰번호</td>
                            			<td>발행자</td>
                            			<td>쿠폰이름</td>
                            			<td>할인률</td>
                            			<td>유효기간</td>
                            			<td>생성날짜</td>
                            			<td>쿠폰상태</td>
                            			<td>
	                            			<button class="coupon-insert-btn" style="margin-bottom: 5px;">선택발급</button>
                            				<button class="coupon-stop-btn">선택중지</button>
                            			</td>
                            		</tr>
                            		<c:forEach var="i" begin="1" end="10" step="1">
                            			<tr class = "coupon-list" data-target="review-cont-${i}">
	                            			<td class="list-checkbox">
	                            				<input type="checkbox" class="deleteBox">
	                            			</td>
	                            			<td class="">쿠폰번호${i}</td>
	                            			<td class="">관리자</td>
	                            			<td class="">회원가입축하</td>
	                            			<td class="">${i}%</td>
	                            			<td class="">${i}일</td>
	                            			<td class="">2023.12.${i}</td>
	                            			<td class="">발급중지</td>
	                            			<td class="list-delete">
	                            				<button class="coupon-insert-btn" style="margin-bottom: 5px;">발급하기</button>
	                            				<button class="coupon-stop-btn">발급중지</button>
	                            			</td>
	                            		</tr>
                            		</c:forEach>
                            	</table>
                            	
                            	<div class="notice-wirte-area">
	                            	<button class="coupon-modify-btn">수정</button>
                            		<button class="coupon-delete-btn">삭제</button>
                            	</div>
                            	
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

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/css/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/css/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/css/admin/js/sb-admin-2.min.js"></script>

	
	<script>
	
	var selectAllBtn = document.querySelector("#selectAll");
	
	selectAllBtn.addEventListener("click", function(){
		var isChecked = selectAllBtn.checked;
		var deleteBox = document.querySelectorAll(".deleteBox");
		if(isChecked){
			for(let i = 0; i < deleteBox.length; i++){
				deleteBox[i].checked = true;
			}
		}else{
			for(let i = 0; i < deleteBox.length; i++){
				deleteBox[i].checked = false;
			}
		}
	});
	
	let checkBoxes = document.querySelectorAll(".deleteBox");
	for(let checkBox of checkBoxes){
		checkBox.addEventListener("click", function(){
			let totalCount = checkBoxes.length;
			let checkedCount = document.querySelectorAll(".deleteBox:checked").length;
			if(totalCount == checkedCount){
				selectAllBtn.checked = true;
			}else{
				selectAllBtn.checked = false;
			}
		});
	}
	
	</script>
	
	<script>
	
	$(document).ready(function() {
		
		$(".coupon-insert-btn").on("click", function() { 
			
			if(confirm("발급하시겠습니까?")) {
				return;
			}else {
				return;
			}
		});
		
		
		$(".coupon-stop-btn").on("click", function() { 
			if(confirm("중지하시겠습니까?")) {
				return;
			}else {
				return;
			}
		});
		
		$(".coupon-modify-btn").on("click", function() { 
			location.href = "./admin_coupon_modify.jsp";
		});
		
		$(".coupon-delete-btn").on("click", function() { 
			
			if(confirm("삭제하시겠습니까?")) {
				return;
			}else {
				return;
			}
		});
		
	});
	
	</script>

</body>
</html>