<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

	<div>
		<div id="review_write_modal" class="modal review_write_modal">
			<button class="modal_close">
				<span>&times;</span>
			</button>
			<div class="modal_dialog">
				<div class="modal_content">
					<div class="modal_body review_modal" style="margin-bottom: 0;">
						<input type="hidden" name="tnNo" value="${tio.tnNo}">
							<div>
								<h5 class="header_title">
									솔직한 후기를 남겨주세요!
									<span class="exit_button">&times;</span>
								</h5>
								<div class="review_wrap">
									<label class="review_title">
										후기 작성 요령
									</label>
								</div>
								<ul class="help">
									<li>
										• 해당 코치님에게 트레이닝을 받은 사진을 공유해주세요.<br>
									</li>
									<li>• 솔직한 평점을 선택해주세요.</li>
									<li>• 트레이닝에 대한 솔직한 후기를 공유해주세요.</li>
								</ul>
								<div class="flex_box review_rating">
									<label class="review_title">
										별점을 선택해주세요
									</label>
									<div>
										<select name="rvRate" style="color: #FFBB33;">
											<option value="5" style="color: #FFBB33;">★★★★★</option>
											<option value="4" style="color: #FFBB33;">★★★★☆</option>
											<option value="3" style="color: #FFBB33;">★★★☆☆</option>
											<option value="2" style="color: #FFBB33;">★★☆☆☆</option>
											<option value="1" style="color: #FFBB33;">★☆☆☆☆</option>
										</select>
									</div>
								</div>
								<div>
									<div class="flex_box review_wrap">
										<label class="review_title">
											사진을 첨부해주세요 (최대 3개)
										</label>
									</div>
	<!-- 								사진첨부시 위치 -->
									<div class="review_write_photo" style="margin-bottom: 15px;">
										<!-- 이미지 미리보기 -->
   										<div id="imagePreviewContainer" style="height: 300px; width: 376px;"></div>
									</div>
									<label for="review_filename">
										<div class="add_photo_button">+ 사진 추가하기</div>
									</label>
									<input type="file" class="files" id="review_filename" name="files" multiple="multiple" onchange="previewImages(this)" style="display: none">
								</div>
								<div style="margin: 24px 0;">
									<div class="review_wrap">
										<label class="review_title">
											내용을 작성해주세요
										</label>
									</div>
									<textarea rows="6" placeholder="내용을 입력해주세요" name="rvContent" maxlength="400"></textarea>
								</div>
								<div>
									<button class="review_write_action_button checked" onclick="check()">
										<span>리뷰 작성 완료</span>
									</button>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
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
	
	$(document).ready(function() {
	    $('.review_write_action_button').click(function() {
	        var tnNo = $('[name="tnNo"]').val();
	        var rvRate = $('[name="rvRate"]').val();
	        var rvContent = $('[name="rvContent"]').val();
	        
	        if (!rvRate) {
	            alert("별점을 선택해주세요.");
	            $('[name="rvRate"]').focus();
	            return;
	        }
	        
	        var rvContent = $('[name="rvContent"]').val();
	        if (!rvContent) {
	            alert("내용을 입력해주세요.");
	            $('[name="rvContent"]').focus();
	            return;
	        }
	        
	        var files = $('[name="files"]')[0].files;
	        
	        if (files.length > 4) {
	            alert("최대 3개까지 업로드 할 수 있습니다.");
	           	return;
	        }   
	        
	        var formData = new FormData();
	        formData.append('tnNo', tnNo);
	        formData.append('rvRate', rvRate);
	        formData.append('rvContent', rvContent);
	        
	     // 파일 필드에서 선택된 파일들을 formData에 추가
	        var files = $('[name="files"]')[0].files;
	        for (var i = 0; i < files.length; i++) {
	            formData.append('files', files[i]);
	        }
	        
	        var confirmation = confirm("정말 작성하시겠습니까?"); // 사용자에게 확인 다이얼로그를 표시합니다.

	        if (confirmation) { // 확인을 선택한 경우에만 작성 요청을 서버로 보냅니다.
	            $.ajax({
	                url: 'reviewWriteAction', // 컨트롤러의 URL
	                type: 'POST',
	                data: formData,
	                processData: false,
	                contentType: false,
	                success: function(response) {
	                    // 성공적으로 서버에서 응답을 받았을 때 처리할 내용
	                    console.log(response);
	                    window.location.reload(false);
	                },
	                error: function(xhr, status, error) {
	                    // 서버와의 통신에 실패했을 때 처리할 내용
	                    console.error(xhr.responseText);
	                }
	            });
	        }
	    });
	});

	
	</script>