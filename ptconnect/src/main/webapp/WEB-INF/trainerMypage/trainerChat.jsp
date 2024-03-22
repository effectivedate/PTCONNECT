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
						<jsp:include page="../include/trainerHeader.jsp"/>
						<script>
							window.onload = function() {
								$('#trainer_tab4').addClass('active_tab');
							}
						</script>
						<div class="gray_background"><!-- 회색배경 -->
							<div class="my_container"><!-- 코치정보(마진오토) -->
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
														<h5 class="chat_title">안녕하세요 개빡센트레이너 김빡빡입니...</h5>
														<div class="other_user">김유저</div>
														<span class="chat_time">11:32</span>
													</div>
												</div>
												<div class="chat_comp" onclick="location.href='userChat.jsp?crno=15'">
													<div class="user_icon">
														<i class="fa-solid fa-user"></i>
													</div>
													<div class="chat_box">
														<h5 class="chat_title">감사합니다! 그럼 그날 뵐께요!</h5>
														<div class="other_user">이유저</div>
														<span class="chat_time">11:30</span>
													</div>
													<div class="unread">1</div>
												</div>
												<div class="chat_comp" onclick="location.href='userChat.jsp?crno=18'">
													<div class="user_icon">
														<i class="fa-solid fa-user"></i>
													</div>
													<div class="chat_box">
														<h5 class="chat_title">감사합니다! 좋은하루 되세요!</h5>
														<div class="other_user">강돼지</div>
														<span class="chat_time">10:01</span>
													</div>
												</div>
												<div class="chat_comp" onclick="location.href='userChat.jsp?crno=15'">
													<div class="user_icon">
														<i class="fa-solid fa-user"></i>
													</div>
													<div class="chat_box">
														<h5 class="chat_title">그러면 생각해보고 다시 연락드...</h5>
														<div class="other_user">박버거</div>
														<span class="chat_time">2023-12-26</span>
													</div>
													<div class="unread">1</div>
												</div>
												<div class="chat_comp" onclick="location.href='userChat.jsp?crno=15'">
													<div class="user_icon">
														<i class="fa-solid fa-user"></i>
													</div>
													<div class="chat_box">
														<h5 class="chat_title">그러면 생각해보고 다시 연락드...</h5>
														<div class="other_user">박버거</div>
														<span class="chat_time">2023-12-26</span>
													</div>
													<div class="unread">1</div>
												</div>
												<div class="chat_comp" onclick="location.href='userChat.jsp?crno=15'">
													<div class="user_icon">
														<i class="fa-solid fa-user"></i>
													</div>
													<div class="chat_box">
														<h5 class="chat_title">그러면 생각해보고 다시 연락드...</h5>
														<div class="other_user">박버거</div>
														<span class="chat_time">2023-12-26</span>
													</div>
													<div class="unread">1</div>
												</div>
												<div class="chat_comp" onclick="location.href='userChat.jsp?crno=15'">
													<div class="user_icon">
														<i class="fa-solid fa-user"></i>
													</div>
													<div class="chat_box">
														<h5 class="chat_title">그러면 생각해보고 다시 연락드...</h5>
														<div class="other_user">박버거</div>
														<span class="chat_time">2023-12-26</span>
													</div>
													<div class="unread">1</div>
												</div>
												<div class="chat_comp" onclick="location.href='userChat.jsp?crno=10'">
													<div class="user_icon">
														<i class="fa-solid fa-user"></i>
													</div>
													<div class="chat_box">
														<h5 class="chat_title">결제 승인 알림건입니다!</h5>
														<div class="other_user">PTConnect관리자</div>
														<span class="chat_time">2023-12-26</span>
													</div>
												</div>
											</div>
											<div class="chat_contents">
												<div class="chat_contents_title">
													<h5 class="chat_title">김빡빡</h5>
												</div>
												<div class="not_empty">
													<div class="chat_area">
														<div class="msg my_msg">
															<div>
																<span class="msg_read">1</span>
																<span class="msg_time">11:32</span>
																<span class="msg_txt">안녕하세요 개빡센트레이너 김빡빡입니다.</span>
															</div>
														</div>
														<div class="msg my_msg">
															<div>
																<span class="msg_read">1</span>
																<span class="msg_time">11:32</span>
																<span class="msg_txt">PT문의를 읽었습니다. 희망하시는 날짜가 내년 1월 10일, 시간은 저녁 6시부터 10시 사이 맞으신가요.</span>
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