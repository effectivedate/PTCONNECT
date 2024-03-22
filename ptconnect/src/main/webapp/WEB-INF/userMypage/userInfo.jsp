<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/info.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/modal.css" type="text/css" rel="stylesheet">

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
								$('#user_tab1').addClass('active_tab');
							}
						</script>
						<div class="gray_background"><!-- 회색배경 -->
							<div class="my_container"><!-- 코치정보(마진오토) -->
								<div class="inner_contents"><!-- 코치정보(패딩탑) -->
									<div class="row"><!-- 코치정보 -->
										<div class="user_info">
											<div class="user_wrap">
												<div class="user_input">
													<label>이름</label>
													<input type="text" value="${mo.mbName}" disabled>
												</div>
											</div>
											<div class="user_wrap">
												<div class="user_input">
													<label>이메일</label>
													<input type="text" value="${mo.mbEmail}" disabled>
												</div>
											</div>
											<div class="user_wrap">
												<div class="user_input">
													<label>핸드폰 번호<span>*</span></label>
<!-- 													<div class="input_wrap"> -->
														<div class="input_width">
															<input type="tel" name="tel" placeholder="'-' 없이 입력" maxlength="20" autocomplete="off" value="${mo.mbPhone}" disabled>														
														</div>
<!-- 														<div class="send_submit"> -->
<!-- 															<div class="send_auth_button">인증번호 발송</div> -->
<!-- 														</div> -->
<!-- 													</div> -->
												</div>
											</div>
											<div class="user_wrap">
												<div class="user_input">
													<label>포인트</label>
													<input type="text" value="${sumPoint}p" disabled>
												</div>
											</div>
											<hr>
											<div class="submit" style="justify-content: center;">
												<div class="half_button">
													<button class="submit_button checked pwd_check_button" onclick="pwdCheck()"><span>비밀번호 변경</span></button>
												</div>
<!-- 												<div class="half_button"> -->
<!-- 													<button class="submit_button checked"><span>정보 업데이트</span></button> -->
<!-- 												</div> -->
											</div>
<!-- 											<div class="resign"> -->
<!-- 												회원탈퇴 -->
<!-- 											</div> -->
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
	
	<!-- 비밀번호 변경으로 이동하기 전에 사용자를 확인하는 모달 결제창 -->
	<jsp:include page="../include/pwdCheckModal.jsp"/>
<script>
const pwdCheckModal = $('.pwd_check_modal');
const exitButton = $('.exit_button');
const modalColse = $('.modal_close');
// 리뷰 작성하기 버튼
function pwdCheck(){
//		if($('.review_button_expand_wrap').css('opacity')==1){
//			$('.review_button_expand_wrap').css('opacity',0);
//		}else{
//			$('.review_button_expand_wrap').css('opacity',1);
//		}
		pwdCheckModal.css('display','flex');
		
//		console.log('review_write_button');
	}

window.onclick = function(e){
	console.log('pwd_check_modal : ' + e.target.classList.contains('pwd_check_modal'));
	
	if(e.target.classList.contains('pwd_check_modal')){
		pwdCheckModal.css('display','none');
	}
}

exitButton.click(function() {
	pwdCheckModal.css('display','none');
});

modalColse.click(function() {
	pwdCheckModal.css('display','none');
});
</script>	
</body>
</html>