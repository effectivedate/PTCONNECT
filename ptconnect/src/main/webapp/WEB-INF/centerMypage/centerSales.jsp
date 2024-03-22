<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/center.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div>
        <div>
            <div>
                <div> <!--헤더+맵-->
                    <jsp:include page="../include/header.jsp"/>
                    <section><!-- 섹션 -->
                        <jsp:include page="../include/centerHeader.jsp"/>
                        <script>
                            window.onload = function() {
                                $('#trainer_tab5').addClass('active_tab');
                            }
                        </script>
                        <div class="gray_background"><!-- 회색배경 -->
                            <div class="my_container"><!-- 코치정보(마진오토) -->
                            
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
                            
                                <div class="inner_contents center_sales"><!-- 코치정보(패딩탑) -->
                                    <c:forEach var="centerTrainerList" items="${centerTrainerList}">
                                    <div class="trainer_box">
                                        <table class="trainer_table">
                                            <tr>
                                                <td style="width: 25%;"><img src="${pageContext.request.contextPath}/resources/download/${centerTrainerList.tnImage}" alt="트레이너 프로필 사진"
                                                                    onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/img/mainbanner2.png'"></td>
                                                <td>${centerTrainerList.mbName} 트레이너</td>
                                                <td style="width: 30%;">매출 : <fmt:formatNumber value="${centerTrainerList.totalSales}" pattern="#,###"/>원</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="trainer_sales" style="display: none;">
                                        <table class="trainer_sales_table">
                                            <tr class="sales_top">
                                                <td>주문번호</td>
                                                <td>판매날짜</td>
                                                <td>구매자</td>
                                                <td>트레이너</td>
                                                <td>금액</td>
                                            </tr>
                                            <c:if test="${centerTrainerList.salesList ne null}">
	                                            <c:forEach var="sale" items="${centerTrainerList.salesList}" varStatus="loop">
	                                            <tr class="sales_bottom" style="<c:if test="${loop.index >= 20}">display:none;</c:if>">
	                                                <td>${sale.odNo}</td>
	                                                <td>${sale.odDate}</td>
	                                                <c:if test="${sale.mbName ne null}">
	                                                	<td>${sale.mbName}</td>
	                                                </c:if>
	                                                <c:if test="${sale.nmName ne null}">
	                                                	<td>${sale.nmName}</td>
	                                                </c:if>
	                                                <td>${sale.tnName}</td>
	                                                <td><fmt:formatNumber value="${sale.odPrice}" pattern="#,###"/> 원</td>
	                                            </tr>
	                                            </c:forEach>
                                            </c:if>
                                            <c:if test="${empty centerTrainerList.salesList}">
                                            <tr>
                                            	<td colspan=5 style="height: 100px;">판매내역 없음</td>
                                            </tr>
                                            </c:if>
                                        </table>
                                        <button class="loadMoreBtn">더 보기</button>
                                    </div>
                                    </c:forEach>
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

$(document).ready(function() {
	
	$('.trainer_box').click(function() {
        $(this).next('.trainer_sales').slideToggle('fast');
    });
	
    $('.loadMoreBtn').click(function() {
        $(this).siblings('.trainer_sales_table').find('.sales_bottom:hidden').slice(0, 20).show();
        if ($(this).siblings('.trainer_sales_table').find('.sales_bottom:hidden').length === 0) {
            $(this).hide();
        }
    });
    
    $('.trainer_sales_table').each(function() {
        var salesCount = $(this).find('.sales_bottom').length;
        if (salesCount <= 20) {
            $(this).siblings('.loadMoreBtn').hide();
        }
    });
    
});

</script>

<script>
	// max 값에 현재 날짜 지정
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
	        url: '${pageContext.request.contextPath}/centerSales1?startDate=' + startDate + '&endDate=' + endDate, 
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(result),
	        success: function () {
		        	location.href='${pageContext.request.contextPath}/centerSales1?startDate=' + startDate + '&endDate=' + endDate;
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
        
        location.href="${pageContext.request.contextPath}/centerSales1";
    }
	
</script>

</html>
