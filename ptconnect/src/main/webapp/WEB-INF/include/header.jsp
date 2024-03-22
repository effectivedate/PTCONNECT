<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<header class="main_header">
	<nav>
		<div class="contents">
			<a href="${pageContext.request.contextPath}/"><img class="navi_logo" src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
			<a class="navi_name" href="findTrainer">트레이너찾기</a>
			<a class="navi_name" href="notice1">공지사항</a>
			<a class="navi_name" href="FAQ1">자주묻는질문</a>
			<div class="nav_bar_menu">
				<c:choose>
					<c:when test="${mbAuth eq 'U'}">
					<div style="position:relative; display:inline-flex; vertical-align:middle;">
						<div>
							<span class="name_button">
								<span class="name">${mbName}</span>님! 반갑습니다.
							</span>
						</div>
						<div class="drop_down_menu">
							<a href="userInfo">
								<button class="drop_down_item">마이페이지</button>
							</a>
							<div class="drop_down_divider"></div>
							<a href="userOrderList1">
								<button class="drop_down_item">주문목록</button>
							</a>
							<div class="drop_down_divider"></div>
							<a href="logout">
								<button class="drop_down_item">로그아웃</button>
							</a>
						</div>
					</div>	
					</c:when>
					<c:when test="${mbAuth eq 'T'}">
					<div style="position:relative; display:inline-flex; vertical-align:middle;">
						<div>
							<span class="name_button">
								<span class="name">${mbName}</span>선생님! 반갑습니다.
							</span>
						</div>
						<div class="drop_down_menu">
							<a href="trainerInfo">
								<button class="drop_down_item">마이페이지</button>
							</a>
							<div class="drop_down_divider"></div>
							
							<c:choose>
								<c:when test="${not empty tnNo}">
									<a href="trainerInfoModify">
										<button class="drop_down_item">트레이너정보관리</button>
									</a>
								</c:when>
								<c:otherwise>
									<a href="trainerInfoWrite">
										<button class="drop_down_item">트레이너등록</button>
									</a>
								</c:otherwise>
							</c:choose>
							<div class="drop_down_divider"></div>
							<c:if test="${not empty tnNo}">
								<a href="trainerSales1">
									<button class="drop_down_item">판매내역</button>
								</a>
							</c:if>
							<div class="drop_down_divider"></div>
							<a href="logout">
								<button class="drop_down_item">로그아웃</button>
							</a>
						</div>
					</div>	
					</c:when>
					<c:when test="${mbAuth eq 'C'}">
					<div style="position:relative; display:inline-flex; vertical-align:middle;">
						<div>
							<span class="name_button">
								<span class="name">${mbName}</span>센터님! 반갑습니다.
							</span>
						</div>
						<div class="drop_down_menu">
							<a href="centerInfo">
								<button class="drop_down_item">마이페이지</button>
							</a>
							<div class="drop_down_divider"></div>
							<a href="centerInfoWrite">
								<button class="drop_down_item">센터정보관리</button>
							</a>
							<div class="drop_down_divider"></div>
							<a href="${pageContext.request.contextPath}/centerTrainer1">
								<button class="drop_down_item">트레이너승인</button>
							</a>
							<div class="drop_down_divider"></div>
							<a href="${pageContext.request.contextPath}/centerMyTrainer1">
								<button class="drop_down_item">소속트레이너</button>
							</a>
							<div class="drop_down_divider"></div>
							<a href="${pageContext.request.contextPath}/centerSales1">
								<button class="drop_down_item">트레이너매출</button>
							</a>
							<div class="drop_down_divider"></div>
							<a href="logout">
								<button class="drop_down_item">로그아웃</button>
							</a>
						</div>
					</div>	
					</c:when>
					<c:when test="${not empty nmNo}">
					<div style="position:relative; display:inline-flex; vertical-align:middle;">
						<div>
							<span class="name_button">
								<span class="name">${nmName}</span>님! 반갑습니다.
							</span>
						</div>
						<div class="drop_down_menu">
							<a href="nonMemberMypage">
								<button class="drop_down_item">주문목록</button>
							</a>
							<div class="drop_down_divider"></div>
							<a href="logout">
								<button class="drop_down_item">로그아웃</button>
							</a>
						</div>
					</div>	
					</c:when>
					<c:when test="${empty mbNo && empty nmNo}">
						<a href="joinUser">회원가입 </a> / <a href="login"> 로그인</a>
					</c:when>
					<c:otherwise>
					<div style="position:relative; display:inline-flex; vertical-align:middle;">
						<div>
							<span class="name_button">
								<span class="name">${mbName}</span>관리자님! 반갑습니다.
							</span>
						</div>
						<div class="drop_down_menu">
							<a href="logout">
								<button class="drop_down_item">로그아웃</button>
							</a>
						</div>
					</div>	
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
</header>
<script>
	$('.name_button').click(function(){
		$('.drop_down_menu').css('display','block');
	});
	$(document).mouseup(function(e){
		if($('.drop_down_menu').has(e.target).length===0){
			$('.drop_down_menu').css('display','none');
		}
	});
</script>