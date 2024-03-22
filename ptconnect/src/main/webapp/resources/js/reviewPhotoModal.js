
	/* 모달 팝업 스크립트 */
	const modal2 = $('#modal_wrap');
	const closeBtn2 = $('#close_btn');
	//모달 영역 밖 클릭 시 모달 닫음
	window.onclick = function(e){
		console.log(e.target);
		if(e.target.classList.contains('modal_wrap')){
			modal.css('display','none');
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
		var photoBox = [{'value':'mainbanner1.png'},{'value':'mainbanner2.png'},{'value':'mainbanner3.png'}];
		
		$(document).on("click",".photo_wrap", function(){
//	 		alert('클릭');
			$('.swiper-wrapper').html('');
			var str = '';
			$.each(photoBox,function(){
				console.log(this.value);
				str += '<div class="swiper-slide">';
				str += '<img class="modal_photo" src="../../source/img/'+this.value+'">';
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
		             return '<img class="'+className+'" src="../../source/img/'+photoBox[index].value+'">'
				}
			},
			navigation: {
				nextEl: ".swiper-button-next",
				prevEl: ".swiper-button-prev",
			},
		});	
	});