<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="inner_header">
	<div class="tab_wrap my_container">
		<div class="my_container tab_flex">
			<div id="trainer_tab1" class="tab"><a href='trainerInfo'>회원 정보</a></div>
			<c:choose>
				<c:when test="${not empty tnNo}">
					<div id="trainer_tab6" class="tab"><a href='trainerInfoModify'>트레이너정보관리</a></div>
				</c:when>
				<c:otherwise>
					<div id="trainer_tab2" class="tab"><a href='trainerInfoWrite'>트레이너등록</a></div>
				</c:otherwise>
			</c:choose>
<!-- 			<div id="trainer_tab3" class="tab"><a href='trainerSchedule'>스케쥴 관리</a></div> -->
<!-- 			<div id="trainer_tab4" class="tab"><a href='trainerChat'>채팅</a></div> -->
			<c:if test="${not empty tnNo}">
			<div id="trainer_tab5" class="tab"><a href='trainerSales1'>판매내역</a></div>
			</c:if>		
		</div>
	</div>
</div>