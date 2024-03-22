<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/login.css" type="text/css" rel="stylesheet">
<script src="/webjars/jquery/dist/jquery.min.js"></script>
</head>
<body>
	<div>
		<div>
			<div>
				<div> <!--헤더+맵-->
					<jsp:include page="../include/header.jsp"/>
					<section style="background-color: #f7f9fa;"><!-- 섹션 -->
						<div class="loginWrap">
							<div class="loginBox">
								<div class="tabWrap">
									<div class="tab selectedTab" id="normalTab">일반회원</div>
									|
									<div class="tab" id="trainerTab">트레이너</div>
									|
									<div class="tab" id="centerTab">센터</div>
									|
									<div class="tab" id="nonTab">비회원</div>
								</div>
								<div style="display:contents;">
									<span class="errMsg" style="display:none; text-align:center; color:red;"></span>
								</div>
								
								 <div id="normalLogin" class="loginSection">
								 	<form name="userForm" id="userForm">
								 		<input type="hidden" name="cate"  value="user">
										<div class="emailBox">
											<h3>이메일</h3>
											<input type="text" id="userLoginEmail" name="mbEmail" placeholder="example@gmail.com" >
										</div>
										
										<div class="pwdBox">
											<h3>비밀번호</h3>
											<input type="password" name="mbPwd" id="userLoginPwd">
										</div>
										<div class="loginBtn">
										<button type="button" id="userLoginBtn">로그인</button>
										</div>
											
										<div class="menuBox">
											<div class="menuJoin"><a href="${pageContext.request.contextPath}/joinUser">회원가입</a></div>|
											<div class="menuFindId"><a href="${pageContext.request.contextPath}/idFind">아이디찾기</a></div>|
											<div class="menuFindPwd"><a href="${pageContext.request.contextPath}/pwdFind">비밀번호찾기</a></div>
										</div>
								 	</form>
								</div>
								
								<div id="trainerLogin" class="loginSection" style="display: none;">
								 	<form name="trainerForm" id="trainerForm">
								 		<input type="hidden" name="cate" value="trainer">
										<div class="emailBox">
											<h3>이메일</h3>
											<input type="text" id="trainerLoginEmail" name="mbEmail" placeholder="example@gmail.com" >
										</div>
										
										<div class="pwdBox">
											<h3>비밀번호</h3>
											<input type="password" name="mbPwd" id="trainerLoginPwd">
										</div>
										
										<div class="loginBtn">
											<button type="button" id="trainerLoginBtn">로그인</button>
										</div>
											
										<div class="menuBox">
											<div class="menuJoin"><a href="${pageContext.request.contextPath}/joinTrainer">트레이너가입</a></div>|
											<div class="menuFindId"><a href="${pageContext.request.contextPath}/idFind">아이디찾기</a></div>|
											<div class="menuFindPwd"><a href="${pageContext.request.contextPath}/pwdFind">비밀번호찾기</a></div>
										</div>
									</form>
								</div>
								
								<div id="centerLogin" class="loginSection" style="display: none;">
								 	<form name="centerForm" id="centerForm">
								 		<input type="hidden" name="cate" value="center">
										<div class="emailBox">
											<h3>이메일</h3>
											<input type="text" id="centerLoginEmail" name="mbEmail" placeholder="example@gmail.com" >
										</div>
										
										<div class="pwdBox">
											<h3>비밀번호</h3>
											<input type="password" name="mbPwd" id="centerLoginPwd">
										</div>
										<div class="loginBtn">
											<button type="button" id="centerLoginBtn">로그인</button>
										</div>
											
										<div class="menuBox">
											<div class="menuJoin"><a href="${pageContext.request.contextPath}/joinCenter">센터가입</a></div>|
											<div class="menuFindId"><a href="${pageContext.request.contextPath}/idFind">아이디찾기</a></div>|
											<div class="menuFindPwd"><a href="${pageContext.request.contextPath}/pwdFind">비밀번호찾기</a></div>
										</div>
									</form>
								</div>
								
								<div id="nonLogin" class="loginSection" style="display: none;">
								 	<form name="nonForm" id="nonForm">
								 		<input type="hidden" name="cate" value="center">
										<div class="emailBox">
											<h3>전화번호</h3>
											<input type="text" id="nonLoginPhone" name="nmPhone" placeholder="'-'없이 작성해주세요." >
										</div>
										
										<div class="pwdBox">
											<h3>비밀번호</h3>
											<input type="password" name="nmPwd" id="nonLoginPwd">
										</div>
										<div class="loginBtn" onclick="nonMemberLogin()">
											<button type="button" id="nonLoginBtn">로그인</button>
										</div>
										
									</form>
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
// 		$(document).ready(function(){
// 			if(${not empty errMsg}){
// 				$('.errMsg').html('${errMsg}');
// 				$('.errMsg').css('display','');
//                 // 모든 로그인 섹션 숨기기
//                 $('#normalLogin').css('display','none');
//                 $('#trainerLogin').css('display','none');
//                 $('#centerLogin').css('display','none');

//                 // 선택된 탭에 대한 배경 색상 설정
//                 $('#normalTab').removeClass('selectedTab');
//                 $('#trainerTab').removeClass('selectedTab');
//                 $('#centerTab').removeClass('selectedTab');
                
//                 if(${cate eq 'user'}){
//                     $('#nomalTab').addClass('selectedTab');
//                     $('#nomalTab').css('display','block');
//                     $('#userLoginEmail').val('${mbEmail}');
//                 }else if(${cate eq 'trainer'}){
//                     $('#trainerTab').addClass('selectedTab');
//                     $('#trainerTab').css('display','block');
//                     $('#trainerLoginEmail').val('${mbEmail}');
//                 }else if(${cate eq 'center'}){
//                     $('#centerTab').addClass('selectedTab');
//                     $('#centerTab').css('display','block');
//                     $('#centerLoginEmail').val('${mbEmail}');
//                 }
// 			}
// 		});
	</script>
	
  <script>
        document.addEventListener('DOMContentLoaded', function () {
            // 초기에 첫 번째 탭이 선택된 상태로 설정
            showLogin('normalTab');
            
            // 각 탭을 클릭할 때 해당 로그인 섹션을 표시
            document.getElementById('normalTab').addEventListener('click', function () {
                showLogin('normalTab');
            });

            document.getElementById('trainerTab').addEventListener('click', function () {
                showLogin('trainerTab');
            });

            document.getElementById('centerTab').addEventListener('click', function () {
                showLogin('centerTab');
            });
            document.getElementById('nonTab').addEventListener('click', function () {
                showLogin('nonTab');
            });

            function showLogin(tabId) {
                // 모든 로그인 섹션 숨기기
                document.getElementById('normalLogin').style.display = 'none';
                document.getElementById('trainerLogin').style.display = 'none';
                document.getElementById('centerLogin').style.display = 'none';
                document.getElementById('nonLogin').style.display = 'none';

                // 선택된 탭에 대한 배경 색상 설정
                document.getElementById('normalTab').classList.remove('selectedTab');
                document.getElementById('trainerTab').classList.remove('selectedTab');
                document.getElementById('centerTab').classList.remove('selectedTab');
                document.getElementById('nonTab').classList.remove('selectedTab');
                
                document.getElementById(tabId).classList.add('selectedTab');

                // 선택된 탭에 대한 로그인 섹션 표시
                document.getElementById(tabId.replace('Tab', 'Login')).style.display = 'block';
            }
        });
    </script>	
	<script>
		$('.loginBtn button').click(function(){
// 			console.log($(this).attr("id"));
			$('.errMsg').css('display','none');
			var email = "";
			var pwd = ""; 
			var cate = "";
			if($(this).attr("id")=="userLoginBtn"){
				email = $('#userLoginEmail').val();
				pwd = $('#userLoginPwd').val();
				cate = "user";
			}else if($(this).attr("id")=="trainerLoginBtn"){
				email = $('#trainerLoginEmail').val();
				pwd = $('#trainerLoginPwd').val();
				cate = "trainer";
			}else if($(this).attr("id")=="centerLoginBtn"){
				email = $('#centerLoginEmail').val();
				pwd = $('#centerLoginPwd').val();
				cate = "center";
			}
			
			if(email==""){
				$('.errMsg').html('이메일을 입력해주세요.');
				$('.errMsg').css('display','');
			}else if (pwd==""){
				$('.errMsg').html('비밀번호를 입력해주세요.');
				$('.errMsg').css('display','');
			}else{
				console.log($('#'+cate+'LoginEmail').val());
				$('#'+cate+'Form').attr('action','${pageContext.request.contextPath}/loginAction');
				$('#'+cate+'Form').attr('method','POST');
				$('#'+cate+'Form').submit();
			}
			
		});
	</script>
	<script>
		function nonMemberLogin(){
			$('.errMsg').css('display','none');
			if($('#nonLoginPhone').val()==""){
				$('.errMsg').html('전화번호를 입력해주세요.');
				$('.errMsg').css('display','');
			}else if($('#nonLoginPwd').val()==""){
				$('.errMsg').html('비밀번호를 입력해주세요.');
				$('.errMsg').css('display','');
			}else{
				$('#nonForm').attr('action','${pageContext.request.contextPath}/nonLoginAction');
				$('#nonForm').attr('method','POST');
				$('#nonForm').submit();
			}
		}
	</script>
	
	<script>
	    // Enter 키 입력을 처리하는 함수
	    function handleEnterKeyPress(event, buttonId) {
	        if (event.key === 'Enter') {
	            $('#' + buttonId).click();
	        }
	    }
	
	    $('#userLoginEmail, #userLoginPwd').keypress(function (event) {
	        handleEnterKeyPress(event, 'userLoginBtn');
	    });
	
	    $('#trainerLoginEmail, #trainerLoginPwd').keypress(function (event) {
	        handleEnterKeyPress(event, 'trainerLoginBtn');
	    });
	
	    $('#centerLoginEmail, #centerLoginPwd').keypress(function (event) {
	        handleEnterKeyPress(event, 'centerLoginBtn');
	    });
	
	    $('#nonLoginPhone, #nonLoginPwd').keypress(function (event) {
	        handleEnterKeyPress(event, 'nonLoginBtn');
	    });
	</script>

</body>
</html>