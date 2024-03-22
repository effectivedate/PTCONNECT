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

    <title>회원 관리</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/admin/css/sb-admin-2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/userManagement.css" rel="stylesheet">
	
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
                    <h1 class="h3 my-5 pl-3 text-gray-800 font-weight-bold">회원 관리</h1>
                    

	                    

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
			                    						총 회원<span class="span-count"> 123654</span>
			                    					</a>
			                    				</li>
			                    				<li class="li-status">
			                    					<a href="#" class="status-item">
			                    						일반회원<span class="span-count"> 120000</span>
			                    					</a>
			                    				</li>
			                    				<li class="li-status">
			                    					<a href="#" class="status-item">
			                    						트레이너<span class="span-count"> 3000</span>
			                    					</a>
			                    				</li>
			                    				<li class="li-status">
			                    					<a href="#" class="status-item">
			                    						센터<span class="span-count"> 654</span>
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
                            			<th>상태</th>
                            		</tr>
                            		<c:forEach var="i" begin="1" end="9" step="1">
                            			<tr class="tr-uid" data-code="${i}" data-toggle="modal" data-target="#userInfoModal">
	                            			<td class="td1">0000${i}</td>
	                            			<td class="td1">이름${i}</td>
	                            			<td class="td1">회원분류${i}</td>
	                            			<td class="td1">${i}${i}${i}${i}@${i}${i}${i}${i}.com</td>
	                            			<td class="td1">주소${i}</td>
	                            			<td class="td1">2023-12-2${i} 17:50:0${i}</td>
	                            			<td class="td1">상태${i}</td> <!-- 가입, 승인대기, 7일 정지, 영구정지, 탈퇴 -->
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

    <!-- 유저 정보 모달-->
    <div class="modal fade" id="userInfoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-gray-900 text-lg font-weight-bold" id="exampleModalLabel">유저 정보</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                	
                </div>
                <div class="modal-footer modal-footer-modify">
                	<div class="modal-footer-div1">
						<!-- <a class="btn btn-discord" href="#">1:1 채팅</a>
						<a class="btn btn-discord" href="#">페이지 이동</a>
						<a class="btn btn-cancel" id="penaltyBtn" href="#" onclick="">패널티 부여</a>
						<button class="btn btn-secondary" type="button" data-dismiss="modal">취소하기</button> -->
                	</div>
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
		
		//사이드바 활성화 표시
		function activeNavItem(){
			
			let currentNav = $(".nav-item");
			for(let i = 0; i < currentNav.length; i++){
				$(currentNav[i]).removeClass("active");
			}
			if($(".collapse").hasClass("show")){
				$(".collapse").removeClass("show");
			}
			if($(".collapse-item").hasClass("active")){
				$(".collapse-item").removeClass("active");
			}
			
			//사이드바  선택된 메뉴에 활성화 & 강조표시(위에서부터(0부터) n번째)
			$(currentNav[4]).addClass("active");
			//드롭다운 메뉴 없이 단일항목이면 이 주석 & 아래 2줄 삭제
			$(currentNav[4]).find(".collapse").addClass("show");	//드롭다운 활성화
			//드롭다운 메뉴 중 선택된 메뉴 글씨 강조 ex) eq(n) : n번 째 메뉴 글씨 강조 (0부터 시작)
			$(currentNav[4]).find(".collapse-item:eq(0)").addClass("active");
		}
		activeNavItem();
		
		$(document).ready(function(){
			
			//매개변수 빈 값 체크
			function isEmpty(value){
				if(typeof value == "undefined" || value == null || value == ""){
					return true;
				}else{
					return false;
				}
			}
			
			$(".tr-uid").on("mouseover", function(){
				$(this).addClass("td1-gray");
			});
			
			$(".tr-uid").on("mouseleave", function(){
				$(this).removeClass("td1-gray");
			});
			
			$(".tr-uid").on("click", function(){
				
				let uidx = $(this).data("code");
				userInfoModalMaker(uidx);
// 				if(uidx != null || uidx != ""){
// 					$.ajax({
// 						type: "post",
// 						url: "${pageContext.request.contextPath}/user/userInfo.do",
// 						data: {"uidx" : uidx},
// 						dataType: "json",
// 						success: function(data){
// 							userInfoMaker(data);
// 						},
// 						error : function(){
// 							alert("유저 정보 불러오기 에러");
// 							return;
// 						}
// 					});
// 				}else{
// 					alert();
// 					return;
// 				}
				
				//$(this).attr("data-toggle", "modal");
				//alert($(this).data("code"));
			});
			
			$(".btn-chat").on("click", function(){
				event.stopPropagation();
				alert("채팅하기 버튼 누름");
			});
			
			$(document).on("click", "#penaltyBtn", function() {
				let uidx = $(this).data("idx");
				penaltyModalMaker(uidx);
			});
			
			$(document).on("click", "#backToUserInfo", function() {
				let uidx = $(this).data("idx");
				userInfoModalMaker(uidx);
			});
			
			$(document).on("click", "#penaltyInsert", function() {
				let uidx = $(this).data("idx");
				if(confirm("패널티를 부여하시겠습니까?" + uidx)){
					alert("패널티가 부여되었습니다.");
					userInfoModalMaker(uidx);
					return;
				}else{
					return;
				}
			});
			
// 			function penaltyInsert(){
// 				alert("penaltyInsert");
// 			}
			
// 			$("#penaltyBtn").on("click", function(){
// 				penaltyModalMaker();
// 			});
			
			//모달 html
			function userInfoModalMaker(uidx){
				
				let headerStr = "";
				let bodyStr = "";
				let footerStr = "";
				
// 				if(isEmpty(data)){
// 					$(".modal-header").html(headerStr);
// 					$(".modal-body").html(bodyStr);
// 					return;
// 				}else{
					headerStr	+=	"<h5 class='modal-title text-gray-900 text-lg font-weight-bold' id='exampleModalLabel'>유저 정보</h5>"
								+	"<button class='close' type='button' data-dismiss='modal' aria-label='Close'>"
								+		"<span aria-hidden='true'>×</span>"
								+	"</button>";
					bodyStr 	+= "<div class='info-area'>"
								+		"<div class='my-3 d-flex jc-between'>"
								+		"<span class='text-gray-800 text-lg font-weight-bold'>이름</span>"
								+		"<div class=''>"
								+			"<span class=''>고길동</span>"	//this.asd
								+			"<span class='font-weight-bold ml-4'>트레이너</span>"
								+		"</div>"
								+		"</div>"
								+		"<div class='my-3 d-flex jc-between'>"
								+			"<span class='text-gray-800 text-lg font-weight-bold'>가입일</span>"
								+			"<span class='''>2023-01-02</span>"
								+		"</div>"
								+		"<div class='my-3 d-flex jc-between'>"
								+			"<span class='text-gray-800 text-lg font-weight-bold'>소속 센터</span>"
								+			"<span class=''>이젠 피트니스</span>"
								+		"</div>"
								+		"<div class='my-3 d-flex jc-between'>"
								+			"<span class='text-gray-800 text-lg font-weight-bold'>1회 체험가격</span>"
								+			"<span class=''>35,000</span>"
								+		"</div>"
								+		"<div class='my-3 d-flex jc-between'>"
								+			"<span class='text-gray-800 text-lg font-weight-bold'>리뷰 수</span>"
								+			"<span class=''>24</span>"
								+		"</div>"
								+		"<div class='mt-5 mb-3 d-flex jc-between'>"
								+			"<span class='text-gray-800 text-lg font-weight-bold'>판매량</span>"
								+			"<span class=''>32</span>"
								+		"</div>"
								+		"<div class='mb-5 d-flex jc-between'>"
								+			"<span class='text-gray-800 text-lg font-weight-bold'>판매액</span>"
								+			"<span class=''>1,120,000</span>"
								+		"</div>"
								+		"<div class='my-3 d-flex jc-between'>"
								+			"<span class='text-gray-800 text-lg font-weight-bold'>누적 신고수</span>"
								+			"<span class=''>5</span>"
								+		"</div>"
								+		"<div class='my-3 d-flex jc-between'>"
								+			"<span class='text-gray-800 text-lg font-weight-bold text-nowrap overflow-hidden'>최근 신고 사유</span>"
								+			"<span class='text-truncate' style='max-width: 50%;'>환불 신청을 했는데 트레이너가 어쩌고...(2023-12-16)</span>"
								+		"</div>"
								+		"<div class='my-3 d-flex jc-between'>"
								+			"<span class='text-gray-800 text-lg font-weight-bold'>최근 패널티</span>"
								+			"<span class=''>없음</span>"
								+		"</div>"
								+	"</div>";
					footerStr	+=	"<div class='modal-footer-div1'>"
								+		"<a class='btn btn-discord' href='#'>1:1 채팅</a>"
								+		"<a class='btn btn-discord' href='#'>페이지 이동</a>"
								+		"<a class='btn btn-cancel' data-toggle='modal' id='penaltyBtn' data-idx='"+uidx+"' href='#'>패널티 부여</a>"
								+		"<button class='btn btn-secondary' type='button' data-dismiss='modal'>취소하기</button>"
								+	"</div>";								
						
					$(".modal-header").html(headerStr);
					$(".modal-body").html(bodyStr);
					$(".modal-footer").html(footerStr);
					
					return;
// 				}
			}
			
			//패널티 부여 모달
			function penaltyModalMaker(uidx){
				
				let headerStr = "";
				let bodyStr = "";
				let footerStr = "";
				
// 				if(isEmpty(data)){
// 					$(".modal-header").html(headerStr);
// 					$(".modal-body").html(bodyStr);
// 					$(".modal-footer").html(footerStr);
// 					return;
// 				}else{
					headerStr	+=	"<a href='#' class='btn btn-icon-split btn-discord'>"
								+	"<span class='icon'>"
								+		"<i class='fas fa-arrow-left'></i>"
								+	"</span>"
								+		"<span class=text font-weight-bold' id='backToUserInfo' data-idx='"+uidx+"'>유저 정보</span>"
								+	"</a>"
								+	"<button class='close' type='button' data-dismiss='modal' aria-label='Close'>"
								+		"<span aria-hidden='true'>×</span>"
								+	"</button>";
					bodyStr		+=	"<div class='info-area'>"
								+		"<div class='my-3 d-flex jc-between'>"
								+		"<span class='text-gray-800 text-lg font-weight-bold'>이름</span>"
								+		"<div class=''>"
								+			"<span class=''>고길동</span>"	//this.asd
								+			"<span class='font-weight-bold ml-4'>트레이너</span>"
								+		"</div>"
								+		"</div>"
								+		"<div class='my-3 d-flex jc-between'>"
								+			"<span class='text-gray-800 text-lg font-weight-bold'>가입일</span>"
								+			"<span class=''>2023-01-02</span>"
								+		"</div>"
								+		"<div class='my-3 d-flex'>"
								+			"<span class='text-gray-800 text-lg font-weight-bold'>패널티 선택</span>"
								+		"</div>"
								+		"<div class='my-3 d-flex'>"
								+			"<select class='select-penalty'>"
								+				"<option class='option-penalty' value='N' selected>패널티 없음</option>"
								+				"<option class='option-penalty' value='1W'>1주일 정지</option>"
								+				"<option class='option-penalty' value='1M'>1달 정지</option>"
								+				"<option class='option-penalty' value='X'>영구 정지</option>"
								+			"</select>"
								+		"</div>"
								+		"<div class='my-3 d-flex jc-between'>"
								+			"<span class='text-gray-800 text-lg font-weight-bold'>패널티 사유</span>"
								+		"</div>"
								+		"<div class='my-3 d-flex'>"
								+			"<textarea class='modal-text'></textarea>"
								+		"</div>"
								+	"</div>";
					footerStr	+=	"<div class='modal-footer-div1'>"
								+		"<a class='btn btn-cancel' data-toggle='modal' data-idx='"+uidx+"' id='penaltyInsert' href='#'>패널티 부여</a>"
								+		"<button class='btn btn-secondary' type='button' data-dismiss='modal'>취소하기</button>"
								+	"</div>";
						
					$(".modal-header").html(headerStr);
					$(".modal-body").html(bodyStr);
					$(".modal-footer").html(footerStr);
					
					return;
// 				}
			}
			
			
		});	
		
	</script>
	
</body>
</html>