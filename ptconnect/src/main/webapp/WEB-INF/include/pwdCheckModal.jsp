<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

	<div>
		<div id="pwd_check_modal" class="modal pwd_check_modal">
			<button class="modal_close">
				<span>&times;</span>
			</button>
			<div class="modal_dialog">
				<div class="modal_content">
					<div class="modal_body">
						<div>
							<h5 class="header_title">
								현재 비밀번호를 입력해주세요!
								<span class="exit_button">&times;</span>
							</h5>
							<div style="margin: 24px 0;">
								<div class="err_msg" style="display:none"></div>
								<input type="password" placeholder="현재 비밀번호를 입력해주세요" id="pwd" maxlength="15"></input>
							</div>
							<div>
								<button class="review_write_action_button checked">
									<span>비밀번호 확인</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
	const pwdSubmit = document.querySelector('.review_write_action_button');
	const errMsg = document.querySelector('.err_msg');
	const currentPath = window.location.pathname;
	let postPath = "";
	if(currentPath=="/ptconnect/userInfo"){
		postPath='${pageContext.request.contextPath}/userPwdModify';
	}else if(currentPath=="/ptconnect/trainerInfo"){
		postPath='${pageContext.request.contextPath}/trainerPwdModify';
	}else if(currentPath=="/ptconnect/centerInfo"){
		postPath='${pageContext.request.contextPath}/centerPwdModify';
	}
	pwdSubmit.onclick = function(){
		let pwd = document.querySelector('#pwd').value
// 		errMsg.style.color='red';
// 		errMsg.style.display='block';
// 		errMsg.textContent=pwd.value;
		errMsg.style.display='none';
		$.ajax({
			url: 'memberPwdCheck.ajax',
			type: 'POST',
			dataType: "json",
			data : {'mbPwd':pwd},
			success : function (data){
				if(data.value==1){
					alert(data.msg);
					location.href=postPath;
				}else if(data.value==2){
					alert(data.msg);
					location.href="login";
				}else{
			 		errMsg.style.color='red';
			 		errMsg.style.display='block';
			 		errMsg.textContent=data.msg;
				}
			},
			error: function (err){
		 		errMsg.style.color='red';
		 		errMsg.style.display='block';
		 		errMsg.textContent='통신연결 실패';
			}
		});
	}
</script>