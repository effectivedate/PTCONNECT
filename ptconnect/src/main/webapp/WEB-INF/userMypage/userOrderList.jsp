<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/orderList.css" type="text/css" rel="stylesheet">

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
								$('#user_tab2').addClass('active_tab');
							}
						</script>
						<div class="gray_background"><!-- 회색배경 -->
							<div class="my_container"><!-- 코치정보(마진오토) -->
								<div class="inner_contents"><!-- 코치정보(패딩탑) -->
									<div><!-- 코치정보 -->
										<div>
											<div>
											
											<div class="searchDate">
											    <label for="startDate">시작 날짜 : </label>
											    <input type="date" id="startDate" name="startDate" value="${startDate}">
											
											    <label for="endDate">종료 날짜:</label>
											    <input type="date" id="endDate" name="endDate" value="${endDate}">
												
												<div class="searchDateBtn">
												    <button type="button" onclick="searchByDateRange()">검색</button>
												    <button type="button" onclick="resetDateRange()">초기화</button>
												</div>
											</div>
											<div>
												<c:if test="${not empty startDate && not empty endDate}">
												${startDate} 부터 ${endDate} 까지의 검색 결과입니다.
												</c:if>
											</div>
											
											<c:forEach var="po" items="${pList}" varStatus="loop">
									        <div class="orderListBox">
									            <div class="">
									                <img class="orderProfile" src="https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"/>
									            </div>
									            <div class="orderContainer">
									                <span class="orderText">주문번호 :</span>
									                <span class="orderText">트레이너 :</span>
									                <span class="orderText">전화번호:</span>
									            </div>
									            <div class="orderContainer">
									                <span id="odNo_${loop.index}">${po.odNo}</span>
									                <span class="orderText">${po.tnName}</span>
									                <span class="orderText">${po.mbPhone}</span>
									                <span id="pmNo_${loop.index}" style="display: none;">${po.pmNo}</span>
									            </div>
									            <div class="orderContainer">
<!-- 									                <span class="orderText">사용쿠폰 :</span> -->
									                <span class="orderText">사용포인트 :</span>
									                <span class="orderText">결제금액 :</span>
									            </div>
									            <div class="orderContainer">
<%-- 									                <span class="orderName">${po.odCoupon}</span> --%>
									                <span class="orderText"><strong>${po.odPoint}</strong>포인트</span>
									                <span id="odPrice_${loop.index}"><strong>${po.odPrice}</strong>원</span>
									            </div>
									            <div class="orderContainer">
									                <span class="orderText">결제상태 :</span>
									                <span class="orderText">결제수단 :</span>
									                <span class="orderText">결제시간 :</span>
									            </div>
									            <div class="orderContainer">
									                <span class="orderName">
									                <c:choose>
										                <c:when test="${not empty po.pcState}">${po.pcState}</c:when>
										                <c:otherwise>${po.pmState}</c:otherwise>
									                </c:choose>
									                </span>
									                <span class="orderText">${po.pmCard}</span>
									                <span id="odDate_${loop.index}">${po.odDate}</span>
									            </div>
									            <div>
<%-- 									            	<button type="button" class="paymentCancle" onclick="paymentCancle(${loop.index})"> --%>
<!-- 														결제취소 -->
<!-- 													</button> -->
													<c:choose>
												    <c:when test="${po.pcState ne 'cancle'}">
												        <button type="button" class="paymentCancle" onclick="paymentCancle(${loop.index})">
												           	 결제취소
												        </button>
												    </c:when>
												    <c:otherwise>
												        <button type="button" class="paymentComplete" disabled>
												            취소완료
												        </button>
												    </c:otherwise>
													</c:choose>
									            </div>
									        </div>
											</c:forEach>
											</div>
										</div>
									</div>
									
									<!-- 페이징 영역 시작 -->
	                            	<div class="row my-4">
	                            		<div class="col-lg-12">
	                            			<div class="pagination-area">
	                            				<ul class="pagination">
	                            					<li class="paginate_button page-item previous">
		                            					<c:if test="${empty startDate  && empty endDate}"> 
															<c:if test="${pm.prev eq true}">
		                            						<a href="userOrderList${pm.startPage-1}" aria-controls="dataTable" class="page-link">
		                            							◀
		                            						</a>
		                            						</c:if>
		                            					</c:if>
		                            					<c:if test="${not empty startDate && not empty endDate}">
		                            						<c:if test="${pm.prev eq true}">
		                            						<a href="userOrderList${pm.startPage-1}?startDate=${startDate}&endDate=${endDate}" aria-controls="dataTable" class="page-link">
		                            							◀
		                            						</a>
		                            						</c:if>
		                            					</c:if>
	                            					</li>
	                            					<c:if test="${empty startDate  && empty endDate}"> 
		                            					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
		                            						<c:choose>
		                            							<c:when test="${i eq pm.currentPage}">
		                            								<li class="paginate_button page-item active">
					                            						<a href="userOrderList${i}" aria-controls="dataTable" class="page-link">
					                            							${i}
					                            						</a>
					                            					</li>
		                            							</c:when>
		                            							<c:otherwise>
		                            								<li class="paginate_button page-item">
					                            						<a href="userOrderList${i}" aria-controls="dataTable" class="page-link">
					                            							${i}
					                            						</a>
					                            					</li>
		                            							</c:otherwise>
		                            						</c:choose>
		                            					</c:forEach>
		                            				</c:if>
		                            				<c:if test="${not empty startDate && not empty endDate}">
		                            					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
										                    <c:choose>
										                        <c:when test="${i eq pm.currentPage}">
										                            <li class="paginate_button page-item active">
										                                <a href="userOrderList${i}?startDate=${startDate}&endDate=${endDate}" aria-controls="dataTable" class="page-link">
										                                    ${i}
										                                </a>
										                            </li>
										                        </c:when>
										                        <c:otherwise>
										                            <li class="paginate_button page-item">
										                                <a href="userOrderList${i}?startDate=${startDate}&endDate=${endDate}" aria-controls="dataTable" class="page-link">
										                                    ${i}
										                                </a>
										                            </li>
										                        </c:otherwise>
										                    </c:choose>
										                </c:forEach>
		                            				</c:if>
	                            					<li class="paginate_button page-item next">
	                            						<c:if test="${empty startDate && empty endDate}"> 
															<c:if test="${pm.next eq true && pm.endPage > 0}">
		                            						<a href="userOrderList${pm.endPage+1}" aria-controls="dataTable" class="page-link">
		                            							▶
		                            						</a>
		                            						</c:if>
		                            					</c:if>
		                            					<c:if test="${not empty startDate && not empty endDate}">
		                            						<c:if test="${pm.next eq true && pm.endPage > 0}">
		                            						<a href="userOrderList${pm.endPage+1}?startDate=${startDate}&endDate=${endDate}" aria-controls="dataTable" class="page-link">
		                            							▶
		                            						</a>
		                            						</c:if>
		                            					</c:if>
	                            					</li>
	                            				</ul>
	                            			</div>
										</div>
	                            	</div>
									<!-- 페이징 영역 끝-->
									
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

<script>

function paymentCancle(index) {
	console.log('index :', index);
	
            var confirmation = window.confirm('결제를 취소하시겠습니까?');

            if (confirmation) {
            	var pmNo = document.getElementById('pmNo_' + index).textContent;
            	var odNo = document.getElementById('odNo_' + index).textContent;
                var odPriceWon = document.getElementById('odPrice_' + index).textContent;
                var odPrice = odPriceWon.replace('원', '').trim();
                var odDate = document.getElementById('odDate_' + index).textContent;
            	
            	var result = {
                     	"pmNo": pmNo, // 결제번호
        				"odNo": odNo, // 주문번호
        				"pmPrice": odPrice, // 결제금액
        				"pmDate": odDate // 결제일
                    };

                    console.log(pmNo);
                    console.log(odNo);
                    console.log(odPrice);
                    console.log(odDate);
                   
                $.ajax({
                    url: 'userPaymentCancle',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(result),
                    success: function (res) {
                        console.log(res);
                    },
                    error: function (xhr, status, error) {
                        console.log(xhr.responseText);
                        console.log(status);
                        console.log(error);
//                         alert("error");
                    }
                });

                var msg = '결제가 취소되었습니다.';
                alert(msg);
                window.location.reload(false);
            } else {
                var msg = '취소되었습니다.';
                alert(msg);
            }
}

</script>

<script>
	//max 값에 현재 날짜 지정
	var now_utc = Date.now() // 지금 날짜를 밀리초로
	// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
	var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
	// new Date(now_utc-timeOff).toISOString()은 ex)'2022-05-11T18:09:38.134Z'를 반환
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	
	document.getElementById('endDate').max = today;
	document.getElementById('startDate').max = today;

// 	기간검색
	function searchByDateRange() {
	    var startDate = document.getElementById('startDate').value;
	    var endDate = document.getElementById('endDate').value;
	
	    var result = {
	        "startDate": startDate,
	        "endDate": endDate
	    };
	
	    $.ajax({
	        url: '${pageContext.request.contextPath}/userOrderList1?startDate=' + startDate + '&endDate=' + endDate, 
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(result),
	        success: function () {
		        	location.href='${pageContext.request.contextPath}/userOrderList1?startDate=' + startDate + '&endDate=' + endDate;
	        },
	        error: function (xhr, status, error) {
	            console.log(xhr.responseText);
	            console.log(status);
	            console.log(error);
	        }
	    });
	}
	
	function resetDateRange() {
        document.getElementById('startDate').value = '';
        document.getElementById('endDate').value = '';
        
        location.href="${pageContext.request.contextPath}/userOrderList1";
    }
	
</script>

</html>