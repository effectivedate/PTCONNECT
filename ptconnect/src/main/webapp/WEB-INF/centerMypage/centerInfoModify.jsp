<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css"
	type="text/css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/trainer.css"
	type="text/css" rel="stylesheet">
<script src="https://kit.fontawesome.com/1f85e66bca.js"
	crossorigin="anonymous"></script>

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
								$('#trainer_tab6').addClass('active_tab');
							}
						</script>
						<div class="gray_background">
							<!-- 회색배경 -->
							<div class="my_container">
								<!-- 코치정보(마진오토) -->
								<div class="inner_contents row" style="justify-content: center;"> 
									<!-- 코치정보(패딩탑) -->
									<div class="left_bar">
										<!-- 코치정보 -->
										<form name="frm" accept-charset="utf-8">
											<div class="trainer_info">
												<div class="trainer_photo">
													<div class="trainer_content">
														<h4>사진</h4>
														<div class="content_wrap">
															<!-- 이미지 미리보기 -->
															<div id="imagePreviewContainer"></div>
															<!-- 사진 업로드 버튼 -->
															<div class="upload-btn">
																<label class="file-label" for="chooseFile">사진 선택</label>
																<input class="files" type="file" id="chooseFile"
																	name="files" multiple="multiple"
																	onchange="previewImages(this)" style="display: none">
															</div>
														</div>
													</div>
												</div>
												<div class="trainer_lesson">
													<div class="trainer_content">
														<h4>센터 이름</h4>
														<div class="content_wrap">
															<input type="text" id="tnTicket" name="tnTicket"
																placeholder="센터 이름을 입력해주세요.">
														</div>
													</div>
												</div>
												<div class="trainer_introduce">
													<div class="trainer_content">
														<h4>센터 소개</h4>
														<div class="content_wrap">
															<div class="content_text">
																<textarea type="text" id="tnIntro" name="tnIntro"
																	placeholder="  소개글이 없어요."></textarea>
															</div>
														</div>
													</div>
												</div>
												<div class="trainer_program">
													<div class="trainer_content">
														<h4>이용 정보</h4>
														<div class="content_wrap">
															<div id="program-container">
																<div class="centerCheckbox">
																	<div>
																	<input class="centerCheckbox1" type="checkbox" value="운동복">운동복 무료</input>
																	</div>
																	<div>
																	<input class="centerCheckbox2" type="checkbox" value="운동복">운동복 유료</input>
																	</div>
																</div>
																<div class="centerCheckbox">
																	<div>
																	<input class="centerCheckbox3" type="checkbox" value="운동복">개인사물함 무료</input>
																	</div>
																	<div>
																	<input class="centerCheckbox4" type="checkbox" value="운동복">개인사물함 유료</input>
																	</div>
																</div>
																<div class="centerCheckbox">
																	<div>
																	<input class="centerCheckbox5" type="checkbox" value="운동복">주차장 있음</input>
																	</div>
																	<div>
																	<input class="centerCheckbox6" type="checkbox" value="운동복">주차장 없음</input>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="trainer_price">
													<div class="trainer_content">
														<h4>센터 이용 가격</h4>
														<div class="content_wrap">

															<table class="compLabel table priceTable" style="width: 100%;">
																<thead>
																	<tr>
																		<th scope="col">개월</th>
																		<th scope="col"></th>
																		<th scope="col">가격</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td><input type="text" id="lpCount"
																			placeholder="숫자만 입력" name="lpCount" maxlength="5"
																			value="" style="text-align: center;"></td>
																		<td rowspan=4>개월</td>
																		<td style="position: relative;">
																			<div
																				style="position: absolute; top: 24px; right: 20px; font-size: 14px; color: rgb(147, 147, 147);">
																				원</div> <input type="text" id="lessonPrice"
																			placeholder="숫자만 입력" name="lessonPrice" maxlength="9"
																			value=""
																			style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td><input type="text" id="lpCount"
																			placeholder="숫자만 입력" name="lpCount" maxlength="5"
																			value="" style="text-align: center;"></td>
																		<td style="position: relative;">
																			<div
																				style="position: absolute; top: 24px; right: 20px; font-size: 14px; color: rgb(147, 147, 147);">원
																			</div> <input type="text" id="lessonPrice"
																			placeholder="숫자만 입력" name="lessonPrice" maxlength="9"
																			value=""
																			style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td><input type="text" id="lpCount"
																			placeholder="숫자만 입력" name="lpCount" maxlength="5"
																			value="" style="text-align: center;"></td>
																		<td style="position: relative;">
																			<div
																				style="position: absolute; top: 24px; right: 20px; font-size: 14px; color: rgb(147, 147, 147);">원
																			</div> <input type="text" id="lessonPrice"
																			placeholder="숫자만 입력" name="lessonPrice" maxlength="9"
																			value=""
																			style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td><input type="text" id="lpCount"
																			placeholder="숫자만 입력" name="lpCount" maxlength="5"
																			value="" style="text-align: center;"></td>
																		<td style="position: relative;">
																			<div
																				style="position: absolute; top: 24px; right: 20px; font-size: 14px; color: rgb(147, 147, 147);">원
																			</div> <input type="text" id="lessonPrice"
																			placeholder="숫자만 입력" name="lessonPrice" maxlength="9"
																			value=""
																			style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
												<div class="trainer_price">
													<div class="trainer_content">
														<h4>센터 이용 시간</h4>
														<div class="content_wrap">

															<table class="compLabel table priceTable" style="width: 100%;">
																<tbody>
																	<tr>
																		<td>평일</td>
																		<td><input type="text" id="lpCount"
																			placeholder="숫자만 입력" name="lpCount" maxlength="5"
																			value="" style="text-align: center;"></td>
																		<td>~</td>
																		<td style="position: relative;">
																			<input type="text" id="lessonPrice"
																			placeholder="숫자만 입력" name="lessonPrice" maxlength="9"
																			value=""
																			style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td>토요일</td>
																		<td><input type="text" id="lpCount"
																			placeholder="숫자만 입력" name="lpCount" maxlength="5"
																			value="" style="text-align: center;"></td>
																		<td>~</td>
																		<td style="position: relative;">
																			<input type="text" id="lessonPrice"
																			placeholder="숫자만 입력" name="lessonPrice" maxlength="9"
																			value=""
																			style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td>일요일</td>
																		<td><input type="text" id="lpCount"
																			placeholder="숫자만 입력" name="lpCount" maxlength="5"
																			value="" style="text-align: center;"></td>
																		<td>~</td>
																		<td style="position: relative;">
																			<input type="text" id="lessonPrice"
																			placeholder="숫자만 입력" name="lessonPrice" maxlength="9"
																			value=""
																			style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td>휴무일</td>
																		<td colspan=3><input type="text" id="lpCount"
																			placeholder="숫자만 입력" name="lpCount" maxlength="5"
																			value="" style="text-align: center;"></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
												<div class="content_modify">
													<span class="edit write"> <i
														class="fa-solid fa-pencil"></i> 등록하기
													</span>
												</div>
											</div>
										</form>
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
</body>
</html>