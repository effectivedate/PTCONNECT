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

		<div class="noticedetail__Notice-sc-m3fjpg-0 lmUoAA">
			<div class="myContainer">
				<div class="page-header">
					<h2>공지사항</h2>
				</div>
				<div class="content-header">
					<h2>${bdo.ntTitle}</h2>
					<span>${bdo.bdDate}</span>
					<div class="date adname" style="font-size: 14px; color: rgb(108, 118, 128);">${bdo.mbName}</div>
				</div>
				<div class="content">
					<pre>${bdo.ntContent}</pre>
				</div>
				<a href="notice1"><div class="goBack">
						< 목록으로
						돌아가기
					</div></a>
			</div>
		</div>

	</section>
	<jsp:include page="../include/footer.jsp" />

</body>
</html>