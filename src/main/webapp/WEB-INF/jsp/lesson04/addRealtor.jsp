<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 추가</title>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>공인중개사 추가</h1>
		<form method="post" action="/lesson04/quiz02/add_realtor">
			<div class="form-group">
				<div class="font-weight-bold">상호명</div>
				<input type="text" name="office" id="office" class="form-control col-6" placeholder="상호명을 입력하세요">
			</div>
			<div class="form-group">
				<div class="font-weight-bold">전화번호</div>
				<input type="text" name="phoneNumber" id="phoneNumber" class="form-control col-6" placeholder="010-1111-2222">
			</div>
			<div class="form-group">
				<div class="font-weight-bold">주소</div>
				<input type="text" name="address" id="address" class="form-control col-6" placeholder="주소를 입력하세요">
			</div>
			<div class="form-group">
				<div class="font-weight-bold">등급</div>
				<input type="text" name="grade" id="grade" class="form-control col-6" placeholder="등급을 입력하세요">
			</div>
			<button type="submit" vlaue="추가" class="btn btn-primary">추가</button>
		</form>
	</div>
</body>
</html>