<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

	<div>
		<div id="center_find_modal" class="modal center_find_modal">
			<button class="modal_close">
				<span>&times;</span>
			</button>
			<div class="modal_dialog">
				<div class="modal_content">
					<div class="modal_body">
						<div>
							<h5 class="header_title">
								센터목록입니다.
								<span class="exit_button">&times;</span>
							</h5>
							<div style="margin: 24px 0;">
								<div id="center_list"></div>
							</div>
							<div>
								<button class="modal_button checked" onclick="backCenterInfo()">
									<span>돌아가기</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


<style>

.center_info {
	margin-bottom: 10px;
    border: 1px solid #0000003d;
	padding: 10px;
    border-radius: 7px;
    cursor: pointer;
}
.center_name{
	font-weight: bold;
}

</style>