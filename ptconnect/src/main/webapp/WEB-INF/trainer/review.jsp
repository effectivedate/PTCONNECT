<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/trainer.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/photoModal.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/modal.css" type="text/css" rel="stylesheet">
<script src="https://kit.fontawesome.com/1f85e66bca.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6eaf7ed9af48a5319b75a0937ac3096&libraries=services"></script>
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
										<div class="trainer_info">
											<div class="trainer_review">
												<div class="trainer_content">
													<div class="content_wrap rating">
														<div style="display: flex;">
															<span class="review_rate">${tio.reviewRate}</span>
															<div class="review_summary">
																<div style="display: flex;">
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
																		<c:when test="${tio.reviewRate ge 2}">
																			<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																			<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																			<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																			<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																			<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																		</c:when>
																		<c:otherwise>
																			<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																			<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																			<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																			<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																			<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																		</c:otherwise>
																	</c:choose>
																</div>
																<div>${tio.reviewCnt}개의 후기</div>
															</div>
														</div>
														<div>
															<c:if test="${checkOrder > 0}">
															<div>
																<button class="review_write_button">
																	<i class="fa-solid fa-pencil"></i> <span>리뷰 작성하기</span>
																</button>
															</div>
															</c:if>
															<c:if test="${checkOrder eq 0 || mbNo eq null}">
															<div>
																1회 체험권을 구매하신 회원님들만 리뷰를 작성하실 수 있습니다.
															</div>
															</c:if>
														</div>
													</div>
													<div class="content_wrap">
														<div class="content_wrap_title">생생한 후기를 확인하세요.</div>
														<div class="review_list">
															<ul>
																<c:forEach var="rvo" items="${rvo_alist}">
																	<div class="review">
																		<li>
																			<div>
																				<div class="review_header">
																					<div>
																						<span class="user_icon">
																							<i class="fa-solid fa-user"></i>
																						</span>
																						<span class="user_name">${rvo.mbName}</span>
																						<span class="date">${rvo.rvDate}</span>
																					</div>
																					<div class="review_star">
																						<c:choose>
																							<c:when test="${rvo.rvRate eq 5}">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																							</c:when>
																							<c:when test="${rvo.rvRate eq 4}">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																							</c:when>
																							<c:when test="${rvo.rvRate eq 3}">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																							</c:when>
																							<c:when test="${rvo.rvRate eq 2}">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																							</c:when>
																							<c:otherwise>
																								<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																								<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
																							</c:otherwise>
																						</c:choose>
																					</div>
																				</div>
																				<div class="review_context">
																					<div class="review_photo">
																						<div class="photo_box">
																							<div style="display: inline;">
																								<!-- a태그는 modal창을 띄우는 용도 -->
																								<c:forEach var="rvo_file" items="${rvo.rvFilename}">
																									<div class="photo_wrap review_photo">
																										<div class="photo_rel">
																											<div class="photo_abs">
																												<img class="photo_size" src="${pageContext.request.contextPath}/resources/download/${rvo_file.fdName}">
																											</div>
																										</div>
																									</div>
																								</c:forEach>
																							</div>
																						</div>
																					</div>
																					<div class="review_text">
																						<pre>${rvo.rvContent}</pre>
																					</div>
																				</div>
																			</div>
																		</li>
																	</div>	
																</c:forEach>
																
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 트레이너 프로필 -->
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
														<div class="center_name" onclick="centerInfoView()">${tio.ctName}</div>
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
																<c:when test="${tio.reviewRate ge 2}">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_on.svg" class="review_star">
																	<img src="${pageContext.request.contextPath}/resources/img/star_off.svg" class="review_star">
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
																<span class="count" onclick="review()">(${tio.reviewCnt})</span>
															</span>
														</div>
														<div class="pickup_line">"${tio.tnOneLine}"</div>
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
															<!-- <div class="flex_box">
																<span class="left">전문분야</span><span class="right">프로그램을 추가하세요</span>
															</div> -->
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
									<!-- 코치프로필 -->
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
	
	<!--리뷰 모달창 -->
	<jsp:include page="../include/reviewModal.jsp"/>
	<!--결제 모달창 -->
	<jsp:include page="../include/orderModal.jsp"/>
	
<script>

	window.onload = function() {
		$('#trainer_tab3').addClass('active_tab');
		
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
	
</script>
<script>

/* 모달 팝업 스크립트 */
const modal = $('#modal_wrap');
const closeBtn = $('#close_btn');

//X버튼 클릭 시 모달 닫음
closeBtn.click(function() {
	
	modal.css('display','none');
});

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
//				bulletClass:"custom_bullet",
//				bulletActiveClass:"swiper-pagination-custom-bullet-active",
//				renderBullet: function (index, className) {
//					return '<div class="' + className + '">' +
//                 '<img src="${pageContext.request.contextPath}/resources/download/${centerPhotos[index].fdName}">' +
//                 '</div>';
//				}
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
//	if($('.review_button_expand_wrap').css('opacity')==1){
//		$('.review_button_expand_wrap').css('opacity',0);
//	}else{
//		$('.review_button_expand_wrap').css('opacity',1);
//	}
	orderModal.css('display','flex');
	$("body").addClass("overflow-hidden");
//		$(".modal").addClass("overflow-auto");
//		$(".modal_dialog").addClass("mt-10p");
//		$(".modal_dialog").addClass("pt-10p");
//	console.log('order_button');
});

exitButton2.click(function() {
	orderModal.css('display','none');
	$("body").removeClass("overflow-hidden");
//		$(".modal").removeClass("overflow-auto");
//		$(".modal_dialog").removeClass("mt-10p");
//		$(".modal_dialog").removeClass("pt-10p");
});

modalColse2.click(function() {
	orderModal.css('display','none');
	$("body").removeClass("overflow-hidden");
//		$(".modal").removeClass("overflow-auto");
//		$(".modal_dialog").removeClass("mt-10p");
//		$(".modal_dialog").removeClass("pt-10p");
});

//	window.onclick = function(a){
//		console.log(a.target);
//		if(a.target.classList.contains('order_modal')){
//			orderModal.css('display','none');
//		}
//	}

</script>

<script>

/* 모달 팝업 스크립트 */
const modal2 = $('#modal_wrap');
const closeBtn2 = $('#close_btn');
//모달 영역 밖 클릭 시 모달 닫음
window.onclick = function(e){
	console.log(e.target);
	if(e.target.classList.contains('modal_wrap')){
		modal2.css('display','none');
	}
	if(e.target.classList.contains('order_modal')){
			orderModal.css('display','none');
		}
}

//X버튼 클릭 시 모달 닫음
closeBtn2.click(function() {
	modal.css('display','none');
});

$(document).ready(function(){

	$(document).on("click", ".review_photo", function() {
	    // 클릭된 리뷰의 사진들만 모달에 표시하기 위해 클릭된 리뷰 요소에서 사진 요소를 찾음
	    var $reviewPhotos = $(this).closest('.review').find('.photo_size');
	    
	    // 해당 리뷰의 사진들을 담을 변수 초기화
	    var str = '';
	    
	    // 찾은 사진 요소들을 순회하며 HTML 문자열로 변환하여 변수에 추가
	    $reviewPhotos.each(function() {
	        str += '<div class="swiper-slide">';
	        str += '<img class="modal_photo" src="' + $(this).attr('src') + '">';
	        str += '</div>';
	    });
	
	    // 모달에 사진들 추가
	    $('.swiper-wrapper').html(str);
	    
	    $("#modal_wrap").css('display', 'flex');
	    
	    var swiper = new Swiper(".my_swiper", {
			spaceBetween: 30,
			centeredSlides: true,
			autoHeight : true,
			slidesPerView: 1,
			pagination: {
				el: ".swiper-pagination-custom",
				clickable: true//,
	//				bulletClass:"custom_bullet",
	//				bulletActiveClass:"swiper-pagination-custom-bullet-active",
	//				renderBullet: function (index, className) {
	//					return '<div class="' + className + '">' +
	//                 '<img src="${pageContext.request.contextPath}/resources/download/${centerPhotos[index].fdName}">' +
	//                 '</div>';
	//				}
			},
			navigation: {
				nextEl: ".swiper-button-next",
				prevEl: ".swiper-button-prev",
			},
		});
	});

});

</script>


<script src="${pageContext.request.contextPath}/resources/js/review.js">
</script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/order.js"> --%>
<!-- </script> -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/photoModal.js"> --%>
<!-- </script> -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/reviewPhotoModal.js"> --%>
<!-- </script> -->

</body>
</html>