<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- 결제창 모달 -->
	<div id="order_modal" class="modal order_modal">
			<button class="modal_close">
				<span>&times;</span>
			</button>
			<div class="modal_dialog" style="width: 500px;">
				<div class="modal_content">
					<div class="modal_body" style="margin-bottom: 0;">
						<div>
							<div class="orientationContent">
								<div class="progress" style="height: 4px;">
									<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="height: 4px; width: 100%; background-color: #5865f2;">
									</div>
								</div>
							</div>
							<div>
								<div class="trainerBarWrap">
									<div class="trainerBar">
										<img class="profileImage" src="https://file.woondoc.com/gym/cover/QwqvhHp2HYATzi9nTEUEnjjzZaxQ3KTX_1700440964_5752163.jpg" alt="profile">
										<div class="coachProfileWrap">
											<div class="coachName">레슨 1회 체험</div>
											<div class="centerName">${tio.mbName} | ${tio.ctName}</div>
										</div>
									</div>
								</div>
							</div>
							
							<div style="padding: 25px 0px;">
								<span style="font-size: 20px;">상품 금액</span>
								<span style="float: right;">
<!-- 									<span style="text-decoration: line-through; font-size: 17px; color: rgb(207, 207, 207);">55,000원</span> -->
									<span style="font-size: 20px; font-weight: bold;"><fmt:formatNumber value="${tio.tnTicket}" pattern="#,###"/>원</span>
								</span>
							</div>
							<div style="margin-top: 0px;">
								<div class="style_input__InputDiv-sc-139qydd-0 jMxvw">
									<label>이름 <span class="required">*</span></label>
									<input id="nmName" type="text" name="nmName" placeholder="필수 입력" maxlength="10" value="${mo.mbName}" <c:if test="${not empty mo.mbName}">readonly</c:if>>
								</div>
							</div>
							
							<div class="order_comment" style="<c:if test='${not empty mbNo}'>display:none;</c:if>">
								휴대폰 번호와 비밀번호는 비회원 주문조회시 필요한 정보입니다!
							</div>
							<div style="margin-top: 24px;">
								<div class="style_input__InputDiv-sc-139qydd-0 jMxvw">
									<label>휴대폰 번호 <span>*</span></label>
									<div class="inputWrap">
										<div class="inputWidth">
											<input type="tel" id="nmPhone" name="nmPhone" placeholder="'-'없이 입력" maxlength="20" autocomplete="off" value="${mo.mbPhone}" <c:if test="${not empty mo.mbName}">readonly</c:if>>
										</div>
									</div>
								</div>
							</div>
							<div style="<c:if test='${not empty mbNo}'>display:none;</c:if>">
								<div style="margin-top: 24px;">
									<div class="style_input__InputDiv-sc-139qydd-0 jMxvw">
										<label>비밀번호 <span>*</span></label>
										<div class="inputWrap">
											<div class="inputWidth">
												<input type="text" id="nmPwd" name="nmPwd" placeholder="필수 입력" maxlength="20" autocomplete="off" value="">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="order_comment">
								트레이너님이 일정 협의를 위해 연락드립니다.
							</div>
							
							<div style="margin: 24px 0;">
								<div class="order_wrap">
									<label class="order_title">
										상담에 필요한 간단한 정보를 입력해주세요.
									</label>
								</div>
								<textarea rows="6" placeholder="ex) pt를 신청한 목적, 성별, 나이, 시간대, 간단한 건강정보 등" name="opIntro" id="opIntro" maxlength="400"></textarea>
							</div>
							
							<c:if test="${mbNo ne null}">
							<div style="margin-top: 24px;">
								<div class="style_input__InputDiv-sc-139qydd-0 jMxvw">
									<label>포인트 사용</label>
									<div class="inputWrap" style="display: flex;">
										<div class="inputWidth" style="width: 70%;">
											<input type="text" class="usePointInfo" name="usePoint" placeholder="${sumPoint}p 사용가능" maxlength="20" autocomplete="off" value="">
										</div>
										
										<div class="usePoint">
											<button class="usePointButton" onclick="usePoint()">사용</button>
										</div>
										
									</div>
								</div>
							</div>
							
<!-- 							<div style="margin-top: 24px;"> -->
<!-- 								<div class="style_input__InputDiv-sc-139qydd-0 jMxvw"> -->
<!-- 									<label>쿠폰 </label> -->
<!-- 									<div class="inputWrap" style="display: flex;"> -->
<!-- 										<div class="inputWidth" style="width: 70%;"> -->
<!-- 											<select name="odCoupon"> -->
<%-- 												<c:forEach var="i" begin="1" end="3" step="1"> --%>
<%-- 												<option>쿠폰${i}</option> --%>
<%-- 												</c:forEach> --%>
<!-- 											</select> -->
<!-- 										</div> -->
										
<!-- 										<div class="useCoupon"> -->
<!-- 											<button class="useCouponButton">사용</button> -->
<!-- 										</div> -->
										
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
							
							<div style="padding: 25px 0px;">
								<span style="font-size: 20px;">포인트 적립</span>
								<span style="float: right;">
									<span id="accumulatedPoints" style="font-size: 20px; font-weight: bold;"></span>
								</span>
							</div>
							</c:if>
							
							<div style="padding: 25px 0px;">
								<span style="font-size: 20px;">결제 금액</span>
								<span style="float: right;">
									<span id="odPrice" style="font-size: 20px; font-weight: bold;"><fmt:formatNumber value="${tio.tnTicket}" pattern="#,###"/>원</span>
								</span>
							</div>
							
							<div>
								<button type="button" class="paymentButtom" onclick="requestPay()">
									<span>결제하기</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<script>
    	
    	/* 주문번호생성 */
	    function createOrderNum(){
	    	const date = new Date();
	    	const year = date.getFullYear();
	    	const month = String(date.getMonth() + 1).padStart(2, "0");
	    	const day = String(date.getDate()).padStart(2, "0");
	    	
	    	let orderNum = year + month + day;
	    	for(let i=0;i<10;i++) {
	    		orderNum += Math.floor(Math.random() * 10);	
	    	}
	    	
	    	console.log(orderNum);
	    	
	    	return orderNum;
	    }
    
    </script>
    
    <!-- 포인트 적립 -->
	<script>
		/* 포인트 사용 전 */
		var odPriceValue = document.getElementById('odPrice').textContent;
		var amountValue = parseInt(odPriceValue.replace(/[^0-9]/g, ''), 10);
		var pointPercentage = 0.02;
		var accumulatedPoints = amountValue * pointPercentage;
		
		document.getElementById("accumulatedPoints").innerHTML = accumulatedPoints + "p";
		
	</script>
	
	<!-- 포인트 사용 -->
    <script>
    
	    function usePoint() {
	    	 
	        // 현재 주문 가격 가져오기
	        var odPriceElement = document.getElementById('odPrice');
	        var amountValue = parseInt(odPriceElement.textContent.replace(/[^0-9]/g, ''), 10);
	        
	     	// "usePoint" 입력 필드에 입력된 값 가져오기
	        var usePointInput = parseInt($('input[name="usePoint"]').val(), 10) || 0;
	     	
	     	// 사용포인트가 양수인지 정수인지 확인
	        if (usePointInput <= 0 || !Number.isInteger(usePointInput)) {
	            alert('숫자만 입력해주세요.');
	            return;
	        }
	     	
	        if (usePointInput > ${sumPoint}) {
	        	alert('보유포인트보다 많은 포인트를 사용할 수 없습니다.');
	        	return;
	        }
	        
	        if (usePointInput > amountValue) {
	            alert('결제금액보다 많은 포인트를 사용할 수 없습니다.');
	            return;
	        }
	       if(confirm(usePointInput + "p를 사용하시겠습니까?")) {
	    	    alert("포인트사용 완료");
	    	   
	    	    $('.usePointButton').prop('disabled', true);
		    	$('.usePointInfo').prop('readonly', true);
		    	$('.usePointInfo').css('background-color', '#e4eaf0');
	    	   
	    		// 사용된 포인트를 뺀 새로운 주문 가격 계산
		        var newPrice = amountValue - usePointInput;
		
				var pointPercentage = 0.02;
				var accumulatedPoints = Math.floor(newPrice * pointPercentage);
				
		        //  내용을 동적 업데이트 
		        odPriceElement.textContent = newPrice + "원";	// 포인트 사용 후 가격
		        document.getElementById("accumulatedPoints").innerHTML = accumulatedPoints + "p";	// 포인트 사용후 적립금
	       }else {
	    	   alert("포인트 사용을 취소하였습니다.");
	    	   return;
	       }
			
	    }
    
    </script>
	
	<!-- 포트원 결제 -->
	<script>
	
	    var IMP = window.IMP;
	    IMP.init("imp61344517");
	
	    function requestPay() {
	        var opIntroValue = document.getElementById('opIntro').value;
	        var odPriceValue = document.getElementById('odPrice').textContent; // 주문 금액
	        var amountValue = parseInt(odPriceValue.replace(/[^0-9]/g, ''), 10); // 최종 주문 금액 정수로
	        var usePointInputValue = $('input[name="usePoint"]').val();	// 사용 포인트
	        var nmNameValue = document.getElementById('nmName').value;
	        var nmPhoneValue = document.getElementById('nmPhone').value;
	        var nmPwdValue = document.getElementById('nmPwd').value;
	        if(usePointInputValue != null) {
	        	var realPriceValue = "${tio.tnTicket}" - usePointInputValue; // 포인트 사용 후 최종 결제 금액
	   		} else if(usePointInputValue == null) {
	   			var realPriceValue = "${tio.tnTicket}";
	   		}
	        console.log("odPriceValue:", odPriceValue);
	        console.log("amountValue:", amountValue);
	        console.log("usePointInputValue:", usePointInputValue);
	        console.log("nmNameValue:", nmNameValue);
	        console.log("nmPhoneValue:", nmPhoneValue);
	        console.log("nmPwdValue:", nmPwdValue);
	        console.log("realPriceValue:", realPriceValue);
	        
// 	        회원일때만 적립포인트 가져옴
	        var mbNo = '${mbNo}';
	        if(mbNo != '') {
				var accumulatedPoints = parseInt(document.getElementById('accumulatedPoints').textContent.replace(/[^0-9]/g, ''), 10);	// 최종 적립 포인트
				console.log("accumulatedPoints:", accumulatedPoints);
	        }
	        
// 	        유효성체크
			if(mbNo == '') {
		        if(nmNameValue == ""){
		    		alert("이름을 입력해주세요.");
		    		$('#nmName').focus();
		    		return;
		    	}
		        if(nmPhoneValue == ""){
		    		alert("전화번호를 입력해주세요.");
		    		$('#nmPhone').focus();
		    		return;
		    	}
		        if(nmPwdValue == ""){
		    		alert("비밀번호를 입력해주세요.");
		    		$('#nmPwd').focus();
		    		return;
	    		}
			}
	        
	        IMP.request_pay({
	            pg: "html5_inicis",       // KG이니시스 pg 파라미터 값
	            pay_method: "card",       // 결제 방법
	            merchant_uid: createOrderNum(), // 주문번호
	            name: "${tio.mbName}",          // 상품 명
	            amount: realPriceValue,          // 주문 금액
	            buyer_email: "gildong@gmail.com",
	            buyer_name: "홍길동",
	            buyer_tel: "010-4242-4242",
	        },
	        function (rsp) { // callback
	            console.log(rsp);
	
	            if (!rsp.success) {
	                // 결제가 실패한 경우
	                var msg = '결제 실패';
	                msg += '\n에러내용 : ' + rsp.error_msg;
	                alert(msg);
	                return;
	            }
	
	            if (amountValue !== rsp.paid_amount) {
	                // 결제 성공하지만 금액이 일치하지 않을 때
	                
	                var result = {
	                	"pmNo": rsp.imp_uid, // 결제번호
	 	                "portOneNo": rsp.merchant_uid, // 결제번호
	 					"odNo": rsp.merchant_uid, // 주문번호
	 					"pgCorp": rsp.pg_provider, // pg사 구분코드
	 					"pmMethod": rsp.pay_method, // 결제수단
	 					"pmCard": rsp.card_name, // 결제 카드
	 					"pmPrice": rsp.paid_amount, // 결제금액
	 					"pmDate": rsp.paid_at, // 결제일
		 				"pmState": rsp.status,  // 결제상태
	 					"opIntro": opIntroValue, // 간단상담내용
	 					"odPrice": realPriceValue,	// 주문금액
	 					"nmName" : nmNameValue,
	 					"nmPhone" : nmPhoneValue,
	 					"nmPwd" : nmPwdValue
	                };

	                console.log(result);

	                $.ajax({
	                    url: 'paymentCancle',
	                    type: 'POST',
	                    contentType: 'application/json',
	                    data: JSON.stringify(result),
	                    success: function (res) {
	                        console.log(res);
	                    },
	                    error: function (err) {
	                        console.log(err);
	                    }
	                }); //ajax
	                var msg = '결제 금액이 일치하지 않아 결제가 취소됩니다.';
	                alert(msg);
	                
	                window.location.href = window.location.href;
	                
	                return;
	                
	            } else {
	                // 결제 성공 및 금액 일치하는 경우에만 서버로 데이터 전송
	                var result = {
	                    "pmNo": rsp.imp_uid, // 결제번호
	                    "portOneNo": rsp.merchant_uid, // 결제번호
	                    "odNo": rsp.merchant_uid, // 주문번호
	                    "pgCorp": rsp.pg_provider, // pg사 구분코드
	                    "pmMethod": rsp.pay_method, // 결제수단
	                    "pmCard": rsp.card_name, // 결제 카드
	                    "pmPrice": rsp.paid_amount, // 결제금액
	                    "pmDate": rsp.paid_at, // 결제일
	                    "pmState": rsp.status,  // 결제상태
	                    "opIntro": opIntroValue, // 간단상담내용
	                    "odPrice": realPriceValue,	// 주문금액
	                    "ptPoint": accumulatedPoints, // 적립 포인트
	                    "ptContent": '상품구매',	// 적립 내용
	                    "usePoint": usePointInputValue,	// 사용포인트
	                    "useContent": '상품구매',	// 포인트 사용내용
	                    "nmName" : nmNameValue,
	                    "nmPhone" : nmPhoneValue,
	                    "nmPwd" : nmPwdValue
	                };

	                console.log(result);

	                $.ajax({
	                    url: 'payment',
	                    type: 'POST',
	                    contentType: 'application/json',
	                    data: JSON.stringify(result),
	                    success: function (res) {
	                        console.log(res);
	                    },
	                    error: function (err) {
	                        console.log(err);
	                    }
	                }); //ajax

	                // 결제 성공 및 데이터 전송 후에만 알림 표시
	                var msg = '결제가 완료되었습니다.';
	                alert(msg);
// 	                location.href = window.location.href;

					var mbNo = '${mbNo}';
					console.log(mbNo);
					
	                if(mbNo != ''){
	                	location.href = 'userOrderList1';
	                } else {
	                	window.location.href = window.location.href;
	                }
	                
	            }
	        });
	    }
	    
	</script>
	
    
