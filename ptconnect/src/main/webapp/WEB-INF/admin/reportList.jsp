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

    <title>신고 내역</title>

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
                    <h1 class="h3 my-5 pl-3 text-gray-800 font-weight-bold">신고 내역</h1>

                    <div class="row">

                        <div class="col-lg-12">

                            <!-- Circle Buttons -->
                            <div class="card shadow mb-4">
                            	<table class="table tb1">
                            		<tr>
                            			<th>
                            				<input type="checkbox" class="selectAll">
                            			</th>
                            			<th>신고번호</th>
                            			<th>누적 신고</th>
                            			<th>분류</th>
                            			<th>유형</th>
                            			<th>닉네임</th>
                            			<th>내용</th>
                            			<th>패널티여부</th>
                            			<th>글삭제여부</th>
                            			<th>신고날짜</th>
                            		</tr>
                            		<c:forEach var="i" begin="0" end="9" step="1">
                            			<tr>
                            				<td>
                            					<input type="checkbox" class="selectOne" value="${i}" data-code="${i*3}">
                            				</td>
	                            			<td>${i}</td>
	                            			<td>누적 신고${i}</td>
	                            			<td>분류${i}</td>
	                            			<td>유형${i}</td>
	                            			<td>닉네임${i}</td>
	                            			<td>
	                            				<a href="#">내용${i}</a>
	                            			</td>
	                            			<td></td>
	                            			<td></td>
	                            			<td>2023-12-1${i}</td>
	                            		</tr>
                            		</c:forEach>
                            	</table>


                            	<!-- 삭제, 복구 버튼 영역 -->
                            	<div class="row my-4">
                            		<div class="col-lg-12 d-flex justify-content-center">
                            			<a href="javascript:updateState('Y');" class="btn btn-secondary btn-icon-split btn-scale-125">
                            				<span class="icon">
                            					<i class="fas fa-trash"></i>
                            				</span>
                            				<span class="text">삭제하기</span>
                            			</a>
                            			<a href="javascript:updateState('N');" class="btn btn-light btn-icon-split btn-scale-125">
                            				<span class="icon text-gray-600">
                            					<i class="fas fa-undo"></i>
                            				</span>
                            				<span class="text">복구하기</span>
                            			</a>
                            		</div>
                            	</div>
                            	<!-- 삭제, 복구 버튼 영역 -->
                            	

                            	<!-- 페이징 영역 시작 -->
                            	<div class="row my-4">
                            		<div class="col-lg-12">
                            			<div class="pagination-area">
                            				<ul class="pagination">
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

</body>
<script>
		
	//매개변수 값 체크 - true : undefined 또는 빈 값, false : 값이 있음
	function isEmpty(value){
		if(typeof value == "undefined" || value == null || value == "" || value.length == 0){
			return true;
		}else{
			return false;
		}
	}
	
	//전체 선택 or 해제
	var selectAll = document.querySelector(".selectAll");
	var selectOneArr = document.querySelectorAll(".selectOne");
	
	selectAll.addEventListener("click", function(){
		var isChecked = selectAll.checked;
		if(isChecked){
			for(let i = 0; i < selectOneArr.length; i++){
				selectOneArr[i].checked = true;
			}
		}else{
			for(let i = 0; i < selectOneArr.length; i++){
				selectOneArr[i].checked = false;
			}
		}
	});
	
	for(let selectOne of selectOneArr){
		selectOne.addEventListener("click", function(){
			let totalCount = selectOneArr.length;
			let checkedCount = document.querySelectorAll(".selectOne:checked").length;
			if(totalCount == checkedCount){
				selectAll.checked = true;
			}else{
				selectAll.checked = false;
			}
		});
	}
	
	
	function updateState(YN){
		
		let delYN = YN;
		
		let rpno = $(".selectOne:checked");
		if(isEmpty(rpno)){
			alert("변경할 글을 선택해주세요");
			return;
		}else{
			let rpnoArr = [];
			let rpbdnoArr = [];
			for(let i = 0; i < rpno.length; i++){
				rpnoArr.push(rpno[i].value);
				rpbdnoArr.push(rpno[i].dataset['code']);
			}
			console.log(delYN);
			console.log(rpnoArr);
			console.log(rpbdnoArr);
			
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/",
				traditional: true,
				data: {"delYN" : delYN,
						"rpnoArr" : JSON.stringify(rpnoArr),
						"rpbdnoArr" : JSON.stringify(rpbdnoArr)
				},
				cache: false,
				success: function(data){
					if(data.value != 0){
						if(delYN == 'Y'){
							alert(data.value + "개의 글이 삭제 되었습니다.");
							location.reload();
						}else{
							alert(data.value + "개의 글이 복구 되었습니다.");
							location.reload();
						}
					}else if(data.value == 0){
						alert("변경된 글이 없습니다.")
					}
				},
				error: function(){
					alert("글 변경 에러");
				}
			});	//ajax 끝
			
		}
			
	}//updateState() 끝
	
		
	$(document).ready(function(){
		
		//신고목록에서 신고된 원본글 삭제 & 복구
// 		function updateState(YN){
			
// 			let delYN = YN;
			
// 			let rpno = $(".selectOne:checked");
// 			alert(rpno.length());
// 			for(let i = 0; i < rpno.length; i++){
// 				console.log(rpno[i]);
// 			}
			
// 			let rpnoArr = [];	//rpno들을 담는 배열
// 			let reportedBoardNum = [];
// 			reportedBoardNum = $(".deleteBox:checked").parent(".delCheck").siblings(".reportedBdno").children(".rptNum");
// 			let reportedBoardNumArr = [];	//신고된 글들의 번호를 담는 배열
			
// 			if(rpno.length == 0){
// 				alert("삭제할 글을 선택해주세요");
// 				return;
// 			}else{
				
// 				$(rpno).each(function(){
// 					rpnoArr.push($(this).val());
// 				});
				
// 				for (var i = 0; i < reportedBoardNum.length; i++) {
// 					reportedBoardNumArr.push(reportedBoardNum[i].value);
// 					console.log(reportedBoardNumArr[i]);
// 				}			
				
// 				if (confirm('정말 변경 하시겠습니까?')) {
// 					$.ajax({
// 						type : "post",
// 						url : "${pageContext.request.contextPath}/report/reportedBoardDeleteUpdate.do",
// 						traditional : true,
// 						data : {"delYN" : delYN,
// 								"rpnoArr" : JSON.stringify(rpnoArr),
// 								"reportedBoardNumArr" : JSON.stringify(reportedBoardNumArr)},
// 						dataType : "json",
// 						cache : false,
// 						success : function(data){
// 							if(data.value != 0){
// 								if(delYN == 'Y'){
// 									alert(data.value + " 개의 글이 삭제 됐습니다.");
// 									location.reload();
// 								}else{
// 									alert(data.value + " 개의 글이 삭제 취소 됐습니다.");
// 									location.reload();
// 								}
// 							}else if(data.value == 0){
// 								alert("삭제된 글이 없습니다.");
// 							}
// 						},
// 						error : function(){
// 							alert("삭제 에러");
// 						}
// 					});
// 				}else {
// 					return;
// 				}
// 			}
// 		}
		
		
	});
	
	
	
</script>
</html>