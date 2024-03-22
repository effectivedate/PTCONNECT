<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/center.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/index.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/orderList.css" type="text/css" rel="stylesheet">

<%-- <link href="${pageContext.request.contextPath}/resources/css/admin/css/sb-admin-2.css" rel="stylesheet"> --%>
<%-- <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/index.css" rel="stylesheet"> --%>
<link href="${pageContext.request.contextPath}/resources/css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div>
		<div>
			<div>
				<div> <!--헤더+맵-->
					<jsp:include page="../include/header.jsp"/>
					<section><!-- 섹션 -->
						<jsp:include page="../include/centerHeader.jsp"/>
						<script>
							window.onload = function() {
								$('#trainer_tab3').addClass('active_tab');
							}
						</script>
						<div class="gray_background"><!-- 회색배경 -->
							<div class="my_container"><!-- 코치정보(마진오토) -->
								<div class="inner_contents"><!-- 코치정보(패딩탑) -->
									<div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 my-5 pl-3 text-gray-800 font-weight-bold">트레이너 등록 요청</h1>

                    <div class="row">

                        <div class="col-lg-12">

                            <!-- Circle Buttons -->
                            <div class="card shadow mb-4">
                            	<table class="table tb1">
                            		<tr>
                            			<th>승인번호</th>
                            			<th>트레이너 이름</th>
<!--                             			<th>소속 센터</th> -->
                            			<th>이메일</th>
                            			<th>전화번호</th>
                            			<th>생성일</th>
                            			<th>승인여부</th>
                            		</tr>
                            		<c:if test="${not empty tList}">
                            		
	                            		<c:forEach var="tio" items="${tList}">
	                            			<tr>
		                            			<td>${tio.tnNo}</td>
		                            			<td>${tio.mbName}</td>
	<%-- 	                            			<td>${tio.tnNo}</td> --%>
		                            			<td>${tio.mbEmail}</td>
		                            			<td>${tio.mbPhone}</td>
		                            			<td>${tio.tnDate}</td>
		                            			<td>
		                            				<div>
		                            					<div onclick="doCheck(${tio.tnNo},${tio.mbNo})" class="btn btn-circle color-discord">
		                            						<i class="fas fa-check"></i>
		                            					</div>
		                            					<div onclick="unDoCheck(${tio.tnNo},${tio.mbNo})" class="btn btn-circle color-cancel">
		                            						<i class="fas fa-times"></i>
		                            					</div>
		                            				</div>
		                            			</td>
		                            		</tr>
	                            		</c:forEach>
                            		
                            		</c:if>
                            	</table>
                            	
                            	<c:if test="${empty tList}">
                            			<div style="padding: 150px 0;">
                            				<h2 style="font-weight: bold; text-align: center;">등록 요청한 트레이너가 없습니다!</h2>
                            			</div>
                            	</c:if>
                            	
                            	<!-- 삭제, 복구 버튼 영역 -->
                            	<!-- <div class="row my-4">
                            		<div class="col-lg-12 d-flex justify-content-center">
                            			<a href="#" class="btn btn-secondary btn-icon-split btn-scale">
                            				<span class="icon">
                            					<i class="fas fa-trash"></i>
                            				</span>
                            				<span class="text">삭제하기</span>
                            			</a>
                            			<a href="#" class="btn btn-light btn-icon-split btn-scale">
                            				<span class="icon text-gray-600">
                            					<i class="fas fa-undo"></i>
                            				</span>
                            				<span class="text">복구하기</span>
                            			</a>
                            		</div>
                            	</div> -->
                            	<!-- 삭제, 복구 버튼 영역 -->
                            	
                            	<!-- 페이징 영역 시작 -->
                            	<div class="row my-4">
                            		<div class="col-lg-12">
                            			<div class="pagination-area" style="margin-top: 0px;">
                            				<ul class="pagination">
                            					<li class="paginate_button page-item previous">
													<c:if test="${pm.prev eq true}">
                            						<a href="./${pm.prev}" aria-controls="dataTable" class="page-link">
                            							◀
                            						</a>
                            						</c:if>
                            					</li>
                            					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
                            						<c:choose>
                            							<c:when test="${i eq currentPage}">
                            								<li class="paginate_button page-item active">
			                            						<a href="./${i}" aria-controls="dataTable" class="page-link">
			                            							${i}
			                            						</a>
			                            					</li>
                            							</c:when>
                            							<c:otherwise>
                            								<li class="paginate_button page-item">
			                            						<a href="./${i}" aria-controls="dataTable" class="page-link">
			                            							${i}
			                            						</a>
			                            					</li>
                            							</c:otherwise>
                            						</c:choose>
		                            						
                            					</c:forEach>
	                            					
                            					<li class="paginate_button page-item next">
												<c:if test="${pm.next eq true && pm.endPage > 0}">
                            						<a href="./${pm.next}" aria-controls="dataTable" class="page-link">
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
								</div>
							</div>
						</div>
					</section>
					<jsp:include page="../include/footer.jsp"/>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
			if(${not empty msg}){
				alert('${msg}');
			}
		});
	</script>
	
	<script>
		function doCheck(tnNo,mbNo){
			if(confirm('승인하시겠습니까?')){
				location.href="${pageContext.request.contextPath}/centerTrainer/"+tnNo+"/"+mbNo+"/${pm.currentPage}";
			}
		}
	</script>
	
</body>
</html>