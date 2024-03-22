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
<link href="${pageContext.request.contextPath}/resources/css/trainer.css" type="text/css" rel="stylesheet">
<%-- <link href="${pageContext.request.contextPath}/resources/css/admin/css/sb-admin-2.css" rel="stylesheet"> --%>
<%-- <link href="${pageContext.request.contextPath}/resources/css/admin/normal_css/index.css" rel="stylesheet"> --%>
<link href="${pageContext.request.contextPath}/resources/css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<style>
.inner_contents {
	display: grid;
    grid-template-columns: repeat(3, 1fr); /* 한 줄에 4개의 열을 설정합니다. */
    grid-gap: 50px;
	margin-top: 50px;
    justify-content: center;
}
.right_bar{
    width: 300px;
    max-width: 100%;
}
.trainer_profile {
    height: 387px;
}

.row {
	margin-bottom: 0px !important;
	margin-top: -30px !important;
    padding-bottom: 50px;
}
</style>

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
								$('#trainer_tab4').addClass('active_tab');
							}
						</script>
						<div class="gray_background"><!-- 회색배경 -->
							<div class="my_container"><!-- 코치정보(마진오토) -->
								<div class="inner_contents"><!-- 코치정보(패딩탑) -->
									<c:if test="${not empty centerTrainerList}">
									<c:forEach var="centerTrainerList" items="${centerTrainerList}">
									<!-- 트레이너 프로필 -->
									<a href="${pageContext.request.contextPath}/trainerInfoView?tnNo=${centerTrainerList.tnNo}">
									<div class="right_bar">
										<div class="trainer_profile">
											<div class="upside">
<!-- 												<div class="report_button"> -->
<!-- 													&#x1F6A8 -->
<!-- 												</div> -->
												<div>
													<div>
														<c:choose>
															<c:when test="${centerTrainerList.flNo ne 0}">
																<img class="trainer_round_image" src="${pageContext.request.contextPath}/resources/download/${centerTrainerList.tnImage}"
																	style="border: 1px solid #5865F2"
																	alt="트레이너 프로필 사진"
																	onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/img/mainbanner2.png'">
															</c:when>
															<c:otherwise>
																<img class="trainer_round_image" src="${pageContext.request.contextPath}/resources/img/mainbanner2.png"
																	alt="트레이너의 사진이 없습니다."
																	style="border: 1px solid #5865F2">
															</c:otherwise>
														</c:choose>
													</div>
													<div>
														<div class="trainer_name">${centerTrainerList.mbName}</div>
														<div class="center_name" onclick="centerInfoView()">${centerTrainerList.ctName}</div>
														<div class="stars">
															<c:choose>
																<c:when test="${centerTrainerList.reviewRate ge 4.5}">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																</c:when>
																<c:when test="${centerTrainerList.reviewRate ge 4}">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																</c:when>
																<c:when test="${centerTrainerList.reviewRate ge 3}">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																</c:when>
																<c:when test="${centerTrainerList.reviewRate ge 2}">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																</c:when>
																<c:when test="${centerTrainerList.reviewRate gt 0}">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																</c:when>
																<c:otherwise>
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																</c:otherwise>
															</c:choose>
															<span class="review_wrap">
																<span class="rating">${centerTrainerList.reviewRate}</span>
																<span class="count" onclick="review()">(${centerTrainerList.reviewCnt})</span>
															</span>
														</div>
														<div class="pickup_line">"${centerTrainerList.tnOneLine}"</div>
														<div class="list_wrap">
															<div class="flex_box" style="height: 70px; overflow: auto;">
																<span class="left">자격검증</span>
																<span class="right">${centerTrainerList.qualify}</span>
															</div>
															<!-- <div class="flex_box">
																<span class="left">전문분야</span><span class="right">프로그램을 추가하세요</span>
															</div> -->
															<div class="flex_box">
																<span class="left">대표가격</span><span class="right">1회 체험권 <span class="span_tnTicket">${centerTrainerList.tnTicket}</span> 원</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									</a>
									<!-- 코치프로필 -->
									</c:forEach>
									</c:if>
									
									
								</div>
								<c:if test="${empty centerTrainerList}">
                            		<div style="padding: 150px 0;">
                            			<h1 style="font-weight: bold; text-align: center;">소속 트레이너가 없습니다!</h1>
                            		</div>
                            	</c:if>
								
								<!-- 페이징 영역 시작 -->
                            	<div class="row my-4">
                            		<div class="col-lg-12">
                            			<div class="pagination-area" style="margin-top: 0px;">
                            				<ul class="pagination">
                            					<li class="paginate_button page-item previous">
													<c:if test="${pm.prev eq true}">
                            						<a href="centerMyTrainer${pm.startPage - 1}" aria-controls="dataTable" class="page-link">
                            							◀
                            						</a>
                            						</c:if>
                            					</li>
                            					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
                            						<c:choose>
                            							<c:when test="${i eq pm.currentPage}">
                            								<li class="paginate_button page-item active">
			                            						<a href="centerMyTrainer${i}" aria-controls="dataTable" class="page-link">
			                            							${i}
			                            						</a>
			                            					</li>
                            							</c:when>
                            							<c:otherwise>
                            								<li class="paginate_button page-item">
			                            						<a href="centerMyTrainer${i}" aria-controls="dataTable" class="page-link">
			                            							${i}
			                            						</a>
			                            					</li>
                            							</c:otherwise>
                            						</c:choose>
		                            						
                            					</c:forEach>
	                            					
                            					<li class="paginate_button page-item next">
												<c:if test="${pm.next eq true && pm.endPage > 0}">
                            						<a href="centerMyTrainer${pm.endPage + 1}" aria-controls="dataTable" class="page-link">
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