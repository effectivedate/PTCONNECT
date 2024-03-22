<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>센터 정보</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/trainer.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/photoModal.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/modal.css" type="text/css" rel="stylesheet">
<script src="https://kit.fontawesome.com/1f85e66bca.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6412c9bc45721bb30b8210290a2b03c8&libraries=services"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

</head>
<body>
	<div>
		<div>
			<div>
				<div> <!--헤더+맵-->
					<jsp:include page="../include/header.jsp"/>
					<section><!-- 섹션 -->
						<div class="center_photo_box">
							<div class="photo_box">
								<img class="first" src="${pageContext.request.contextPath}/resources/download/${centerPhotos[0].fdName}">
								<img class="rest" src="${pageContext.request.contextPath}/resources/download/${centerPhotos[1].fdName}">
								<img class="rest" src="${pageContext.request.contextPath}/resources/download/${centerPhotos[2].fdName}">
								<img class="rest" src="${pageContext.request.contextPath}/resources/download/${centerPhotos[3].fdName}">
								<div class="rest popup_btn"
									style="background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('${pageContext.request.contextPath}/resources/download/${centerPhotos[0].fdName}');">
									<div class="center_photo_view"><i class="fa-solid fa-images"></i>사진 전체보기</div>
								</div>
							</div>
						</div>
						<jsp:include page="../include/trainerViewHeader.jsp"/>

						<div class="gray_background"><!-- 회색배경 -->
							<div class="my_container"><!-- 코치정보(마진오토) -->
								<div class="inner_contents row"><!-- 코치정보(패딩탑) -->
									<div class="left_bar"><!-- 코치정보 -->
										<div class="center_info">
											<div class="center_basic">
												<div class="trainer_content">
													<div class="content_wrap">
														<div class="center">
															<strong>${tio.ctName}</strong>
														</div>
														<div class="center">
															<span>${tio.mbAddr}</span>
														</div>
														<div>
															<div class="photo_box">
																<div style="display: inline;">
																	<!-- a태그는 modal창을 띄우는 용도 -->
																	<c:forEach var="centerPhotos" items="${centerPhotos}">
																		<div class="photo_wrap">
																			<div class="photo_rel">
																				<div class="photo_abs">
																					<img class="photo_size" src="${pageContext.request.contextPath}/resources/download/${centerPhotos.fdName}">
																				</div>
																			</div>
																		</div>
																	</c:forEach>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>	
											<div class="center_introduce">
												<div class="trainer_content">
													<h4>
														센터 소개
													</h4>
													<div class="content_wrap">
														<div class="content_text">
															<pre>${tio.ctIntro}</pre>
														</div>
													</div>
												</div>
											</div><div class="center_info">
												<div class="trainer_content">
													<h4>
														센터 시설 정보
													</h4>
													<div class="content_wrap" style="padding: 24px 24px 0px 24px;">
														<div>
															<c:forEach var="centerInfo" items="${centerInfo}">
																<div class="trophy">
																	<c:choose>
																		<c:when test="${fn:contains(centerInfo, '주차')}">
																			<div class="div-icon">
																				<i class="fa-solid fa-square-parking"></i>
																			</div>
																		</c:when>
																		<c:when test="${fn:contains(centerInfo, '운동복')}">
																			<div class="div-icon">
																				<i class="fa-solid fa-shirt"></i>
																			</div>
																		</c:when>
																		<c:when test="${fn:contains(centerInfo, '사물함')}">
																			<div class="div-icon">
																				<i class="fa-solid fa-box"></i>
																			</div>
																		</c:when>
																		<c:when test="${fn:contains(centerInfo, '샤워')}">
																			<div class="div-icon">
																				<i class="fa-solid fa-shower"></i>
																			</div>
																		</c:when>	
																	</c:choose> 
																	<span>${centerInfo}</span>
																</div>	
															</c:forEach>
														</div>
													</div>
												</div>
											</div>
											
											<div class="center_price">
												<div class="trainer_content">
													<h4>
														센터 이용 가격
													</h4>
													<div class="content_wrap">
														<div class="price_head">센터 이용료</div>
														<div class="price_table">
														<c:forEach var="centerPrice" items="${centerPrice}">
															<div class="price_line">
																<div class="price_count">${centerPrice.ctUsePeriods} 개월</div>
																<div class="price">
																	<div class="price_per">월 <strong>${centerPrice.avgPrice}</strong> 원</div>
																	<div class="price_total">총 <strong>${centerPrice.ctPrices}</strong> 원</div>
																</div>
															</div>
														</c:forEach>
														</div>
													</div>
												</div>
											</div>
											<div class="trainer_location">
												<div class="trainer_content">
													<h4>
														위치
													</h4>
													<div class="content_wrap">
														<div class="center">
															<strong>${tio.ctName}</strong>
														</div>
														<div class="center">
															<span>${tio.mbAddr}</span>
														</div>
														<div id="map" class="center_location">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<!-- 트레이너 프로필 영역-->
									<div class="right_bar">
										<div class="trainer_profile">
											<div class="upside">
<!-- 												<div class="report_button"> -->
<!-- 													&#x1F6A8 -->
<!-- 												</div> -->
												<div>
													<div>
														<c:choose>
															<c:when test="${tio.flNo ne 0}">
																<img class="trainer_round_image" src="${pageContext.request.contextPath}/resources/download/${tio_photo_alist[0].fdName}"
																	style="border: 1px solid #5865F2"
																	alt="트레이너 프로필 사진"
																	onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/img/mainbanner2.png'">
															</c:when>
															<c:otherwise>
																<img class="trainer_round_image" src="${pageContext.request.contextPath}/resources/img/mainbanner2.png"
																	alt="트레이너의 사진이 없습니다."
																	style="border: 1px solid #5865F2">
															</c:otherwise>
														</c:choose>												
													</div>
													<div>
														<div class="trainer_name">${tio.mbName}</div>
														<div class="center_name">${tio.ctName}</div>
														<div class="stars">
															<c:choose>
																<c:when test="${tio.reviewRate ge 4.5}">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																</c:when>
																<c:when test="${tio.reviewRate ge 4}">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																</c:when>
																<c:when test="${tio.reviewRate ge 3}">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																</c:when>
																<c:when test="${tio.reviewRate gt 0}">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																</c:when>
																<c:otherwise>
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																</c:otherwise>
															</c:choose>
															<span class="review_wrap">
																<span class="rating">${tio.reviewRate}</span>
																<span class="count">(${tio.reviewCnt})</span>
															</span>
														</div>
														<div class="pickup_line">${tio.tnOneLine}</div>
														<div class="list_wrap">
															<div class="flex_box">
																<span class="left">자격검증</span>
																<span class="right">
																	<c:choose>
																		<c:when test="${QualifyArr ne null}">
																			<c:forEach var="Qualify" items="${QualifyArr}" varStatus="index">
																				${Qualify}
																				<c:if test="${false eq index.last}">,&nbsp</c:if>
																			</c:forEach>
																		</c:when>
																		<c:otherwise>
																			자격사항을 등록하세요
																		</c:otherwise>
																	</c:choose>																
																</span>
															</div>
															<div class="flex_box">
																<span class="left">대표가격</span><span class="right">1회 체험권 <span class="span_tnTicket">${tio.tnTicket}</span> 원</span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="downside">
												<button class="order">1회 체험 신청 하기</button>
<!-- 												<button class="counseling"> -->
<!-- 													<i class="fa-solid fa-comment"></i> -->
<!-- 													상담받기 -->
<!-- 												</button> -->
											</div>
										</div>
									</div>
									<!-- 코치프로필 영역-->
									
								</div>
							</div>
						</div>
					</section>
					
					<jsp:include page="../include/footer.jsp"/>
					
				</div>
			</div>
		</div>
	</div>
	<div>
		<div id="modal_wrap" class="modal_wrap">
			<div class="modal_b">
				<div class="close_button">
					<div id="close_btn">
						<span>&times;</span>
					</div>
				</div>
				<div class="modal_body">
					<div class="swiper my_swiper">
						<div class="swiper-wrapper">
					
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-pagination-custom"></div>
			<div class="swiper-button-next" style="color: white;"></div>
			<div class="swiper-button-prev" style="color: white;"></div>
		</div>
	</div>
	<div>
	</div>
	
	<!--결제 모달창 -->
	<jsp:include page="../include/orderModal.jsp"/>
	
<script>
	
	window.onload = function() {
		$('#trainer_tab2').addClass('active_tab');
		
		//탭 a 태그 주소에 매개변수 받는 부분 추가
		let a_tap_link = $(".a_tap_link");
		let href;
		for(var i = 0; i < a_tap_link.length; i++){
			href = $(a_tap_link[i]).prop('href');
			href += "?tnNo=${tio.tnNo}";
			$(a_tap_link[i]).attr("href", href);
		}
		$(a_tap_link[2]).text("후기(${tio.reviewCnt})");
	}
	
	function centerInfoView(){
		location.href = "${pageContext.request.contextPath}/centerInfoView?tnNo=${tio.tnNo}";
	}
	
	function review(){
		location.href = "${pageContext.request.contextPath}/review?tnNo=${tio.tnNo}";
	}
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div var geocoder = new kakao.maps.services.Geocoder();
	mapOption = {
		center: new kakao.maps.LatLng(${tio.mbMapY}, ${tio.mbMapX}), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	var markerPosition  = new kakao.maps.LatLng(${tio.mbMapY}, ${tio.mbMapX}); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position: markerPosition
	});	
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map)
	
	var iwContent = '<div style="padding:5px;">${tio.ctName}<div class="close" onclick="closeInfoWindow()"></div><br><a href="https://map.kakao.com/link/map/${tio.ctName},${tio.mbMapY}, ${tio.mbMapX}" style="color:blue" target="_blank">큰 지도보기</a> <a href="https://map.kakao.com/link/to/${tio.ctName},${tio.mbMapY}, ${tio.mbMapX}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	iwPosition = new kakao.maps.LatLng(${tio.mbMapY}, ${tio.mbMapX}); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		position : iwPosition, 
		content : iwContent 
	});	
	
	// 마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function() {
		// 마커 위에 인포윈도우를 표시합니다
		infowindow.open(map, marker);
	});
	
	function closeInfoWindow(){
		infowindow.close();
	}
	
</script>

<script>
	/* 모달 팝업 스크립트 */
	const modal = $('#modal_wrap');
	const closeBtn = $('#close_btn');
	
	//X버튼 클릭 시 모달 닫음
	closeBtn.click(function() {
		
		modal.css('display','none');
	});
	
	window.onclick = function(e){
		console.log(e.target);
		if(e.target.classList.contains('modal_wrap')){
			modal.css('display','none');
		}
		if(e.target.classList.contains('order_modal')){
 			orderModal.css('display','none');
 		}
	}
	
	$(document).ready(function(){
		
		$(document).on("click",".popup_btn", function(){
	
			$('.swiper-wrapper').html('');
			var str = '';
			
			<c:forEach var="centerPhoto" items="${centerPhotos}">
				str += '<div class="swiper-slide">';
				str += '<img class="modal_photo" src="${pageContext.request.contextPath}/resources/download/${centerPhoto.fdName}">';
				str += '</div>';
			</c:forEach>
			
			$('.swiper-wrapper').html(str);
			
			$("#modal_wrap").css('display', 'flex');
			
		});
		
		var swiper = new Swiper(".my_swiper", {
			spaceBetween: 30,
			centeredSlides: true,
			autoHeight : true,
			slidesPerView: 1,
			pagination: {
				el: ".swiper-pagination-custom",
				clickable: true//,
// 				bulletClass:"custom_bullet",
// 				bulletActiveClass:"swiper-pagination-custom-bullet-active",
// 				renderBullet: function (index, className) {
// 					return '<div class="' + className + '">' +
// 	                '<img src="${pageContext.request.contextPath}/resources/download/${centerPhotos[index].fdName}">' +
// 	                '</div>';
// 				}
			},
			navigation: {
				nextEl: ".swiper-button-next",
				prevEl: ".swiper-button-prev",
			},
		});
		
	});
	
	const orderModal = $('.order_modal');
	const exitButton2 = $('.exit_button');
	const modalColse2 = $('.modal_close');
	// 리뷰 작성하기 버튼
	$('.order').click(function(){
//		if($('.review_button_expand_wrap').css('opacity')==1){
//			$('.review_button_expand_wrap').css('opacity',0);
//		}else{
//			$('.review_button_expand_wrap').css('opacity',1);
//		}
		orderModal.css('display','flex');
		$("body").addClass("overflow-hidden");
// 		$(".modal").addClass("overflow-auto");
// 		$(".modal_dialog").addClass("mt-10p");
// 		$(".modal_dialog").addClass("pt-10p");
//		console.log('order_button');
	});

	exitButton2.click(function() {
		orderModal.css('display','none');
		$("body").removeClass("overflow-hidden");
// 		$(".modal").removeClass("overflow-auto");
// 		$(".modal_dialog").removeClass("mt-10p");
// 		$(".modal_dialog").removeClass("pt-10p");
	});

	modalColse2.click(function() {
		orderModal.css('display','none');
		$("body").removeClass("overflow-hidden");
// 		$(".modal").removeClass("overflow-auto");
// 		$(".modal_dialog").removeClass("mt-10p");
// 		$(".modal_dialog").removeClass("pt-10p");
	});
	
</script>

<%-- <script src="${pageContext.request.contextPath}/resources/js/order.js"> --%>
<!-- </script> -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/photoModal.js"> --%>
<!-- </script> -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/reviewPhotoModal.js"> --%>
<!-- </script> -->
</body>
<style>
	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	.wrap * {padding: 0;margin: 0;}
	.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	.close {position: absolute;top: 5px;right: -5px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	.close:hover {cursor: pointer;}
	.info .body {position: relative;overflow: hidden;}
	.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	.info .link {color: #5085BB;}
</style>
</html>