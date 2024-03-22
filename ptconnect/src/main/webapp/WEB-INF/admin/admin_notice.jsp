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

    <title>관리자 공지사항 페이지</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/css/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/index.css" rel="stylesheet">
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
                    <h1 class="h3 mb-4 text-gray-800">공지사항</h1>

                    <div class="row">
                    	
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
                            			<td>글번호</td>
                            			<td>작성자</td>
                            			<td>제목</td>
                            			<td>작성일</td>
                            			<td style="text-align: right;">
<!--                             				<button class="notice-delete-btn">선택 삭제</button> -->
                            			</td>
                            		</tr>
                            		<c:forEach var="notice" items="${ntList}">
                            			<tr class = "review-list" data-target="review-cont-${i}">
	                            			<td class="list-checkbox">
	                            				<input type="checkbox" class="deleteBox">
	                            			</td>
	                            			<td class="notice-num">${notice.bdNo}</td>
	                            			<td class="notice-writer">${notice.mbName}</td>
	                            			<td class="notice-subject" onclick="location.href='./admin_notice_detail?bdNo=${notice.bdNo}'">${notice.ntTitle}</td>
	                            			<td class="notice-date">${notice.bdDate}</td>
	                            			<td class="notice-delete" style="text-align: right;">
	                            				<button class="notice-modify-btn"  onclick="location.href='./admin_notice_modify?bdNo=${notice.bdNo}'">수정</button>
	                            				<button class="notice-delete-btn" onclick="confirmDelete(${notice.bdNo})">삭제</button>
	                            			</td>
	                            		</tr>
                            		</c:forEach>
                            	</table>
                            	<div class="notice-wirte-area">
                            		<button class="notice-write-btn" onclick="location.href='./admin_notice_write'">글쓰기</button>
                            	</div>
                            	<!-- 페이징 영역 시작 -->
	                            	<div class="row my-4">
	                            		<div class="col-lg-12">
	                            			<div class="pagination-area">
	                            				<ul class="pagination">
	                            					<li class="paginate_button page-item previous">
															<c:if test="${pm.prev eq true}">
		                            						<a href="admin_notice${pm.startPage-1}" aria-controls="dataTable" class="page-link">
		                            							◀
		                            						</a>
		                            						</c:if>
	                            					</li>
		                            					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
		                            						<c:choose>
		                            							<c:when test="${i eq pm.currentPage}">
		                            								<li class="paginate_button page-item active">
					                            						<a href="admin_notice${i}" aria-controls="dataTable" class="page-link">
					                            							${i}
					                            						</a>
					                            					</li>
		                            							</c:when>
		                            							<c:otherwise>
		                            								<li class="paginate_button page-item">
					                            						<a href="admin_notice${i}" aria-controls="dataTable" class="page-link">
					                            							${i}
					                            						</a>
					                            					</li>
		                            							</c:otherwise>
		                            						</c:choose>
				                            						
		                            					</c:forEach>
	                            					<li class="paginate_button page-item next">
															<c:if test="${pm.next eq true && pm.endPage > 0}">
		                            						<a href="admin_notice${pm.endPage+1}" aria-controls="dataTable" class="page-link">
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
		    function confirmDelete(bdNo) {
		        if (confirm("정말로 삭제하시겠습니까?")) {

		        	window.location.href = "./admin_notice_delete_action?bdNo=" + bdNo;
		        	
		        	alert("삭제가 완료되었습니다.");
		        	
		        } else {
		        	
		        	return;
		        	
		        }
		    }
		</script>
		
</body>
</html>