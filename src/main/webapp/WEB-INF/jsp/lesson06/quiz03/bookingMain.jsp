<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- datepicker 라이브러리 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/css/lesson06/style.css">


</head>
<body>
	<div id="wrap" class="container">
		<header class="d-flex align-items-center justify-content-center">
			<div class="display-4">통나무 팬션</div>
		</header>
		<nav>
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#"
					class="nav-link text-white font-weight-bold">팬션소개</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link text-white font-weight-bold">객실보기</a></li>
				<li class="nav-item"><a
					href="/lesson06/quiz03/add_booking_view"
					class="nav-link text-white font-weight-bold">예약하기</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link text-white font-weight-bold">커뮤니티</a></li>
			</ul>
		</nav>
		<section>
			<img src="/img/lesson06/test06_banner1.jpg" id="bannerImg"
				alt="배너메인사진" width="100%" , height="100%">
		</section>
		<section class="check_box bg-warning d-flex">
			<section
				class="real-time-reserved d-flex col-4 justify-content-center align-items-center">
				<div class="text-center text-white display-4">
					실시간<br>예약하기
				</div>
			</section>
			<section class="confirm col-4">
				<div class="reserve-confirm text-white mt-3 ">예약확인</div>
				<!--회원일 때  -->
				<div id="memberInputBox">
					<div class="d-flex justify-content-end align-items-center m-3">
						<span class="subject text-white">이름</span> <input type="text"
							class="form-control input-form" id="name" name="name"
							placeholder="이름을 입력하세요">
					</div>
					<div class="d-flex justify-content-end align-items-center m-3">
						<span class="subject text-white">전화번호</span> <input
							type="password" class="form-control input-form" id="phoneNumber"
							name="phoneNumber" placeholder="전화번호를 입력하세요">
					</div>
					<div class="text-right mt-2 mr-4">
						<button type="button" class="submit-btn btn btn-success ">조회
							하기</button>
					</div>
				</div>
			</section>
			<section
				class="real-time-reserved d-flex col-4 justify-content-center align-items-center">
				<div class="text-center text-white display-4">
					예약문의:<br>010-<br>000-1111
				</div>
			</section>
		</section>
		</section>
		<footer class="foot_text d-flex align-items-center pl-3">
			<div>
				제주특별자치도 제주시 애월읍<br> 사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 /
				대표:김통목<br> Copyright 2025 tongnamu. All right reserved.
			</div>
		</footer>
	</div>
	<script>
	$(document).ready(function() {
		
		//datepicker
		$('#date').datepicker({
			dateFormat:"yy/MM/dd"
			, mindate:0
			, monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
			
		});
		
	// 배너

       let bannerSrcArr = ['/img/lesson06/test06_banner1.jpg', '/img/lesson06/test06_banner2.jpg', '/img/lesson06/test06_banner3.jpg', '/img/lesson06/test06_banner4.jpg'];
       let currentIndex = 0;
       setInterval(function() {
     	  $('#bannerImg').attr('src', bannerSrcArr[currentIndex]);
      		 currentIndex++;

     	 if (currentIndex > bannerSrcArr.length) { // 인덱스 값이 배열의 크기를 넘으면 0으로(처음 이미지) 세팅
     	 currentIndex = 0;
     	  }
      }, 3000);
	 
	// 예약 조회하기
		$('.submit-btn').on('click', function(){
			//alert("ㅇㅇ")

			//validation
			let name = $('#name').val().trim();
			if (id.length == ''){
				alert("이름을 입력하세요");
				return;
			}
			let phoneNumber = $('#phoneNumber').val().trim();
			if (phoneNumber.length ==''){
				alert("전화번호를 입력하세요");
				return;
			}
		
			//ajax
			
			//request
			type:"post"
			, url:"/lesson06/quiz03/check_booking"
			
			, data:{"name":name, "phoneNumber":phoneNumber}
			
			//response
			, success:function(data) {
				if (data.result == "success"){
					alert("이름" + $(bookingList.name)
							"날짜" + $(bookingList.date));
				}
			}
			, error:function(e){
				alert("오류 " + e);
			}
		});
	
	});
	</script>
</body>
</html>