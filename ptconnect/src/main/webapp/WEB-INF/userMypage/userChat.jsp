<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/chat.css" type="text/css" rel="stylesheet">
<script src="https://kit.fontawesome.com/1f85e66bca.js" crossorigin="anonymous"></script>
</head>
<body>
	<div>
		<div>
			<div>
				<div> <!--헤더+맵-->
					<jsp:include page="../include/header.jsp"/>
					<section><!-- 섹션 -->
						<jsp:include page="../include/userHeader.jsp"/>
						<script>
							window.onload = function() {
								$('#user_tab5').addClass('active_tab');
							}
						</script>
						<div class="gray_background"><!-- 회색배경 -->
							<div class="my_container"><!-- 마진오토 -->
								<div class="inner_contents"><!-- 내부 컨텐츠(패딩탑) -->
									<div class="mypage_contents"><!-- 이곳부터 div로 화면구현하세요 -->
										<div class="wrap">
											<div class="chat_list">
												<div class="header">
													<div class="read_all">모두읽음</div>
												</div>
												<div class="chat_comp open" onclick="location.href='userChat.jsp?crno=18'">
													<div class="user_icon">
														<i class="fa-solid fa-user"></i>
													</div>
													<div class="chat_box">
														<h5 class="chat_title">감사합니다! 그럼 그날 뵐께요!</h5>
														<div class="other_user">김빡빡</div>
														<span class="chat_time">11:30</span>
													</div>
												</div>
												<div class="chat_comp" onclick="location.href='userChat.jsp?crno=15'">
													<div class="user_icon">
														<i class="fa-solid fa-user"></i>
													</div>
													<div class="chat_box">
														<h5 class="chat_title">안빡센트레이너 박빡빡입니다. 보내...</h5>
														<div class="other_user">박빡빡</div>
														<span class="chat_time">10:11</span>
													</div>
													<div class="unread">2</div>
												</div>
												<div class="chat_comp" onclick="location.href='userChat.jsp?crno=10'">
													<div class="user_icon">
														<i class="fa-solid fa-user"></i>
													</div>
													<div class="chat_box">
														<h5 class="chat_title">회원가입을 축하드립니다!</h5>
														<div class="other_user">PTConnect관리자</div>
														<span class="chat_time">2023-12-21</span>
													</div>
												</div>
											</div>
											<div class="chat_contents">
												<div class="chat_contents_title">
													<h5 class="chat_title">김빡빡</h5>
												</div>
												<div class="not_empty">
													<div class="chat_area">
														<div class="msg other_msg">
															<div class="user_icon">
																<i class="fa-solid fa-user"></i>
															</div>
															<div>
																<span class="msg_txt">안녕하세요 개빡센트레이너 김빡빡입니다.</span>
																<span class="msg_time">11:10</span>
															</div>
														</div>
														<div class="msg other_msg">
															<div class="user_icon">
																<i class="fa-solid fa-user"></i>
															</div>
															<div>
																<span class="msg_txt">PT문의를 읽었습니다. 희망은 12월 30일, 시간은 상관 없으신것 맞으신가요.</span>
																<span class="msg_time">11:10</span>
															</div>
														</div>
														<div class="msg my_msg">
															<div>
																<span class="msg_time">11:25</span>
																<span class="msg_txt">네! 맞아요. 혹시 그날 안될까요..?</span>
															</div>
														</div>
														<div class="msg other_msg">
															<div class="user_icon">
																<i class="fa-solid fa-user"></i>
															</div>
															<div>
																<span class="msg_txt">그날이면 2~3시에 시간이 납니다.</span>
																<span class="msg_time">11:25</span>
															</div>
														</div>
														<div class="msg other_msg">
															<div class="user_icon">
																<i class="fa-solid fa-user"></i>
															</div>
															<div>
																<span class="msg_txt">혹시 이 때 가능하실까요?</span>
																<span class="msg_time">11:25</span>
															</div>
														</div>
														<div class="msg my_msg">
															<div>
																<span class="msg_time">11:27</span>
																<span class="msg_txt">오 좋아요.</span>
															</div>
														</div>
														<div class="msg my_msg">
															<div>
																<span class="msg_time">11:28</span>
																<span class="msg_txt">12월 30일 2시에 가면 되는거죠?</span>
															</div>
														</div>
														<div class="msg other_msg">
															<div class="user_icon">
																<i class="fa-solid fa-user"></i>
															</div>
															<div>
																<span class="msg_txt">네 회원님 12월 30일 2시에 오시면 됩니다.</span>
																<span class="msg_time">11:28</span>
															</div>
														</div>
														<div class="msg my_msg">
															<div>
																<span class="msg_read">1</span>
																<span class="msg_time">11:30</span>
																<span class="msg_txt">감사합니다! 그럼 그날 뵐께요!</span>
															</div>
														</div>
													</div>
													<div class="send_area">
														<textarea name="send_msg" id="send_msg" class="send_msg" placeholder="바르고 고운말을 사용해주세요."></textarea>
													</div>
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
</body>
</html>