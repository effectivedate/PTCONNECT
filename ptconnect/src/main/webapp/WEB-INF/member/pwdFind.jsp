<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/find.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div>
		<div>
			<div>
				<div> <!--헤더+맵-->
					<jsp:include page="../include/header.jsp"/>
					<section><!-- 섹션 -->
						<div class="findWrap">
							<div class="findTitle">
								<h1>비밀번호 찾기</h1>
							</div>
						
							<div class="idfindBox">
								<div class="emailBox">
									<h3>이메일</h3>
									<input type="text" id="mbEmail" name="mbEmail" placeholder="example@gmail.com" >
								</div>
								
								<div class="pwdBox" id="pwdBox">
									<h3>전화번호</h3>
									<input type="text" id="mbPhone" name="mbPhone">
								</div>
								<div class="pwdBox" id="pwdBox2" style="display:none">
									<h3>비밀번호</h3>
									<input type="text" id="mbPwd" name="mbPwd">
								</div>
								<div>
									<span id="errorMsg" style="color:red;"></span>
								</div>
								<div>
									<span id="msg" style="color:blue;"></span>
								</div>
								<div class="idFindBtn" id="idFindBtn">
									<button type="button">조회하기</button>
								</div>
								<div class="idFindBtn" id="idFindBtn2" style="display:none">
									<button type="button">입력하기</button>
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
	$('#idFindBtn').click(function(){
		var memberInfo = {
				'mbEmail' : $('#mbEmail').val(),
				'mbPhone' : $('#mbPhone').val(), 
		};
		$.ajax({
			contentType:'application/json;',
			type: "POST",
			url: '${pageContext.request.contextPath}/pwdFindCheck.ajax',
			dataType: "json",
			data: JSON.stringify(memberInfo),
			success: function(data){
				if(data.value==1){
					$('#msg').html('해당 이메일로 임시 비밀번호가 발송되었습니다.<br>페이지를 이동하시지 마시고 임시 비밀번호를 입력해주세요.');
					$('#errorMsg').css('display','');
					$('#mbEmail').prop('readonly', true);
					$('#mbPhone').prop('readonly', true);
					$('#pwdBox').css('display','none');
					$('#pwdBox2').css('display','');
					$('#idFindBtn').css('display','none');
					$('#idFindBtn2').css('display','');
					$('#errorMsg').css('display','none');
					
				}else{
					$('#errorMsg').html(data.msg);
					$('#errorMsg').css('display','');
				}
			},
			error: function(){
				console.log("idFindError");
				return;
			}
			
		});
	});
	
	$('#idFindBtn2').click(function(){
		$.ajax({
			type: "POST",
			url: '${pageContext.request.contextPath}/tempPwdCheck.ajax',
			dataType: "json",
			data: {'mbPwd':$('#mbPwd').val()},
			success: function(data){
				if(data.value==0){
					$("#errorMsg").html("비밀번호를 입력해주세요.");
					$('#errorMsg').css('display','');
				}else if(data.value==1){
					location.href='${pageContext.request.contextPath}/pwdFound?mbPwd='+$('#mbPwd').val();
				}else{
					$("#errorMsg").html("비밀번호가 일치 하지 않습니다.");
					$('#errorMsg').css('display','');
				}
			},
			error: function(){
				console.log("idFindError");
				return;
			}
			
		});
	});
	
</script>	
	
	
</body>
</html>