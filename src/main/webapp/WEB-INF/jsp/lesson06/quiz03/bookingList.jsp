<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록 보기</title>
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
		<section>
			<div class="table-text text-center font-weight-bold mt-3">예약 목록 보기</div>
			<table class="table text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="booking" items="${bookingList}">
					<tr>
						<td>${booking.name}</td>
						<td id="bookingDate"><fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 d일" /> </td>
						<td>${booking.day}</td>
						<td>${booking.headcount}</td>
						<td>${booking.phoneNumber}</td>
						<td>
							<c:choose>
								<c:when test="${booking.state eq '대기중'}">
									<span class="text-info">${booking.state}</span>
								</c:when>
								<c:when test="${booking.state eq '확정'}">
									<span class="text-success">${booking.state}</span>
								</c:when>
								<c:when test="${booking.state eq '취소'}">
									<span class="text-danger">${booking.state}</span>
								</c:when>
							</c:choose>
						</td>
						<td><button type="button" value="삭제하기" class="del_btn btn btn-danger" data-booking-id="${booking.id}" >삭제</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>		
		</section>
		 <footer class="foot_text d-flex align-items-center pl-3">
                <div>
                    제주특별자치도 제주시 애월읍<br>
                    사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목<br>
                    Copyright 2025 tongnamu. All right reserved.
                </div>
          </footer>
	</div>
	<script>
	$(document).ready(function() {
		
		//삭제 버튼을 눌렀을 때
		$('.del_btn').on('click', function() {
			let id = $(this).data('booking-id');
			//alert(id);
			
			//ajax
			$.ajax({
				//request
				type:"delete"
				, url:"/lesson06/quiz03/delete_booking"
				, data:{"id":id}
				//response
				, success:function(data){
					if (data.code == 1) {
						//새로고침
						//alert("d");
						document.location.reload(true);
					} else if(data.code == 500){
						alert("삭제할 데이터가 없습니다.");
					}
				}
				, error:function(e) {
					alert("삭제하는데 통신하는데 실패했습니다." + e);
				}
			});
		});
		
	});
	</script>
</body>
</html>