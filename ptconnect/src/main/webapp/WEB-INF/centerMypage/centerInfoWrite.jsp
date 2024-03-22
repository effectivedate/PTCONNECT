<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<div>
					<!--헤더+맵-->
					<jsp:include page="../include/header.jsp" />
					<section>
						<!-- 섹션 -->
						<jsp:include page="../include/centerHeader.jsp" />
						<script>
							window.onload = function() {
								$('#trainer_tab2').addClass('active_tab');
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
														<div class="notice_wrap t_notice">
															<ul>
																<li>센터를 어필 할 수 있는 사진을 올려주세요.</li>
																<li>첫장이 대표사진으로 설정됩니다.</li>
															</ul>
														</div>
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
														<div class="notice_wrap t_notice">
															<ul>
																<li>센터이름을 입력해주세요.</li>
															</ul>
														</div>
														<div class="content_wrap">
															<input type="text" id="tnTicket" name="ctName"
																placeholder="센터 이름을 입력해주세요." value="${cio.ctName}">
														</div>
													</div>
												</div>
												<div class="trainer_introduce">
													<div class="trainer_content">
														<h4>센터 소개</h4>
														<div class="notice_wrap t_notice">
															<ul>
																<li>센터를 소개해주세요.</li>
															</ul>
														</div>
														<div class="content_wrap">
															<div class="content_text">
																<textarea type="text" id="tnIntro" name="ctIntro"
																	placeholder="  소개글이 없어요.">${cio.ctIntro}</textarea>
															</div>
														</div>
													</div>
												</div>
												<div class="trainer_program">
													<div class="trainer_content">
														<h4>이용 정보</h4>
														<div class="notice_wrap t_notice">
															<ul>
																<li>센터의 이용정보를 선택해주세요.</li>
															</ul>
														</div>
														<div class="content_wrap">
															<div id="program-container">
																<div class="centerCheckbox">
																	<div>
																		<input class="centerCheckbox1" type="checkbox"
																			name="ctInfo" value="운동복 무료">운동복 무료
																	</div>
																	<div>
																		<input class="centerCheckbox2" type="checkbox"
																			name="ctInfo" value="운동복 유료">운동복 유료
																	</div>
																</div>
																<div class="centerCheckbox">
																	<div>
																		<input class="centerCheckbox3" type="checkbox"
																			name="ctInfo" value="개인사물함 무료">개인사물함 무료
																	</div>
																	<div>
																		<input class="centerCheckbox4" type="checkbox"
																			name="ctInfo" value="개인사물함 유료">개인사물함 유료
																	</div>
																</div>
																<div class="centerCheckbox">
																	<div>
																		<input class="centerCheckbox5" type="checkbox"
																			name="ctInfo" value="주차장 있음">주차장 있음
																	</div>
																	<div>
																		<input class="centerCheckbox6" type="checkbox"
																			name="ctInfo" value="주차장 없음">주차장 없음
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="trainer_price">
													<div class="trainer_content">
														<h4>센터 이용 가격</h4>
														<div class="notice_wrap t_notice">
															<ul>
																<li>센터의 이용 가격을 알려주세요.</li>
																<li>부가세 포함 금액 기준으로 작성해주세요.</li>
															</ul>
														</div>
														<div class="content_wrap">

															<table class="compLabel table priceTable"
																style="width: 100%;">
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
																			placeholder="숫자만 입력" name="ctPrice" maxlength="5"
																			value="${ctPriceArr[0]}" style="text-align: center;"></td>
																		<td rowspan=4>개월</td>
																		<td style="position: relative;">
																			<div
																				style="position: absolute; top: 24px; right: 20px; font-size: 14px; color: rgb(147, 147, 147);">
																				원</div> <input type="text" id="lessonPrice"
																			placeholder="숫자만 입력" name="ctPrice" maxlength="9"
																			value="${ctPriceArr[1]}"
																			style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td><input type="text" id="lpCount"
																			placeholder="숫자만 입력" name="ctPrice" maxlength="5"
																			value="${ctPriceArr[2]}" style="text-align: center;"></td>
																		<td style="position: relative;">
																			<div
																				style="position: absolute; top: 24px; right: 20px; font-size: 14px; color: rgb(147, 147, 147);">원
																			</div> <input type="text" id="lessonPrice"
																			placeholder="숫자만 입력" name="ctPrice" maxlength="9"
																			value="${ctPriceArr[3]}"
																			style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td><input type="text" id="lpCount"
																			placeholder="숫자만 입력" name="ctPrice" maxlength="5"
																			value="${ctPriceArr[4]}" style="text-align: center;"></td>
																		<td style="position: relative;">
																			<div
																				style="position: absolute; top: 24px; right: 20px; font-size: 14px; color: rgb(147, 147, 147);">원
																			</div> <input type="text" id="lessonPrice"
																			placeholder="숫자만 입력" name="ctPrice" maxlength="9"
																			value="${ctPriceArr[5]}"
																			style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td><input type="text" id="lpCount"
																			placeholder="숫자만 입력" name="ctPrice" maxlength="5"
																			value="${ctPriceArr[6]}" style="text-align: center;"></td>
																		<td style="position: relative;">
																			<div
																				style="position: absolute; top: 24px; right: 20px; font-size: 14px; color: rgb(147, 147, 147);">원
																			</div> <input type="text" id="lessonPrice"
																			placeholder="숫자만 입력" name="ctPrice" maxlength="9"
																			value="${ctPriceArr[7]}"
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
														<div class="notice_wrap t_notice">
															<ul>
																<li>센터의 운영 시간을 알려주세요.</li>
																<li>24시간 기준으로 입력해주세요. (예: 오후 7시> 19시)</li>
															</ul>
														</div>
														<div class="content_wrap">

															<table class="compLabel table priceTable"
																style="width: 100%;">
																<tbody>
																	<tr>
																		<td>평일</td>
																		<td><input type="text" id="lpCount"
																			name="ctOperate" placeholder="숫자만 입력"
																			maxlength="5" value="${ctOperateArr[0]}" style="text-align: center;"></td>
																		<td>~</td>
																		<td style="position: relative;"><input
																			type="text" id="lessonPrice" name="ctOperate"
																			placeholder="숫자만 입력" maxlength="9"
																			value="${ctOperateArr[1]}"
																			style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td>토요일</td>
																		<td><input type="text" id="lpCount"
																			name="ctOperate" placeholder="숫자만 입력" 
																			maxlength="5" value="${ctOperateArr[2]}" style="text-align: center;"></td>
																		<td>~</td>
																		<td style="position: relative;"><input
																			type="text" id="lessonPrice" name="ctOperate"
																			placeholder="숫자만 입력" maxlength="9"
																			value="${ctOperateArr[3]}"
																			style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td>일요일</td>
																		<td><input type="text" id="lpCount"
																			name="ctOperate" placeholder="숫자만 입력" 
																			maxlength="5" value="${ctOperateArr[4]}" style="text-align: center;"></td>
																		<td>~</td>
																		<td style="position: relative;"><input
																			type="text" id="lessonPrice" name="ctOperate"
																			placeholder="숫자만 입력" maxlength="9"
																			value="${ctOperateArr[5]}"
																			style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td>휴무일</td>
																		<td colspan=3><input type="text" id="lpCount"
																			name="ctOperate" placeholder="숫자만 입력"
																			maxlength="5" value="${ctOperateArr[6]}" style="text-align: center;"></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
												<div class="trainer_notice_line">
													<div class="trainer_notice">
														<div class="notice_wrap">
															<ul>
																<li>관리자의 센터승인이 완료되면 센터정보가 등록됩니다.</li>
																<li>승인이 완료될 시 트레이너가 센터를 선택할 수 있습니다.</li>
															</ul>
														</div>
													</div>
												</div>
												<c:if test="${empty cio.ctIntro}">
												<div class="content_modify">
													<span class="edit write"> <i
														class="fa-solid fa-pencil"></i> 등록하기
													</span>
												</div>
												</c:if>
												<c:if test="${not empty cio.ctIntro}">
												<div class="content_modify">
													<span class="edit write"> <i
														class="fa-solid fa-pencil"></i> 수정하기
													</span>
												</div>
												</c:if>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</section>
					<jsp:include page="../include/footer.jsp" />
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	
	var imageCount = 0; // 각 이미지의 고유한 카운터

	function previewImages(input) {
	    var container = document.getElementById("imagePreviewContainer");

	    // 이미지를 추가하기 전에 기존의 미리보기를 모두 제거
	    container.innerHTML = '';

	    if (input.files && input.files.length > 0) {
	        for (var i = 0; i < input.files.length; i++) {
	            var reader = new FileReader();

	            reader.onload = function (e) {
	                var imagePreview = document.createElement("img");
	                imagePreview.src = e.target.result;
	                imagePreview.alt = "이미지 미리보기";
	                imagePreview.style.maxWidth = "100%";

	                var imageId = "image_" + imageCount;

	                var cancelButton = document.createElement("button");
	                cancelButton.type = "button";
	                cancelButton.innerText = "X";
	                cancelButton.onclick = function () {
	                    cancelFileUpload(imageId);
	                };

	                var imageDiv = document.createElement("div");
	                imageDiv.id = imageId;
	                imageDiv.appendChild(imagePreview);
	                imageDiv.appendChild(cancelButton);

	                container.appendChild(imageDiv);

	                imageCount++;
	            };

	            reader.readAsDataURL(input.files[i]);
	        }
	    }
	}

	function cancelFileUpload(imageId) {
	    var container = document.getElementById("imagePreviewContainer");
	    var imageDiv = document.getElementById(imageId);

	    // 해당 미리보기를 삭제
	    container.removeChild(imageDiv);
	}
		
	</script>

<script>
	
		document.addEventListener("DOMContentLoaded", function () {
			
	        var editButtons = document.querySelectorAll(".edit");
	        editButtons.forEach(function(button) {
                button.addEventListener("click", check);
            });
	    });
		
		    var ctPriceInputs = document.querySelectorAll('input[name="ctPrice"]');
		    var ctPriceData = [];
		    
		    for (var i = 0; i < ctPriceInputs.length; i++) {
		        var ctPrice = ctPriceInputs[i].value;

		        var ctPriceInfo = {
	        		ctPrice: ctPrice,
		        };

		        ctPriceData.push(ctPriceInfo);
		    }
		    
		    var ctOperateInputs = document.querySelectorAll('input[name="ctOperate"]');
		    var ctOperateData = [];
		    
		    for (var i = 0; i < ctOperateInputs.length; i++) {
		        var ctOperate = ctOperateInputs[i].value;

		        var ctOperateInfo = {
					ctOperate: ctOperate,
		        };

		        ctOperateData.push(ctOperateInfo);
		    }
			
		    var ctInfoInputs = document.querySelectorAll('input[name="ctInfo"]');
		    var ctInfoData = [];
		    
		    for (var i = 0; i < ctInfoInputs.length; i++) {
		        var ctInfo = ctInfoInputs[i].value;

		        var ctInfoInfo = {
					ctInfo: ctInfo,
		        };

		        ctInfoData.push(ctInfoInfo);
		    }
		    
		    function check()
			{
				var fm = document.frm;	
		
				if(fm.ctName.value=="") {
					alert("센터 이름을 입력하세요");
					fm.ctName.focus();
					return;
				}
				if(fm.ctIntro.value=="") {
					alert("센터 소개를 입력하세요");
					fm.ctIntro.focus();
					return;
				}
			    var checkedCount = 0;

			    for (var i = 0; i < ctInfoInputs.length; i++) {
			        if (ctInfoInputs[i].checked) {
			            checkedCount++;
			        }
			    }

			    if (checkedCount === 0) {
			        alert("이용정보를 최소 한 개 이상 선택하세요.");
			        return;
			    }
				for (var i = 0; i < ctPriceInputs.length; i++) {
			        var ctPrice = ctPriceInputs[i].value;

			        if (ctPrice.trim() === "") {
			            alert("센터 이용 가격을 입력하세요.");
			            ctPriceInputs[i].focus();
			            return;
			        }
			    }
				for (var i = 0; i < ctOperateInputs.length; i++) {
			        var ctOperate = ctOperateInputs[i].value;

			        if (ctOperate.trim() === "") {
			            alert("센터 이용 시간을 입력하세요.");
			            ctOperateInputs[i].focus();
			            return;
			        }
			    }
				
				var files = document.getElementById("chooseFile").files;
					
				console.log(files);
				//debugger;
				if (files.length === 0) {
					alert("사진을 첨부해주세요");
					return;
				} 
		    
		    var files = document.getElementById("chooseFile").files;
		    console.log(JSON.stringify(ctPriceData));
			console.log(JSON.stringify(ctOperateData));
			console.log(JSON.stringify(ctInfoData));
			console.log(files);
			
		    var formData = new FormData();
		    formData.append('ctPriceData', JSON.stringify(ctPriceData));
		    formData.append('ctOperateData', JSON.stringify(ctOperateData));
		    formData.append('ctInfoData', JSON.stringify(ctInfoData));
		    
		    debugger;
		    
		fm.action = "<%=request.getContextPath()%>/centerInfoWriteAction";
		fm.method = "post";
		fm.enctype = "multipart/form-data";
		fm.submit();
		return;
	}
</script>

</html>