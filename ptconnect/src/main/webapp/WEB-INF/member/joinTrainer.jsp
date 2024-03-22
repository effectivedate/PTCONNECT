<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 회원가입</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/join.css" type="text/css" rel="stylesheet">
<script src="/webjars/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6eaf7ed9af48a5319b75a0937ac3096&libraries=services"></script>

</head>
<body>
	<div>
		<div>
			<div>
				<div>
					<jsp:include page="../include/header.jsp"/>
					<section><!-- 섹션 -->
						<div class="joinWrap">

							<div class="joinTitle">
								<h4>트레이너 회원가입</h4>
							</div>
							<div class="joinSelect">
								<span>
									<a href="${pageContext.request.contextPath}/joinUser">일반 회원가입</a> /
									<a href="${pageContext.request.contextPath}/joinCenter">센터 회원가입</a>
								</span>
							</div>

							<div class="joinBox">
								
								<div class="emailBox">
									<h3>이메일</h3>
									<div class="flexBox">
										<input type="text" id="joinEmail" placeholder="example@gmail.com" >
										<button type="button" onclick="EmailCheck()">인증번호 발송</button>
									</div>
									
								</div>
								<div class="userEmailCheck">
									<h3>인증번호</h3><span id="timer" style="color:red;"></span><span id="checkemail"></span>
									<div class="flexBox">
										<input type="text" id="userCheck" placeholder="인증 번호 입력 후 인증 버튼을 눌러주세요">
										<button type="button" onclick="emailConfirm()">인증</button>
									</div>
								</div>
									
								<div class="pwdBox">
									<h3>비밀번호</h3>
									<input type="text" id="joinPwd" placeholder="8~15자 까지 입력 가능합니다">
								</div>
								
								<div class="pwdCheckBox">
									<h3>비밀번호 확인</h3>
									<input type="text" id="joinPwd2"  placeholder="비밀번호를 다시 입력해주세요">
								</div>
								
								<div class="userName">
									<h3>이름</h3>
									<input type="text" id="userName" placeholder="이름을 입력해주세요">
								</div>
								
								<div class="userPhoneNum">
									<h3>전화번호</h3>
									<input type="text" id="userPhone" placeholder="'-'를 제외하고 입력하세요.">
								</div>
								
								<div class="kakao-address userAddr">
									<h3>주소</h3>
									<div id="address-btn-area" class="flexBox">
										<input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly>
										<button id="address-btn" onclick="DaumPostcode()">우편번호 찾기</button>
									</div>
									<input type="text" name="addr" id="addr" placeholder="주소" readonly>
									<div class="flexBox">
										<input type="text" name="detail_addr" id="detail_addr" placeholder="상세주소">
										<input type="text" name="extra_addr" id="extra_addr" placeholder="추가정보">
									</div>
									<input type="hidden" id="mapY">
									<input type="hidden" id="mapX">
								</div>
								
								<div class="labelBox">
									<label for="agreementAll">
										<input type="checkbox" id="agreementAll" name="agreementAll" onclick="checkAll()">전체동의
									</label>
								<!-- 약관 동의 링크 -->
									<a href="#" id="showTermsModal">약관 보기</a>
									<hr>
									
									<div class="flexBox">
										<label for="privacyPolicy">
											<input type="checkbox" id="privacyPolicy" name="privacyPolicy">(필수)이용약관 동의
										</label>
									</div>
									
									
									
									<div class="flexBox">
										<label for="privacyPolicy">
											<input type="checkbox" id="infomationPolicy" name="infomationPolicy">(필수)개인정보 수집 및 이용동의
										</label>
									</div>
								</div>
									
								<!-- 모달창 -->
								<div id="termsModal" class="modal">
									<div class="modal-content">
										<span class="close">&times;</span>
										<h2>약관 내역</h2><br>
										<span>이용 약관</span><br>
										<p>1.약관의 적용<br>
											1.1 본 이용약관은 "회사"와 이를 이용하는 "이용자" 간의 권리와 의무를 정함을 목적으로 합니다.<br>
											1.2 "이용자"란 본 이용약관에 동의하고, "회사"가 제공하는 서비스를 이용하는 자를 말합니다.<br>
											1.3 본 이용약관은 "회사"가 제공하는 모든 서비스에 적용되며, 특정 서비스에 대한 별도의 약관이 있는 경우 그 약관이 우선 적용됩니다.<br>
											2. 서비스의 제공 및 변경<br>
											2.1 "회사"는 "이용자"에게 신뢰성 있는 서비스를 제공하기 위해 최선을 다하며, 서비스의 일부 또는 전부를 임의로 변경, 중단할 수 있습니다.<br>
											2.2 "회사"는 서비스의 변경 또는 중단으로 인해 발생하는 손해에 대해 책임을 지지 않습니다.<br>
											3. 개인정보 보호<br>
											3.1 "회사"는 "이용자"의 개인정보를 적절히 보호하며, 관련 법령에 따라 처리합니다.<br>
											3.2 개인정보 보호에 관한 상세한 내용은 개인정보 처리방침을 참조하시기 바랍니다.<br>
											4. 서비스 이용료 및 결제<br>
											4.1 서비스 이용료는 별도로 정해진 경우 해당 조건에 따릅니다.<br>
											4.2 결제는 "이용자"가 선택한 결제 수단에 따라 처리되며, 관련된 안내에 따라야 합니다.<br>
											5. 서비스 이용 제한<br>
											5.1 "이용자"가 본 이용약관을 위반하거나 타인의 권리를 침해하는 행위를 하는 경우, "회사"는 해당 "이용자"의 서비스 이용을 제한하거나 계약을 해지할 수 있습니다.<br>
											5.2 "이용자"는 서비스 이용 시 관련 법령 및 규정을 준수하여야 하며, 타인의 권리를 존중하여야 합니다.<br>
											6. 손해배상<br>
											6.1 "이용자"가 본 이용약관을 위반하여 "회사"에 손해를 입힌 경우, "이용자"는 그 손해를 배상할 책임이 있습니다.<br>
											6.2 "회사"는 서비스 이용과 관련하여 발생한 "이용자"의 손해에 대해 책임을 지지 않습니다.<br>
											7. 준거법 및 재판관할<br>
											7.1 본 이용약관은 대한민국 법률에 따라 해석되며, "회사"와 "이용자" 간의 분쟁에 대한 관할 법원은 대한민국 법령에 따릅니다.<br>
											8. 기타 조항<br>
											8.1 본 이용약관에 명시되지 않은 사항에 대해서는 관련 법령 및 "회사"가 정한 정책에 따릅니다.<br>
											8.2 본 이용약관은 변경될 수 있으며, 변경된 내용은 서비스를 통해 공지됩니다.<br>
										</p>
										
										<span>개인정보 수집 및 이용동의</span><br>
										<p>1."회사"는 서비스 제공을 위해 필요한 최소한의 개인정보만을 수집합니다.<br>
										2.수집된 개인정보는 다음 목적을 위해 이용됩니다<br>
										   - 회원가입 및 관리<br>
										   - 서비스 제공 및 운영<br>
										   - 이용자에게 서비스 관련 공지 및 정보 제공<br>
										   - 기타 서비스 운영에 필요한 업무<br>
										3. 개인정보의 제3자 제공은 원칙적으로 이용자의 동의 없이 이루어지지 않습니다.다만, 관련 법령에 근거하여 예외적으로 이루어질 수 있습니다.<br>
										
										4. 이용자는 개인정보 제공에 동의하지 않거나 언제든지 제공한 동의를 철회할 수 있습니다. 단, 이 경우에는 일부 서비스 이용이 제한될 수 있습니다.<br>
										
										5. "회사"는 이용자의 개인정보를 적절히 보호하기 위해 관련 법령 및 정책을 준수하며, 개인정보 처리에 대한 상세한 내용은 개인정보 처리방침에서 확인할 수 있습니다.<br>
										
										6. "회사"는 개인정보의 안전한 보관 및 관리를 위해 보안 시스템을 운영하고 개인정보의 분실, 도난, 누설 등을 방지하기 위한 노력을 기울입니다.<br>
										
										7. 개인정보의 보유 및 파기<br>
										
										7.1 "회사"는 개인정보의 수집목적이 달성되면 지체 없이 해당 정보를 파기합니다.<br>
										
										7.2 개인정보 파기는 별도의 데이터 저장매체를 통해 진행되며, 재생이 불가능한 방법으로 영구적으로 삭제됩니다.<br>
										
										7.3 단, 관련 법령에 따라 일정 기간 동안 개인정보를 보존하여야 하는 경우에는 해당 기간 동안 보존됩니다.</p>
									</div>
								</div>
								<div>
									<span id="errorMsg" style="color:red;"></span>
								</div>
								<div class="joinBtn">
									<button type="button" id="joinUserBtn">회원가입</button>
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
	
		function checkAll() {
			var agreementAll = document.getElementById("agreementAll");
			var checkboxes = document.querySelectorAll('input[type="checkbox"]');
		
	 		for (var i = 0; i < checkboxes.length; i++) {
			checkboxes[i].checked = agreementAll.checked;
			}
		}
	// 모달창 열기
	document.getElementById('showTermsModal').addEventListener('click', function () {
		document.getElementById('termsModal').style.display = 'block';
	});

	// 모달창 닫기
	document.querySelector('.close').addEventListener('click', function () {
		document.getElementById('termsModal').style.display = 'none';
	});

	// 모달 외부 클릭 시 모달창 닫기
	window.addEventListener('click', function (event) {
		if (event.target === document.getElementById('termsModal')) {
			document.getElementById('termsModal').style.display = 'none';
		}
	});
</script>
<!-- 주소찾기 스크립트 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function DaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("extra_addr").value = extraAddr;
                    
                    } else {
                        document.getElementById("extra_addr").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("addr").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detail_addr").focus();
                    

	                //주소로 좌표를 검색합니다
                    var geocoder = new kakao.maps.services.Geocoder();
	                geocoder.addressSearch(addr, function(result, status) {
	                	$('#mapY').val(result[0].y);
	                	$('#mapX').val(result[0].x);
	                });
                }
            }).open();
        }
	</script>
<script>
function EmailCheck(){
	var email = $('#joinEmail').val();
	alert("인증번호가 발송되었습니다.");
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/memberEmailCheck.ajax",
		data : {"mbEmail" : email},
		dataType : "json",
		success : function(data){
			if(data.value == 0){
				StartTimer();
			}else if(data.value==5){
				alert("이메일 인증 실패, 이메일을 확인해주세요.");
			}else{
				alert("중복 이메일 있음");
			}
		},
		error : function(){
			alert("실패3");
		}
	});
}

</script>
<script>
function sendemail() {
	$("#checkemail").empty();
	Is_Mail_Duplicated = false;
	
	ResetTimer();
	    	
		const btnElement 
	    = document.getElementById('btn0');
	  
	 	btnElement.value = "인증번호 재전송";
	  		
	$("#email-certi").css("display","none");
	$("#checkemail").html("메일을 발송 중입니다. 잠시만 기다려 주세요....");
	
	// ajax로 이메일 중복검사후 타이머 재생
	EmailCheck();
}    
	
	
var timer;
var isRunning = false;

	//타이머 초기화
	function ResetTimer(){
		isRunning = false;
		clearInterval(this.timer);
		display = document.querySelector('#timer');
		display.textContent = "";
	Is_Mail_Duplicated = false;			
	$("#checkemail").empty();
	}
	
	//타이머 시작
	function StartTimer(){
	//이메일 타이머 인증 구현
	var leftSec = 60 * 3,
	display = document.querySelector('#timer');
	$("#checkemail").empty();
	$("#checkemail").html("입력시간 내에 인증번호를 입력해주세요.");
	// 이미 타이머가 작동중이면 중지
	if (isRunning){
		clearInterval(this.timer);
	}
	startTimer(leftSec, display);
	
	function startTimer(count, display) {
		var minutes, seconds;
		timer = setInterval(function () {
			minutes = parseInt(count / 60, 10);
			seconds = parseInt(count % 60, 10);
			
			minutes = minutes < 10 ? "0" + minutes : minutes;
			seconds = seconds < 10 ? "0" + seconds : seconds;				
			display.textContent = minutes + ":" + seconds;

			// 타이머 끝
			if (--count < 0) 
			{
				clearInterval(timer);
				display.textContent = "";
				isRunning = false;
				$("#checkemail").empty();
				$("#checkemail").html("입력시간 초과입니다. 재전송 해주세요.");
				$("#checkemail").css("color","red");
				document.getElementById("emailYN").value = "N";
				//alert("입력시간 초과입니다. 재전송 해주세요.");
			}
		},1000);
		isRunning = true;
	}  		
	}
	//타이머 종료 함수
	function endTimer(){
		clearInterval(timer);
	$("#timer").empty();
	}
	
	//확인을 클릭하면 이메일 인증을 비교하는 함수
	function emailConfirm()	{
		Is_Mail_Duplicated = false;
		var AuthCode = $("#userCheck").val();
		if($("#userCheck").val() == ""){
			alert("인증번호를 입력하세요.");
			return;
		}
		
	//Ajax로 이메일 중복검사
	$.ajax({
		type : "post",
		url: "${pageContext.request.contextPath}/getsign.ajax",
		dataType: "json",
		data:{"AuthCode":AuthCode},
		success : function(data) {
			if(data.value==1){
				Is_Mail_Duplicated = true;
				$("#checkemail").empty();
				$("#checkemail").html("인증번호가 일치 합니다.");
				$("#checkemail").css("color","blue");
				endTimer();
				
			}else{
				//alert("인증 번호가 일치하지 않습니다.");
				$("#checkemail").empty();
				$("#checkemail").html("인증번호가 일치 하지 않습니다.");
				$("#checkemail").css("color","red");
			}
		},
		error : function(){
			console.log('오류');
		}
	});   		
}  	

</script>
	
<script>

$('#joinUserBtn').click(function(){
	$('#errorMsg').css('display','none');
	var memberInfo = {
			'mbEmail' : $('#joinEmail').val(),
			'mbAuth' : $('#userCheck').val(),
			'mbPwd': $('#joinPwd').val(),
			'mbName': $('#userName').val(),
			'mbPhone': $('#userPhone').val(),
			'postcode':$('#postcode').val(),
			'addr':$('#addr').val(),
			'addrDetail':$('#detail_addr').val(),
			'mbMapY': $('#mapY').val(),
			'mbMapX': $('#mapX').val(),
	};
	console.log(memberInfo);
	if($('#joinPwd2').val()==""){
		$('#errorMsg').html("비밀번호 확인을 입력해주세요");
		$('#errorMsg').css('display','');
	}else if($('#joinPwd2').val()!=$('#joinPwd').val()){
		$('#errorMsg').html("비밀번호와 일치하는 값을 입력해주세요.");
		$('#errorMsg').css('display','');
	}else if($('#mapY').val()==""){
		$('#errorMsg').html("주소찾기를 통해 주소를 입력해주세요.");
		$('#errorMsg').css('display','');
	}else{
		$.ajax({
			contentType:'application/json;',
			type: "POST",
			url: '${pageContext.request.contextPath}/joinTrainerAction.ajax',
			dataType: "json",
			data: JSON.stringify(memberInfo),
			success: function(data){
				if(data.value==1){
					alert('가입이 완료되었습니다.');
					location.href='${pageContext.request.contextPath}/login';
				}else{
					$('#errorMsg').html(data.msg);
					$('#errorMsg').css('display','');
				}
			},
			error: function(){
				console.log("join user action error");
				return;
			}
			
		});
	}
	
});
	
</script>
<script>

</script>
	
</body>
</html>