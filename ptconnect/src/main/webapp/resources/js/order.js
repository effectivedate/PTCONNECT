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
	
//	console.log('order_button');
});

exitButton2.click(function() {
	orderModal.css('display','none');
});

modalColse2.click(function() {
	orderModal.css('display','none');
});

window.onclick = function(e){
		if(!e.target.classList.contains("modal_body")){
			document.querySelector(".modal_body").style.display = "none";
		}
	}
