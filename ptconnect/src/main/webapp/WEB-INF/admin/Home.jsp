<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
	<!-- Link Swiper's CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
	<link href="./css/home.css" type="text/css" rel="stylesheet">

</head>

<body>
	<header class="header">
		<div class="header-logo">
			<h1 class="logo">
				<a class="svgLogo" href="./Home.jsp">
					<img src="./images/logo4.png" width="150" height="80" alt="메인화면으로 이동">
				</a>
			</h1>
		</div>
		<div class="menu">
			<ul class="depth1">
				<li>
					<a href="./Home.jsp">관광컨텐츠</a>
				</li>
				<li>
					<a href="./Home.jsp">자유게시판</a>
				</li>
				<li>
					<a href="./Home.jsp">로그인</a>
				</li>
				<li>
					<a href="./Home.jsp">마이페이지</a>
				</li>
				<li>
					<a href="./Home.jsp">공지사항</a>
				</li>
			</ul>
		</div>
		<span class="login">
			<a class="loginbutton" href="./member/memberLogin.jsp">
			<img src="./images/login.png">
			</a>
		</span>
	</header>


	<!-- Swiper -->
	<div class="swiper mySwiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide"><img src="${cv.firstimage2}" style="width:200px; height:150px"></div>
			<div class="swiper-slide">Slide 2</div>
			<div class="swiper-slide">Slide 3</div>
			<div class="swiper-slide">Slide 4</div>
			<div class="swiper-slide">Slide 5</div>
			<div class="swiper-slide">Slide 6</div>
			<div class="swiper-slide">Slide 7</div>
			<div class="swiper-slide">Slide 8</div>
			<div class="swiper-slide">Slide 9</div>
		</div>
		<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
  </div>
  
  <div class="main-search">
  	<div class="search-wrap">
  		<input type="text" id="title" placeholder="찾고싶은 '관광데이터'명을 입력하세요." title="찾고싶은 '관광데이터'명을 입력하세요.">
  		<button type="button">검색</button>
  	</div>
  </div>
  
  
  <!-- top3 탭 -->

	<div class="container">
		<ul class="tab">
			<li class="is_on">
			<a href="#tab1" class="btn">오늘의 top3</a>
			</li>
			<li>
			<a href="#tab2" class="btn">조회수 top3</a>
			</li>
			<li>
			<a href="#tab3" class="btn">별점 top3</a>
			</li>
		</ul>
		<div class="cont_area">
			<div class="cont" id="tab1">
				<div class="top_list">
					<ul>
						<li>오늘의 top1</li>
						<li>오늘의 top2</li>
						<li>오늘의 top3</li>
					</ul>
				</div>
			</div>
			<div class="cont" id="tab2">
				<div class="top_list">
					<ul>
						<li>조회수 top1</li>
						<li>조회수 top2</li>
						<li>조회수 top3</li>
					</ul>
				</div>
			</div>
			<div class="cont" id="tab3">
				<div class="top_list">
					<ul>
						<li>별점 top1</li>
						<li>별점 top2</li>
						<li>별점 top3</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	
	<button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
  


	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			spaceBetween: 30,
			centeredSlides: true,
			autoplay: {
				delay: 2500,
				disableOnInteraction: false,
			},
			pagination: {
				el: ".swiper-pagination",
				clickable: true,
			},
			navigation: {
				nextEl: ".swiper-button-next",
				prevEl: ".swiper-button-prev",
			},
		});
	</script>
	
	<!-- tab -->
		
	<script>
		//querySelector() name,id,class를 제한하지 않고 css선택자를 사용하여 요소를 찾는다.
		//querySelectorAll() 위와 동일하며 배열과 비슷한 객체인 nodeList를 반환 (for문 또는 forEach문 사용)
		const tabList = document.querySelectorAll('.container .tab li');
		const contents = document.querySelectorAll('.container .cont_area .cont')
		//첫 화면에서 tab1 contents를 띄움.
		contents[0].style.display = 'block';
		let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)
	
		for(var i = 0; i < tabList.length; i++){
			tabList[i].querySelector('.btn').addEventListener('click', function(e){
				e.preventDefault();
				for(var j = 0; j < tabList.length; j++){
					// 나머지 버튼 클래스 제거
					tabList[j].classList.remove('is_on');
					
					// 나머지 컨텐츠 display:none 처리
					contents[j].style.display = 'none';
				}
	
				// 버튼 클릭시 해당 버튼의 부모요소(li태그)에 is_on클래스를 준다.
				this.parentNode.classList.add('is_on');
	
				// 버튼 클릭시 컨텐츠 전환
				activeCont = this.getAttribute('href');
				document.querySelector(activeCont).style.display = 'block';
			});
		}
	</script>
->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
    var IMP = window.IMP; 
    IMP.init("imp61344517"); 	//가맹점 식별코드

    function requestPay() {
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid: creatOrderNum(), 
            name : '당근 10kg',
            amount : 1004,
            buyer_email : 'Iamport@chai.finance',
            buyer_name : '포트원 기술지원팀',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
            buyer_postcode : '123-456'
        }, function (rsp) { // callback
            console.log(rsp);
        });
    }
    
    function creatOrderNum(){
    	const date = new Date();
    	const year = date.getFullYear();
   		const month = String(date.getMonth()+1).padStart(2,"0");
   		const day = String(date.getDate()).padStart(2,"0");
   		
   		let orderNum = year + month + day;
   		for(i = 0; i < 10; i++){
   			orderNum += Math.floor(Math.random() * 8);
   		}
   		return orderNum;
    }
    </script>
    
    

</body>

</html>