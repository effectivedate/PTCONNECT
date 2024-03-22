<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PT Connect</title>

<link
	href="${pageContext.request.contextPath}/resources/css/mainPage.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/home.css"
	type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/notice.css"
	type="text/css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/orderList.css"
	type="text/css" rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<section>

		<div class="notice__Notice-sc-11rs5rk-0 bEnCcy">
			<div class="myContainer">
				<div class="page-header">
					<h2>공지사항</h2>
<!-- 					<div class="tab"> -->
<!-- 						<div class="tabComp selected">일반회원</div> -->
<!-- 						<div class="tabComp">센터 및 트레이너</div> -->
<!-- 					</div> -->
				</div>
				<div class="noticeComp">
					<c:forEach var="notice" items="${ntList}">
						<a href="noticeDetail?bdNo=${notice.bdNo}">
							<div class="noticeList">
								<span class="date">${notice.bdDate}</span>
								<h5 class="title">${notice.ntTitle}</h5>
								<div class="date adname">${notice.mbName}</div>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>

			<!-- 페이징 영역 시작 -->
			<div class="row my-4" style="margin-bottom: 0 !important;">
				<div class="col-lg-12">
					<div class="pagination-area">
						<ul class="pagination">
							<li class="paginate_button page-item previous"><c:if
									test="${pm.prev eq true}">
									<a href="notice${pm.startPage-1}" aria-controls="dataTable"
										class="page-link"> ◀ </a>
								</c:if></li>
							<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}"
								step="1">
								<c:choose>
									<c:when test="${i eq pm.currentPage}">
										<li class="paginate_button page-item active"><a
											href="notice${i}" aria-controls="dataTable" class="page-link">
												${i} </a></li>
									</c:when>
									<c:otherwise>
										<li class="paginate_button page-item"><a
											href="notice${i}" aria-controls="dataTable" class="page-link">
												${i} </a></li>
									</c:otherwise>
								</c:choose>

							</c:forEach>
							<li class="paginate_button page-item next"><c:if
									test="${pm.next eq true && pm.endPage > 0}">
									<a href="notice${pm.endPage+1}" aria-controls="dataTable"
										class="page-link"> ▶ </a>
								</c:if></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 페이징 영역 끝-->

		</div>

	</section>
	<jsp:include page="../include/footer.jsp" />

</body>
</html>