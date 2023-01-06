<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
	
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
				<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">예약안내</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">커뮤니티</a></li>
			</ul>
		</nav>
		<section class="contents bg-success">
			<div class="img_box">
				<img src="/img/lesson06/test06_banner1.jpg" alt="배너 이미지" width="100%" height="100%">
			</div>
			<section class="check_box bg-warning d-flex">
				<section class="real-time-reserved d-flex col-4 justify-content-center align-items-center">
					<div class="text-center text-white display-4">실시간<br>예약하기</div>
				</section>
				<section class="confirm col-4">
					<div class="m-2">
						<span class="reserve-confirm text-white mr-2">예약확인</span>
						<label for="member" class="text-white">회원</label>
						<input type="radio" id="member" name="member" value="member" checked="checked" class="mr-2">
						<label for="nonmember" class="text-white">비 회원</label>
						<input type="radio" id="nonmember" name="nonmember" value="nonmember">
					</div>
					<div id="memberInputBox">
						<div class="d-flex justify-content-end align-items-center m-3">
							<span class="subject text-white">이름</span>
							<input type="text" class="form-control input-form" id="name" name="name" placeholder="이름을 입력하세요">
						</div>
						<div class="d-flex justify-content-end align-items-center m-3">
							<span class="subject text-white">아이디</span>
							<input type="text" class="form-control input-form" id="id" name="id" placeholder="아이디를 입력하세요">
						</div>
						<div class="d-flex justify-content-end align-items-center m-3">
							<span class="subject text-white">비밀번호</span>
							<input type="password" class="form-control input-form" id="password" name="password" placeholder="비밀번호를 입력하세요">
						</div>
						<div class="text-right mt-2 mr-4">
	                    	<button type="button" class="btn btn-success submit-btn">조회 하기</button>
	                    </div>
					</div>
				</section>
				<section class="real-time-reserved d-flex col-4 justify-content-center align-items-center">
					<div class="text-center text-white display-4">예약문의:<br>010-<br>000-1111</div>
				</section>
			</section>
		</section>
		 <footer class="foot_text d-flex align-items-center pl-3">
                <div>
                    제주특별자치도 제주시 애월읍<br>
                    사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목<br>
                    Copyright 2025 tongnamu. All right reserved.
                </div>
          </footer>
	</div>
</body>
</html>