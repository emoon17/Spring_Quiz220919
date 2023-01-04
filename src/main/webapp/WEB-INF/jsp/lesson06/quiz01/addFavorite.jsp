<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>
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
</head>
<body>
	<h1>즐겨 찾기 추가하기</h1>
	<label for="name"><b>제목</b></label>
	<input type="text" id="name" name="name" class="form-control mb-2">
	<label for="url"><b>주소</b></label>
	<input type="text" id="url" name="url" class="form-control mb-3" >
	<button type="button" id="flus" class="btn btn-success form-control" value="추가">추가</button>

	<script>
		 $(document).ready(function() {
			
			$('#flus').on('click', function() { 
				//validation
				let name = $('#name').val().trim();
				if (name.length == '') {
					alert("제목을 입력하세요.");
					return;
				}
				let url = $('#url').val().trim();
				if (url.length == ''){
					alert("주소를 입력하세요")
					return;
				}
				
				 if (!url.startsWith("http")){
					alert("프로토콜이 빠졌습니다.")
					return;
				} 
				$.ajax({
					//Request
					type:"POST"
					, url:"/lesson06/quiz01/add_favorite"
					, data:{"name":name, "url":url}
				
					//Response
					, success:function(data) { // request 성공하면 실행
						alert("입력완료");
						//화면이동
					location.href = "/lesson06/quiz01/after_add_favorite_view";  //-view로 이동해야 됌
					}
					, error:function(e) {
						alert("에러" + e);
					
					}
					
				}); 
			});
			
		});
	</script>

</body>
</html>