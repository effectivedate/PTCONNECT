<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 찾기</title>
<link href="${pageContext.request.contextPath}/resources/css/coach.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6412c9bc45721bb30b8210290a2b03c8&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	
	<jsp:include page="/WEB-INF/include/header.jsp"/>

	<section style="margin-bottom: -20px;"><!-- 섹션 -->
		<div class="searchTab_wrap">
			<div class="searchBar_wrap">
				<div class="searchType">
					<div class="typeFilter">
						<div class="typeComp active">전체</div>
					</div>
					<div class="filter">
						<img src="${pageContext.request.contextPath}/resources/img/filter_icon_black.svg" alt="Filter Icon" width="24px" height="24px">
					</div>
					
				</div>
				
				<!-- 검색 필터 부분 -->
				<form id="filter_Form" action="${pageContext.request.contextPath}/findTrainer.do" method="get">
					<div class="searchBar">
						<input type="text" id="search_keyword" name="keyword" class="bar" value="${pm.scri.keyword}" placeholder="지역, 센터, 선생님 검색" autocomplete="off" maxlength="30">
						<div class="search_btn">
							<img src="${pageContext.request.contextPath}/resources/img/search.svg">
						</div>
					</div>
					<div class="searchBar_option">
						<div class="flex">
							<div>
								<img src="${pageContext.request.contextPath}/resources/img//markericon.png" width="17px" height="25px">
								<span>
									<span id="address-1" class="search_key">
										<c:choose>
											<c:when test="${uAddr ne null}">
												<c:choose>
													<c:when test="${tio_alist[0].selectMapY eq 0.0}">
														${uAddr}
													</c:when>
													<c:otherwise>
														${selectedAddr}
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${tio_alist[0].selectMapY eq 0.0}">
														전라북도 전주시 덕진구 백제대로 572
													</c:when>
													<c:otherwise>
														${selectedAddr}
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose> 
									</span> 검색 결과
									<input type="hidden" id="zip-code" placeholder="우편번호">
									<input type="hidden" id="selectMapY" name="selectMapY" value="${tio_alist[0].selectMapY}">
									<input type="hidden" id="selectMapX" name="selectMapX" value="${tio_alist[0].selectMapX}">
									<input type="hidden" id="selectedAddr" name="selectedAddr" value="${selectedAddr}">
								</span>
							</div>
						</div>
					</div>
					
					<div class="filter_option <c:if test='${filterOnOff eq 1}'>visible</c:if>">
						<div class="filter_Initialization">
							<div class="headerComp">
								<img src="${pageContext.request.contextPath}/resources/img//arrow_left.svg" alt="search">
							</div>
							<div class="headerComp">
								<div class="resetFilter">필터 초기화</div>
							</div>
						</div>
						
						<div class="filterOption_list">
							<div class="radius">
								<h3>검색 반경
									<span class="radius_key">1km 이내</span>
								</h3>
							</div>
							
							<div class="radius_slider">
								<input type="range" id="radius-slider" name="distance" min="500" max="5000" step="500" value="${pm.scri.distance}">
							</div>
							
							<ul class="distance">
								<li style="text-align:left;">500m</li>
								<li style="text-align:right;">5km</li>
							</ul>
							
							<div class="sorting">
								<div class="sortingBtn" data-value="distance">거리 순</div>
								<div class="sortingBtn" data-value="reviewCnt">리뷰많은 순</div>
								<div class="sortingBtn" data-value="tnTicket">최저가 순</div>
								<input type="hidden" id="orderBy" name="orderBy" value="${pm.scri.orderBy}">
							</div>
							
							<div class="filterBtn">
								<button class="btn_filter">필터 적용하기</button>
							</div>
						</div>
					</div>
				</form>
				<!-- 검색 필터 부분 -->
				
			</div>
			
			<!-- 검색된 결과 리스트 영역 -->
			<div class="searchForm">
				<div class="searchResultWrap">
					<div class="searchResultArea">
						
						<!-- DB 데이터 -->
						<c:forEach var="tio" items="${tio_alist}">
							<a href="trainerInfoView?tnNo=${tio.tnNo}" class="searchResultCard">
								<div class="coachCard">
									<div>
										<div class="coachImages">
											<c:choose>
												<c:when test="${not empty tio.tioFileName[0].fdName}">
													<img class="trainerImg" src="${pageContext.request.contextPath}/resources/download/${tio.tioFileName[0].fdName}"
														style="border-radius: 12px 0px 0px;"
														onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/img/mainbanner1.png'">
												</c:when>
												<c:otherwise>
													<img class="trainerImg" src="${pageContext.request.contextPath}/resources/img/mainbanner1.png"
														style="border-radius: 12px 0px 0px;">
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${not empty tio.tioFileName[1].fdName}">
													<img class="trainerImg" src="${pageContext.request.contextPath}/resources/download/${tio.tioFileName[1].fdName}"
														onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/img/mainbanner2.png'">
												</c:when>
												<c:otherwise>
													<img class="trainerImg" src="${pageContext.request.contextPath}/resources/img/mainbanner2.png">
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${not empty tio.cioFileName[0].fdName}">
													<img class="gymImg" src="${pageContext.request.contextPath}/resources/download/${tio.cioFileName[0].fdName}"
														style="border: none; border-radius: 0px 12px 0px 0px;"
														onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/img/mainbanner3.png'">
												</c:when>
												<c:otherwise>
													<img class="gymImg" src="${pageContext.request.contextPath}/resources/img/mainbanner3.png"
														style="border: none; border-radius: 0px 12px 0px 0px;">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="coachInfo">
											<div class="coachTitle">
												<h3 class="coachName">${tio.mbName}</h3>
												<div class="coachReviewCnt">
													<img class="reviewIcon" src="${pageContext.request.contextPath}/resources/img/staricon.png">
													<span class="reviewText">${tio.reviewRate}</span>
												</div>
											</div>
											
											<div class="coachOneLine">
												<p>${tio.tnOneLine}</p>
											</div>
											
											<div class="priceInfo">
												<div class="priceTitle"> 1회 체험권 </div>
												<div class="ptPrice"><strong><fmt:formatNumber value="${tio.tnTicket}" pattern="#,###"/></strong> 원</div>
											</div>
											
											<div class="location">
												<img src="${pageContext.request.contextPath}/resources/img/locationicon.png">
												<p class="locationAddr">${tio.ctName}</p>
												<p class="locationDistance">약 ${tio.distance/1000} km</p>
											</div>
										</div>
									</div>
								</div>
							</a>
						</c:forEach>
						<!-- 샘플 데이터 -->
						
					</div>
				</div>
			</div>
			<!-- 리스트 영역 -->
			
		</div>
		
	</section>
	
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
	
		<div class="mapWrap">
			<div style="width:100%; height:100%;" id="map"></div>
			<div class="hAddr">
				<span class="title">현재위치</span>
				<span id="centerAddr"></span>
			</div>
		</div>

	<c:choose>
		<c:when test="${mbNo ne null}">
			${mbMapX}
		</c:when>
		<c:when test="${mbMapY ne null && mbNo ne null}">
			${mbMapY}
		</c:when>
		<c:otherwise>
			asd
		</c:otherwise>
	</c:choose>
	
<script>



	//헤더 여백 설정ㄱ
	$('.contents').addClass('coach_nav');
	
	document.addEventListener("DOMContentLoaded", function() {
	    var filterButton = document.querySelector(".filter");
	    var returnButton = document.querySelector(".headerComp");
	    let filter_option = $(".filter_option");
	    
	    if (filter_option.hasClass("visible")) {
	        $(".searchResultWrap").addClass("filter_height_reCalc");
	    }
	    
	    filterButton.addEventListener("click", function() {
	        var filterOption = document.querySelector(".filter_option");
	        filterOption.classList.toggle("visible"); // "visible" 클래스를 토글하여 나타나거나 숨겨짐
	        $(".searchResultWrap").toggleClass("filter_height_reCalc");
// 	        $(".mapWrap").toggleClass("mapResize");
	    });
	    returnButton.addEventListener("click", function() {
	        var filterOption = document.querySelector(".filter_option");
	        filterOption.classList.toggle("visible"); // "visible" 클래스를 토글하여 나타나거나 숨겨짐
	        $(".searchResultWrap").toggleClass("filter_height_reCalc");
// 	        $(".searchResultWrap").height("calc(100vh - 242px)");
// 	        $(".mapWrap").toggleClass("mapResize");
	        
	    });
	});
	
// 	function filter_height_reCalc(){
		
// 		let filter_option = $(".filter_option");
// 		if($(filter_option).hasClass("visibel")){
// 			$(".searchResultWrap").toggleClass("filter_height_reCalc");
// 		}
// 	}
// 	filter_height_reCalc();	
	
	//필터 정렬 순서 버튼 클릭 시 색상변화, 클릭 감지 이벤트 리스너 달아줌
	var sortingBtn = document.querySelectorAll(".sortingBtn");
	
	function handleClick1(e){
		for(let i = 0; i < sortingBtn.length; i++){
			sortingBtn[i].classList.remove("active_round_box");
		}
		e.target.classList.add("active_round_box");
		let orderByVal = $(".active_round_box").data("value");
		$("#orderBy").val(orderByVal);
	}
	
	function init1(){
		for(let i = 0; i < sortingBtn.length; i++){
			sortingBtn[i].addEventListener("click", handleClick1);
			if($("#orderBy").val() == sortingBtn[i].dataset['value']){
				sortingBtn[i].classList.add("active_round_box");
			}
		}
	}
	init1();
	

	function rangeSlider(){
		
		let range = $('#radius-slider');
		let value = $(".radius_key");
		
		let spanVal = $('#radius-slider').attr('value');
		value.html((spanVal*0.001)+'km 이내')
		
		range.on('input', function(){
			if(this.value < 1000){
				value.html((this.value) + 'm 이내');
			}else{
				value.html((this.value*0.001) + 'km 이내');
			}
		});
			
	}
	rangeSlider();	
	
	$(document).ready(function(){
		
		$(".search_btn, .btn_filter").on("click", function(){	//검색 버튼
			$("#filter_Form").submit();
		});
		
		$(".resetFilter").on("click",function(){	//검색 조건 초기화
			
			history.replaceState({}, null, location.pathname);
			location.reload();
			
// 			$("#filter_Form")[0].reset(); //선택한 form 내부의 조건 초기화
		});
		
	});	
	
	
 	$(".searchBar_option").on("click", function(e){
 		e.preventDefault();
 		execDaumPostcode();
	});
 	var testCenter = [2];
	<c:choose>
		<c:when test='${mbNo eq null}'>
			<c:choose>
				<c:when test='${selectMapY eq 0.0}'>
					testCenter[0] = 35.84026098258203;
					testCenter[1] = 127.1324143491829;
				</c:when>
				<c:otherwise>
					testCenter[0] = ${selectMapY};
					testCenter[1] = ${selectMapX};
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test='${selectMapY eq 0.0}'>
					testCenter[0] = ${mbMapY};
					testCenter[1] = ${mbMapX};
				</c:when>
				<c:otherwise>
					testCenter[0] = ${selectMapY};
					testCenter[1] = ${selectMapX};
				</c:otherwise>
			</c:choose>		
		</c:otherwise>
	</c:choose>
	
	var mapContainer = document.getElementById('map'),
	mapOption = {
		center: new kakao.maps.LatLng(testCenter[0], testCenter[1]),
		level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);	
	
	var positions = [
// 		{
// 			title: '이젠 피트니스 센터',
// 			latlng: new kakao.maps.LatLng(35.84026098258203, 127.1324143491829) // y좌표-위도, x좌표-경도  (latlng에는 위도, 경도 순 입력)
// 		},
		<c:forEach items='${tio_alist}' var='tio' varStatus="tioIDX">
			{
				title: '${tio.ctName}',
				latlng: new kakao.maps.LatLng(${tio.mbMapY}, ${tio.mbMapX}) // y좌표-위도, x좌표-경도  (latlng에는 위도, 경도 순 입력)
			}<c:if test='${tioIDX.last eq false}'>,</c:if>
		</c:forEach>
	];

	for (var i = 0; i < positions.length; i++) {	//데이터 개수만큼 반복문 돌면서 마커, 오버레이 생성
		var data = positions[i];

		displayMarker(data,i);
	}
	
	function displayMarker(data,e){

	  	var content ='<div>';
		content += '<div class="marker_wrap">';
		content += data.title;
		content += '</div>';
		content += '<div class="marker_pin">';
		content += '</div">';
		content += '</div">';
			
		var marker = new kakao.maps.CustomOverlay({	//좌표값을 지정해 마커 생성
			map : map,
			position : data.latlng,
			content: content
		});		
	}	
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();	
	
	var marker = new kakao.maps.Marker(); // 클릭한 위치를 표시할 마커입니다
	var infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다 	
	
	var markers = [];
	var infoWindowArr = [];
	function removeMarkers(){
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
			infoWindowArr[i].close();
		}
		markers = [];
		infoWindowArr = [];
	}
	
	var markerPosition  =	<c:choose>
								<c:when test="${tio_alist[0].selectMapY eq 0.0}">
									new kakao.maps.LatLng(35.84026098258203, 127.1324143491829);
								</c:when>
								<c:otherwise>
									new kakao.maps.LatLng(${selectMapY}, ${selectMapX});
								</c:otherwise>
							</c:choose>
							
	function firstMarker(){
	
		var marker = new kakao.maps.Marker({
		map: map,
		position: markerPosition
		});
		markers.push(marker);
		infoWindowArr.push(infowindow);
	}
	firstMarker();	
	
	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		removeMarkers();
		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
				detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
				var content = '<div class="bAddr">' +
							'<span class="title">법정동 주소정보</span>' + 
								detailAddr + 
							'</div>';
				var address_1 = $('#address-1');
				if(!result[0].road_address){
					$(address_1).text(result[0].address.address_name);
					$("#selectedAddr").val(result[0].address.address_name);
				}else{
					$(address_1).text(result[0].road_address.address_name);
					$("#selectedAddr").val(result[0].address.address_name);
				}
				
				$("#selectMapY").val(mouseEvent.latLng.Ma);	//Ma : 위도, La : 경도
				$("#selectMapX").val(mouseEvent.latLng.La);
				
				// 마커를 클릭한 위치에 표시합니다 
				marker.setPosition(mouseEvent.latLng);
				marker.setMap(map);
				
				markers.push(marker);
				
				// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
				infowindow.setContent(content);
				infowindow.open(map, marker);
				
				infoWindowArr.push(infowindow);
				
				$("#filter_Form").submit();
			}
		});
		
		
	});
	
	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});
	
	function searchAddrFromCoords(coords, callback) {
		// 좌표로 행정동 주소 정보를 요청합니다
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}
	
	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	
	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			var infoDiv = document.getElementById('centerAddr');
			
			for(var i = 0; i < result.length; i++) {
				// 행정동의 region_type 값은 'H' 이므로
				if (result[i].region_type === 'H') {
					infoDiv.innerHTML = result[i].address_name;
					break;
				}
			}
		}
	}
	
	//카카오 다음 우편번호 찾기
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				removeMarkers();
				document.getElementById( 'zip-code' ).value = data.zonecode;
				$('#address-1').text(data.address);
				$("#selectedAddr").val(data.address);
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(data.address, function (result, status) {
					if (status === kakao.maps.services.Status.OK) {
						
						// 검색된 좌표를 변수에 저장합니다
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);+
						$("#selectMapY").val(result[0].y);
						$("#selectMapX").val(result[0].x);
						console.log($("#selectMapY").val());
						console.log($("#selectMapX").val());
		
						// 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new kakao.maps.Marker({
							map: map,
							position: coords
						});
						markers.push(marker);
						infoWindowArr.push(infowindow);
		
						// 검색된 좌표로 지도 중심을 이동시킵니다
						map.setCenter(coords);
					
					} else {
						// 검색 실패 시 예시 좌표로 이동합니다
						var exampleCoords = new kakao.maps.LatLng(35.86302160353555, 127.148340249);
						alert("검색 실패! 예시 좌표 " + exampleCoords.toString() + " 로 이동합니다.");
						map.setCenter(exampleCoords);
					}
					
					$("#filter_Form").submit();
				});
			}
		}).open();
	}	
	
	function setDraggable(draggable){
		map.setDraggable(draggable);
	}
	
	var mapTypeControl = new kakao.maps.MapTypeControl();	//지도, 스카이뷰 버튼 추가
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	var zoomControl = new kakao.maps.ZoomControl();		//확대, 축소 UI 추가
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);	
	
</script>
</body>
<style>
.map_wrap {position:relative;width:100%;height:350px;}
.title {font-weight:bold;display:block;}
.hAddr {color: #000000c7;font-size: 14px;position:absolute;left:10px;top:10px;border-radius: 4px;background: rgb(255 255 255 / 64%);z-index:1;padding:5px;}
#centerAddr {display:block;margin-top:2px;font-weight: normal;}
.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
</html>