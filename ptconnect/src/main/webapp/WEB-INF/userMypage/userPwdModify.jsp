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
											<h1>비밀번호 변경</h1>
											<hr>
											<div class="user_wrap">
												<div class="user_input">
													<label>새로운 비밀번호</label>
													<input type="password" name="pwd" id="pwd" maxlength="20" placeholder="변경할 비밀번호를 입력해주세요.">
												</div>
												<span class="err_msg" style="display:none; color:red"></span>
											</div>
											<div class="user_wrap">
												<div class="user_input">
													<label>새로운 비밀번호 확인</label>
													<input type="password" name="pwd2" id="pwd2" maxlength="20" placeholder="변경할 비밀번호를 입력해주세요.">
												</div>
												<span class="err_msg2" style="display:none; color:red"></span>
											</div>
											<hr>
											<div class="submit">
												<div class="half_button">
													<button class="submit_button checked"><span>비밀번호 변경</span></button>
												</div>
												<div class="half_button">
													<button class="submit_button unchecked"><span>취소</span></button>
												</div>
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
	<script>
	const checkbtn = document.querySelector('.checked');
	checkbtn.onclick = () => {
		  pwdModify();
		};
	
	function pwdModify(){
		const pwd = document.querySelector('#pwd');
		const pwd2 = document.querySelector('#pwd2');
		const errMsg = document.querySelector('.err_msg');
		const errMsg2 = document.querySelector('.err_msg2');
		errMsg.style.display = "none";
		errMsg2.style.display = "none";
// 		errMsg.innerHTML = "";
// 		errMsg2.innerHTML = "";
		if (pwd.value == ""){
// 			alert('pwd없음');
			pwd.focus();
			errMsg.style.display = "block";
			errMsg.innerHTML = "비밀번호를 입력해주세요.";
			
		}else if(pwd2.value == ""){
// 			alert('pwd2없음');
			pwd2.focus();
			errMsg2.style.display = "block";
			errMsg2.innerHTML = "비밀번호 확인을 입력해주세요.";
			
		}else if(pwd.value != pwd2.value){
// 			alert('일치하지않음');
			pwd2.focus();
			errMsg2.style.display = "block";
			errMsg2.innerHTML = "비밀번호와 일치하지 않습니다. 확인해주세요.";
		}else{
			let jo = {'mbPwd' : pwd.value};
			$.ajax({
				contentType:'application/json;',
				type: "POST",
				url: "${pageContext.request.contextPath}/pwdModifyAction",
				data: JSON.stringify(jo),
				dataType : "json",
				success: function(data){
					if(data.value==0){
						alert("로그인필요");
					}else if(data.value==2){
						alert("validation오류");
						pwd2.value="";
						pwd.focus();
						errMsg.style.display = "block";
						errMsg.innerHTML = data.errMsg;
						console.log(data.err);
					}else if(data.value==1){
						alert("비밀번호를 변경하였습니다.");
						location.href="${pageContext.request.contextPath}/userInfo"
					}
				},
				error: function(){
					alert("접속에러");
				}
				
			});
		}
	}
	</script>
</body>
</html>