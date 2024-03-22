const reviewModal = $('.review_write_modal');
const exitButton = $('.exit_button');
const modalColse = $('.modal_close');
// 리뷰 작성하기 버튼
$('.review_write_button').click(function(){
//	if($('.review_button_expand_wrap').css('opacity')==1){
//		$('.review_button_expand_wrap').css('opacity',0);
//	}else{
//		$('.review_button_expand_wrap').css('opacity',1);
//	}
	reviewModal.css('display','flex');
	
//	console.log('review_write_button');
});

exitButton.click(function() {
	reviewModal.css('display','none');
});

modalColse.click(function() {
	reviewModal.css('display','none');
});
