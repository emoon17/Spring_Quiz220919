<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
	
	<!-- datepicker 라이브러리 -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
				<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">팬션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">객실보기</a></li>
				<li class="nav-item"><a href="/lesson06/quiz03/add_booking_view" class="nav-link text-white font-weight-bold">예약하기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">커뮤니티</a></li>
			</ul>
		</nav>
		<sction>
			
		<h2 class="text-center font-weight-bold m-4">예약 하기</h2>
			<div class="d-flex justify-content-center">
				<div class="reservation-box">
					<div class="my-2 font-weight-bold">이름</div>
					<input type="text" class="form-control" id="name" name="name">
	
					<div class="my-2 font-weight-bold">예약날짜</div>
					<input type="text" class="form-control" id="date" name="date">
	
					<div class="my-2 font-weight-bold">숙박일수</div>
					<input type="text" class="form-control" id="day" name="day">
	
					<div class="my-2 font-weight-bold">숙박인원</div>
					<input type="text" class="form-control" id="headcount" name="headcount">
	
					<div class="my-2 font-weight-bold">전화번호</div>
					<input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
	
					<button type="button" id="reservationBtn"
						class="btn btn-warning w-100 mt-3 mb-3">예약하기</button>
				</div>
			</div>
			
		</sction>
	    <footer class="foot_text d-flex align-items-center pl-3 mt-3">
                <div>
                    제주특별자치도 제주시 애월읍<br>
                    사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목<br>
                    Copyright 2025 tongnamu. All right reserved.
                </div>
          </footer>

	
</div>

	<script>
		$(document).ready(function(){
			
			//datepicker
			$('#date').datepicker({
				dateFormat:"yy/MM/dd"
				, mindate:0 //오늘부터 그 뒤 선택
				, monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
				
			});
			// 현재날짜 디폴트
			$('#date').datepicker('setDate', 'today');
			
			
			//예약하기 버튼을 눌렀을 때
			$('#reservationBtn').on('click', function() {
				//validation
				let name = $('#name').val().trim();
				if (name == '') {
					alert("이름을 입력하세요.")
					return;
				}
				let date = $('#date').val().trim();
				if (date == '') {
					alert("날짜를 선택하세요.")
					return;
				}
				let day = $('#day').val().trim();
				if (day == '') {
					alert("숙박일수를 입력하세요.")
					return;
				}
				if (isNaN(day)){
					alert("숙박일수를 확인해주세요.")
					return;
				} 
				let headcount = $('#headcount').val().trim();
				if (headcount.length == '') {
					alert("숙박인원를 입력하세요.")
					return;
				}
				if (isNaN(headcount)){
					alert("숙박인원을 확인해주세요.")
					return;
				}
				let phoneNumber = $('#phoneNumber').val().trim();
				if (phoneNumber == '') {
					alert("핸드폰 번호를 입력하세요.")
					return;
				}
				
				
				//ajax
				$.ajax({
					
					//request
					type:"post"
					, url:"/lesson06/quiz03/add_booking"
					, data:{ "name":name, "date":date, "day":day,
						"headcount":headcount, "phoneNumber":phoneNumber}
				
					//response
					, success:function(data){
						if(data.result == "success") {
							alert("예약 되었습니다.");
							location.href="/lesson06/quiz03/booking_list_view";
						}
					}
					, error:function(e){
						alert("예약하는데 실패했습니다.");
					}
					
				});
			});
		});
	
	
	
	</script>

</body>
</html>