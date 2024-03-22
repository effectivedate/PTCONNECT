<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/login.css" type="text/css" rel="stylesheet">
<script src="/webjars/jquery/dist/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<div>
		<div>
			<div>
				<div>
					<section><!-- 섹션 -->
						<div class="loginWrap">
							<div style="text-align:center; margin-bottom: 20px;">
								<img src="${pageContext.request.contextPath}/resources/img/logo.png" style="height: 30vh;">
								<h1>관리자 로그인</h1>
							</div>
							<div class="loginBox">
								<div style="display:contents;">
									<span class="errMsg" style="display:none; text-align:center; color:red;"></span>
								</div>
								
								 <div class="loginSection">
								 	<form name="adminForm" id="adminForm">
										<div class="emailBox">
											<h3>아이디</h3>
											<input type="text" id="loginEmail" name="mbEmail" placeholder="아이디를 입력하세요." >
										</div>
										
										<div class="pwdBox">
											<h3>비밀번호</h3>
											<input type="password" id="loginPwd" name="mbPwd" >
										</div>
										<div class="loginBtn">
										<button type="button" id="userLoginBtn">로그인</button>
										</div>
										<div class="menuBox">
											<div class="menuJoin"><a href="${pageContext.request.contextPath}/findTrainer">홈페이지로 나가기</a></div>
										</div>
								 	</form>
								</div>								
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			if(${not empty errMsg}){
				$('.errMsg').html('${errMsg}');
				$('.errMsg').css('display','');
			}
		});
	</script>
	
	<script>
		$('.loginBtn button').click(function(){
// 			console.log($(this).attr("id"));
			$('.errMsg').css('display','none');
			
			if($('#loginEmail').val()==""){
				$('.errMsg').html('이메일을 입력해주세요.');
				$('.errMsg').css('display','');
			}else if ($('#loginPwd').val()==""){
				$('.errMsg').html('비밀번호를 입력해주세요.');
				$('.errMsg').css('display','');
			}else{
				$('#adminForm').attr('action','${pageContext.request.contextPath}/adminLoginAction');
				$('#adminForm').attr('method','POST');
				$('#adminForm').submit();
			}
			
		});
	</script>
	
</body>
</html>