<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/trainer.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/modal.css" type="text/css" rel="stylesheet">
<script src="https://kit.fontawesome.com/1f85e66bca.js" crossorigin="anonymous"></script>

</head>
<body>
	<div>
		<div>
			<div>
				<div> <!--헤더+맵-->
					<jsp:include page="../include/header.jsp"/>
					<section><!-- 섹션 -->
						<jsp:include page="../include/trainerHeader.jsp"/>
						<script>
							window.onload = function() {
								$('#trainer_tab2').addClass('active_tab');
							}
						</script>
						<div class="gray_background"><!-- 회색배경 -->
							<div class="my_container"><!-- 코치정보(마진오토) -->
								<div class="inner_contents row"><!-- 코치정보(패딩탑) -->
									<div class="left_bar"><!-- 코치정보 -->
										<form name="frm" accept-charset="utf-8">
											<div class="trainer_info">
												<div class="trainer_photo">
													<div class="trainer_content">
														<h4>
															사진
														</h4>
														<div class="notice_wrap t_notice">
															<ul>
																<li>코치님을 어필 할 수 있는 사진을 올려주세요.</li>
																<li>첫장이 대표사진(프로필)으로 설정됩니다.</li>
															</ul>
														</div>
														<div class="content_wrap">
															<!-- 이미지 미리보기 -->
   															<div id="imagePreviewContainer"></div>
															<!-- 사진 업로드 버튼 -->
															<div class="upload-btn">
																<label class="file-label" for="chooseFile">사진 선택</label>
																<input class="files" type="file" id="chooseFile" name="files" multiple="multiple" onchange="previewImages(this)" style="display: none">
															</div>
														</div>
													</div>
												</div>
												<div class="trainer_introduce">
													<div class="trainer_content">
														<h4>
															선생님 소개
														</h4>
														<div class="notice_wrap t_notice">
															<ul>
																<li>코치님과 코치님의 레슨 방식을 소개하세요.</li>
															</ul>
														</div>
														<div class="content_wrap">
															<div class="content_text">
																<textarea type="text" id="tnIntro" name="tnIntro" placeholder="소개글이 없어요."></textarea>
															</div>
														</div>
													</div>
												</div>
												<div class="trainer_lesson">
													<div class="trainer_content">
														<h4>
															1회 체험권
														</h4>
														<div class="notice_wrap t_notice">
															<ul>
																<li>코치님의 1회 체험권 가격을 알려주세요.</li>
															</ul>
														</div>
														<div class="content_wrap">
															<div style="position: absolute; top: 148px; right: 42px; font-size: 14px; color: rgb(147, 147, 147);">
																원
															</div>
															<input type="text" id="tnTicket" name="tnTicket" placeholder="1회 체험권 가격을 입력해 주세요.">
														</div>
													</div>
												</div>
												
												<div class="trainer_career">
													<div class="trainer_content">
														<h4>
															검증된 자격사항
														</h4>
														<div class="notice_wrap t_notice">
															<ul>
																<li>코치님의 자격증, 학력, 수상 경력 등을 보여주세요.</li>
															</ul>
														</div>
														<div class="content_wrap">
															<div class="upload-btn">
																<label class="qualify-label" for="qualify-button">자격 사항 추가</label>
																<input class="qualify-button" id="qualify-button" type="button" onclick="addQualification()">
															</div>
															<div id="qualify-container">
																<input type="text" id="qualify" name="qualify" placeholder="자격사항을 입력해 주세요.">
															</div>
														</div>
													</div>
												</div>
												
												<div class="trainer_program">
													<div class="trainer_content">
														<h4>
															프로그램
														</h4>
														<div class="notice_wrap t_notice">
															<ul>
																<li>트레이닝 분야 및 방법에 대해 자세히 적어주세요.</li>
																<li>자세한 프로그램 내용이 큰 신뢰를 줄 수 있습니다.</li>
															</ul>
														</div>
														<div class="content_wrap">
															<div class="upload-btn">
																<label class="program-label" for="program-button">프로그램 추가</label>
																<input class="program-button" id="program-button" type="button" onclick="addProgram()">
															</div>
															<div id="program-container">
																<textarea type="text" id="pgContent" name="pgContent" placeholder="pt프로그램을 작성해 주세요."></textarea>
															</div>
														</div>
													</div>
												</div>
												<div class="trainer_price">
													<div class="trainer_content">
														<h4>
															레슨 이용 가격
														</h4>
														<div class="notice_wrap t_notice">
															<ul>
																<li>코치님의 레슨 가격을 알려주세요.</li>
																<li>회원님들의 선택에 도움이 됩니다.</li>
															</ul>
														</div>
														<div class="content_wrap">
															
															<table class="compLabel table priceTable">
																<thead>
																	<tr>
																		<th scope="col">횟수 / 개월</th>
																		<th scope="col">단위</th>
																		<th scope="col">가격</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>
																			<input type="text" id="lpCount" placeholder="숫자만 입력" name="lpCount" maxlength="5" value="" style="text-align: center;">
																		</td>
																		<td rowspan=4>
																			<select id="lpCf" name="lpCf">
																				<option value="C">회</option>
																				<option value="T">개월</option>
																			</select>
																		</td>
																		<td style="position: relative;">
																			<div style="position: absolute; top: 24px; right: 20px; font-size: 14px; color: rgb(147, 147, 147);">
																				원
																			</div>
																			<input type="text" id="lessonPrice" placeholder="숫자만 입력" name="lessonPrice" maxlength="9" value="" style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<input type="text" id="lpCount" placeholder="숫자만 입력" name="lpCount" maxlength="5" value="" style="text-align: center;">
																		</td>
																		<td style="position: relative;">
																			<div style="position: absolute; top: 24px; right: 20px; font-size: 14px; color: rgb(147, 147, 147);">원
																			</div>
																			<input type="text" id="lessonPrice" placeholder="숫자만 입력" name="lessonPrice" maxlength="9" value="" style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<input type="text" id="lpCount" placeholder="숫자만 입력" name="lpCount" maxlength="5" value="" style="text-align: center;">
																		</td>
																		<td style="position: relative;">
																			<div style="position: absolute; top: 24px; right: 20px; font-size: 14px; color: rgb(147, 147, 147);">원
																			</div>
																			<input type="text" id="lessonPrice" placeholder="숫자만 입력" name="lessonPrice" maxlength="9" value="" style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<input type="text" id="lpCount" placeholder="숫자만 입력" name="lpCount" maxlength="5" value="" style="text-align: center;">
																		</td>
																		<td style="position: relative;">
																			<div style="position: absolute; top: 24px; right: 20px; font-size: 14px; color: rgb(147, 147, 147);">원
																			</div>
																			<input type="text" id="lessonPrice" placeholder="숫자만 입력" name="lessonPrice" maxlength="9" value="" style="text-align: right; padding-right: 36px;">
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
												<div class="search_wrap">
													<div class="user_input">
														<h4>활동하는 센터를 선택해주세요<span>*</span></h4>
														<div class="notice_wrap t_notice">
															<ul>
																<li>소속 센터를 선택해주세요! (센터승인 > 관리자승인 후 트레이너정보가 최종 등록됩니다!)</li>
															</ul>
														</div>
														<div class="center_search">
															<input type="text" name="ctName" id="center_name" placeholder="센터의 이름을 입력해주세요.">
															<input type="hidden" name="tnCtNo" id="center_no">
															<div class="search_btn" onclick="ctFound()">
																<i class="fa-solid fa-magnifying-glass"></i>
															</div>
														</div>
													</div>
												</div>
												<div class="trainer_pickup_line">
													<div class="trainer_content">
														<h4>
															한줄 인사말
														</h4>
														<div class="notice_wrap t_notice">
															<ul>
																<li>한줄로 코치님을 소개하세요. (프로필에 등록됩니다)</li>
															</ul>
														</div>
														<div class="content_wrap">
															<textarea type="text" id="tnOneLine" name="tnOneLine" placeholder="소개글이 없어요."></textarea>
														</div>
													</div>
												</div>
												<div class="trainer_notice_line">
													<div class="trainer_notice">
														<div class="notice_wrap">
															<ul>
																<li>트레이너등록은 아래와 같은 순서로 진행됩니다.</li>
																<li>트레이너등록 > 센터승인 > 관리자승인</li> 
																<li>모든 승인이 완료될 시 트레이너 목록에 등록됩니다.</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="content_modify">
													<span class="edit write">
														<i class="fa-solid fa-pencil"></i> 등록하기
													</span>
												</div>
											</div>
										</form>
									</div>
									<div class="right_bar"><!-- 코치프로필 -->
										<div class="trainer_profile">
											<div class="upside">
												<div>
													<div>
														<img class="trainer_round_image" src="${pageContext.request.contextPath}/resources/img/mainbanner2.png">
													</div>
													<div>
														<div class="trainer_name">${mo.mbName} 선생님</div>
														<div class="center_name">센터없음</div>
														<div class="pickup_line">"한줄소개를 등록하세요"</div>
														<div class="list_wrap">
															<div class="flex_box">
																<span class="left">자격검증</span><span class="right">자격사항을 등록하세요</span>
															</div>
															<div class="flex_box">
																<span class="left">전문분야</span><span class="right">프로그램을 추가하세요</span>
															</div>
															<div class="flex_box">
																<span class="left">대표가격</span><span class="right">가격정보를 등록하세요</span>
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
								</div>
							</div>
						</div>
					</section>
					<jsp:include page="../include/footer.jsp"/>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/centerFindModal.jsp"/>
	
	<script>
	
	    function addQualification() {
	        var container = document.getElementById("qualify-container");
	        var newInput = document.createElement("input");
	        newInput.type = "text";
	        newInput.id = "qualify";
	        newInput.name = "qualify";
	        newInput.placeholder = "자격사항을 입력해 주세요.";
	        newInput.style = "margin-top: 15px";
	
	        container.appendChild(newInput);
	    }
	    
	    function addProgram() {
	        var container = document.getElementById("program-container");
	        var newTextArea = document.createElement("textarea");
	        newTextArea.type = "text";
	        newTextArea.id = "pgContent";
	        newTextArea.name = "pgContent";
	        newTextArea.placeholder = "pt프로그램을 작성해 주세요.";
	        newTextArea.style = "margin-top: 15px";
	
	        container.appendChild(newTextArea);
	    }
	    
	</script>
	
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
		// 센터 검색 스크립트
		const exitButton = $('.exit_button');
		const modalColse = $('.modal_close');
		const centerName = document.getElementById("center_name");
		const centerNo = document.getElementById("center_no");
		const centerFindModal = document.getElementById("center_find_modal");
		const centerList = document.getElementById("center_list");
		function ctFound(){
		// 검색한 센터 목록 불러오는 ajax
			$.ajax({
					url: 'centerFind.ajax',
					type: 'GET',
					dataType: "json",
					data : {'ctName':centerName.value},
					success : function (data){
						if(data[0].value=='none'){
							alert("센터 이름을 입력해주세요.");
							return;
						}
						if(data[0].value == 0){
							alert("해당하는 센터가 존재하지 않습니다. 다시 확인해주세요.");
							return;
						}
						if(data[0].value > 0){
							console.log(data);
							let centerInfoHtml = '<div>';
							data.forEach(function(centerInfo){
								if(centerInfo.ctName===undefined){
									return;
								}
								centerInfoHtml+='<div class="center_info" onclick="centerSelect('+centerInfo.ctNo+')">';
								centerInfoHtml+='<span class="center_name" id="ctName('+centerInfo.ctNo+')">'+centerInfo.ctName+'</span>';
								centerInfoHtml+='<br><span class="center_addr">'+centerInfo.ctAddr+'</span></div>';
							});
							centerInfoHtml += '</div>';
							centerFindModal.style.display='flex';		
							centerList.innerHTML=centerInfoHtml;					
						}
					},
					error: function (err){
				 		centerList.style.color='red';
				 		centerList.textContent='통신연결 실패';
					}
				});
		}
		// 센터를 선택하는 메소드
		function centerSelect(ctNo){
			let selectedCenterName = document.getElementById('ctName('+ctNo+')').textContent;
	//	 	console.log(ctNo);
	//	 	console.log(selectedCenterName);
			centerName.value = selectedCenterName;
			centerNo.value = ctNo;
			centerFindModal.style.display='none';
			
		}
		
		window.onclick = function(e){
	//	 	console.log('pwd_check_modal : ' + e.target.classList.contains('pwd_check_modal'));
			
			if(e.target.classList.contains('center_find_modal')){
				centerFindModal.style.display='none';
			}
			
		}
	
		exitButton.click(function() {
			centerFindModal.style.display='none';
		});
	
		modalColse.click(function() {
			centerFindModal.style.display='none';
		});
		
	</script>
	
	<script>
	
		document.addEventListener("DOMContentLoaded", function () {
			
	        var editButtons = document.querySelectorAll(".edit");
	        editButtons.forEach(function(button) {
                button.addEventListener("click", check);
            });
	    });
		
			// lessonprice
		    var lessonPrices = document.querySelectorAll('input[name="lessonPrice"]');
		    var lpCountValues = document.querySelectorAll('input[name="lpCount"]');
		    var lpCfValues = document.querySelectorAll('select[name="lpCf"]');
		    
		    var lessonPriceData = [];

		    for (var i = 0; i < lessonPrices.length; i++) {
		        var lpCount = lpCountValues[i].value;
		        var lpCf = lpCfValues.value;
		        var lessonPrice = lessonPrices[i].value;

		        var priceInfo = {
		            lpCount: lpCount,
		            lpCf: lpCf,
		            lessonPrice: lessonPrice
		        };

		        lessonPriceData.push(priceInfo);
		    }

		    // qualify
		    var qualifyInputs = document.querySelectorAll('input[name="qualify"]');
		    var qualifyData = [];
		    
		    for (var i = 0; i < qualifyInputs.length; i++) {
		        var qualify = qualifyInputs[i].value;

		        var qualifyInfo = {
		        	qualify: qualify,
		        };

		        qualifyData.push(qualifyInfo);
		    }

		    // program
		    var programInputs = document.querySelectorAll('textarea[name="pgContent"]');
		    var programData = [];
			
		    for (var i = 0; i < programInputs.length; i++) {
		        var program = programInputs[i].value;

		        var programInfo = {
		        	program: program,
		        };

		        programData.push(programInfo);
		    }
		    
		    function check()
			{
				var fm = document.frm;	
		
				if(fm.tnIntro.value=="") {
					alert("소개를 입력하세요");
					fm.tnIntro.focus();
					return;
				}
				if(fm.tnTicket.value=="") {
					alert("1회 체험권 가격을 입력하세요");
					fm.tnTicket.focus();
					return;
				}
				for (var i = 0; i < qualifyInputs.length; i++) {
			        var qualify = qualifyInputs[i].value;

			        if (qualify.trim() === "") {
			            alert("자격사항을 입력하세요.");
			            qualifyInputs[i].focus();
			            return;
			        }
			    }
				for (var i = 0; i < programInputs.length; i++) {
			        var program = programInputs[i].value;

			        if (program.trim() === "") {
			            alert("프로그램 내용을 입력하세요.");
			            programInputs[i].focus();
			            return;
			        }
			    }
				if(fm.tnOneLine.value=="") {
					alert("한 줄 소개를 입력하세요");
					fm.tnOneLine.focus();
					return;
				}
				var files = document.getElementById("chooseFile").files;
					
				console.log(files);
				//debugger;
				if (files.length === 0) {
					alert("사진을 첨부해주세요");
					return;
				}
				if(fm.tnCtNo.value==""){
		    		alert("센터를 선택해주세요.");
		    		fm.ctName.focus();
		    		return;
		    	}
		    
		    var files = document.getElementById("chooseFile").files;
		    console.log(JSON.stringify(lessonPriceData));
			console.log(JSON.stringify(qualifyData));
			console.log(JSON.stringify(programData));
			console.log(files);
			
		    var formData = new FormData();
		    formData.append('lessonPriceData', JSON.stringify(lessonPriceData));
		    formData.append('qualifyData', JSON.stringify(qualifyData));
		    formData.append('programData', JSON.stringify(programData));
		    
		    if(confirm("정말 등록하시겠습니까?")) {
				fm.action = "<%=request.getContextPath()%>/trainerInfoWriteAction";	
				fm.method = "post";					
				fm.enctype="multipart/form-data";
				fm.submit();						
				return;
		    }else{
		    	alert("취소하였습니다.");
		    	return;
		    }
		}
	
	</script>
	
	
</body>
</html>