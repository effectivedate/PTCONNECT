<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="inner_header">
	<div class="tab_wrap my_container">
		<div class="my_container tab_flex">
			<div id="trainer_tab1" class="tab"><a href='centerInfo'>회원 정보</a></div>
			<div id="trainer_tab2" class="tab"><a href='centerInfoWrite'>센터등록</a></div>
			<div id="trainer_tab3" class="tab"><a href='${pageContext.request.contextPath}/centerTrainer1'>트레이너 승인</a></div>
			<div id="trainer_tab4" class="tab"><a href='${pageContext.request.contextPath}/centerMyTrainer1'>소속 트레이너</a></div>
<!-- 			<div id="trainer_tab4" class="tab"><a href='trainerChat'>채팅</a></div> -->
			<div id="trainer_tab5" class="tab"><a href='${pageContext.request.contextPath}/centerSales1'>트레이너 매출</a></div>
		</div>
	</div>
</div>