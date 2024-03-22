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
<link
	href="${pageContext.request.contextPath}/resources/css/admin/normal_css/review-admin.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/orderList.css"
	type="text/css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/FAQ.css"
	type="text/css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<section>

		<div class="servicecenter__Faq-sc-43pqvj-0 NLYQY">
			<div class="myContainer">
				<div class="page-header">
					<h2>자주 묻는 질문</h2>
				</div>
				<div class="faqComp">
					<c:forEach var="FAQ" items="${fList}">
						<div class="QnA-item" style="margin: 30px 0;">
							<h3 class="QnA-title">Q. ${FAQ.FAQTitle}</h3>
							<div class="QnA-Answer">
								<pre><p>${FAQ.FAQContent}</p></pre>
							</div>
							<!-- <i class="fa-solid fa-chevron-down"></i> -->
							<button type="button" class="QnA-toggle">
								<i class="fas fa-chevron-down"></i> <i class="fas fa-chevron-up"></i>
							</button>
						</div>
					</c:forEach>	
				</div>
			</div>
		</div>

		<!-- 페이징 영역 시작 -->
		<div class="row my-4" style="margin-bottom: 0 !important;">
			<div class="col-lg-12">
				<div class="pagination-area">
					<ul class="pagination">
						<li class="paginate_button page-item previous"><c:if
								test="${pm.prev eq true}">
								<a href="FAQ${pm.startPage-1}" aria-controls="dataTable"
									class="page-link"> ◀ </a>
							</c:if></li>
						<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}"
							step="1">
							<c:choose>
								<c:when test="${i eq pm.currentPage}">
									<li class="paginate_button page-item active"><a
										href="FAQ${i}" aria-controls="dataTable"
										class="page-link"> ${i} </a></li>
								</c:when>
								<c:otherwise>
									<li class="paginate_button page-item"><a
										href="FAQ${i}" aria-controls="dataTable"
										class="page-link"> ${i} </a></li>
								</c:otherwise>
							</c:choose>

						</c:forEach>
						<li class="paginate_button page-item next"><c:if
								test="${pm.next eq true && pm.endPage > 0}">
								<a href="FAQ${pm.endPage+1}" aria-controls="dataTable"
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

	<script>
	
	//각 QnA 박스마다 클릭 감지 이벤트 리스너 달아줌
	//누르면 열리고 다시 누르면 닫히게 하는 코드
	const toggles = document.querySelectorAll(".QnA-item"); /* .QnA-toggle */
	
	toggles.forEach((toggle) => {
		toggle.addEventListener("click", () => {
			toggle.classList.toggle("active");
		})
	});
	
	</script>

</body>
</html>