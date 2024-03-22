
	/* 모달 팝업 스크립트 */
	const modal = $('#modal_wrap');
	const closeBtn = $('#close_btn');
	//모달 영역 밖 클릭 시 모달 닫음
	window.onclick = function(e){
		if(e.target.classList.contains('modal_wrap')){
			modal.css('display','none');
		}
	}

	//X버튼 클릭 시 모달 닫음
	closeBtn.click(function() {
		modal.css('display','none');
	});

	
	$(document).ready(function(){
		var photoBox = [{'value':'center1.jpg'},{'value':'center2.jpg'},{'value':'center3.jpg'},{'value':'center4.jpg'},{'value':'fitness1.jpg'},{'value':'fitness2.jpg'},{'value':'fitness3.jpg'},{'value':'fitness4.jpg'},{'value':'img_640x640.jpg'}];
		
		$(document).on("click",".popup_btn", function(){
//	 		alert('클릭');
			$('.swiper-wrapper').html('');
			var str = '';
			$.each(photoBox,function(){
				console.log(this.value);
				str += '<div class="swiper-slide">';
				str += '<img class="modal_photo" src="../img/'+this.value+'">';
				str += '</div>';
			});
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
				clickable: true,
				bulletClass:"custom_bullet",
				bulletActiveClass:"swiper-pagination-custom-bullet-active",
				renderBullet: function (index, className) {
		             return '<img class="'+className+'" src="../img/'+photoBox[index].value+'">'
				}
			},
			navigation: {
				nextEl: ".swiper-button-next",
				prevEl: ".swiper-button-prev",
			},
		});	
	});