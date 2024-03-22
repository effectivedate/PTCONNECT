<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
								<h1>아이디 찾기</h1>
							</div>
						
							<div class="idfindBox">
									<div class="emailBox">
										<h3>이름</h3>
										<input type="text" id="mbName" name="mbName" placeholder="example@gmail.com" >
									</div>
									
									<div class="pwdBox">
										<h3>전화번호</h3>
										<input type="text" id="mbPhone" name="mbPhone">
									</div>
									<div>
										<span id="errorMsg" style="color:red;"></span>
									</div>
									<div>
										<span id="mbEmail" style="color:blue;"></span>
									</div>
									<div class="idFindBtn">
										<button id="idFindBtn" type="button">조회하기</button>
									</div>
									<div class="menuBox">
											<div class="menuFindPwd">
											<a href="${pageContext.request.contextPath}/pwdFind">비밀번호 찾기</a>
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
	$('#idFindBtn').click(function(){
		var memberInfo = {
				'mbName' : $('#mbName').val(),
				'mbPhone' : $('#mbPhone').val(), 
		};
		$.ajax({
			contentType:'application/json;',
			type: "POST",
			url: '${pageContext.request.contextPath}/emailFindCheck.ajax',
			dataType: "json",
			data: JSON.stringify(memberInfo),
			success: function(data){
				if(data.mbEmail === undefined){
					$('#errorMsg').html(data.msg);
					$('#errorMsg').css('display','');
					$('#mbEmail').css('display','none');
				}else{
					$('#mbEmail').html('가입된 이메일은 ' + data.mbEmail + ' 입니다!');
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