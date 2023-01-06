<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>${title}</title>
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
	<h1>${title}</h1>
	<table class="table text-center">
		<thead>
			<tr>
				<th>No.</th>
				<th>이름</th>
				<th>주소</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="favorited" items="${favorite}" >
				<tr>
					<td>${favorited.id}</td>
					<td>${favorited.name}</td>
					<td>${favorited.url}</td>
					<%-- <input type="hidden" value="${favorited.id}"> 타입을 숨겨두고 싶을 때.--%>
						<!--1) name 속성 + value속성 삭제  -->
					<%-- <td><button type="button" value="${favorited.id}" name="delBtn" class="btn_delete btn btn-danger">삭제</button> </td> --%>
					
						<!--2) data를 이용해서 태그에 임시 저장하기  -->
					<td><button type="button" class="del_btn btn btn-danger" data-favorite-id="${favorited.id}">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script>
		$(document).ready(function(){
			// 삭제 버튼을 눌렀을 때
			<!--1) name 속성 + value속성 삭제  -->
			//$('button[name=delBtn]').on('click', function(e) { // e: 클릭 된 거에 정보를 가져올 수 있다.
				//value 가져오는 3가지 방법 - <!--1) name 속성 + value속성 삭제  -->
				//1번쨰 방식 :let id = $(this).val();
				//2번째 방식 : let id = $(this).attr('value'); //value라는 attr값 가져오는 것
				//3번째 방식 : let id = e.target.value; // target: 클릭된
			<!--2) data를 이용해서 태그에 임시 저장하기  -->
			 // 태그 : data-favorite-id     data- 뒤에 우리가 이름을 정한다.(대문자 절대 안됌.)
			 // 스크립트 : $(this).data('favorite-id');
			$('.del_btn').on('click', function(){
				let id = $(this).data('favorite-id');
				//alert(id);
				
			 	$.ajax({
					//request
					type:"delete"
					, url:"/lesson06/quiz01/delete"
					, data:{"id":id}
					//response
					, success:function(data){
						if (data.code == 1) {
							//성공
							//location.href="lesson06/quiz01/after_add_favorite_view" // 다시요청하는 거기 때문에 스크롤이 다시 맨위로 올라감
							document.location.reload(); // 스크롤이 위로 안 올라가고 보고 있는 화면에서 새로고침 -앞에 window나 document는 생략 가능
						} else if (data.code == 500){
							//에러 
							alert(data.error_messege);
						}
					}
					
					, error:function(e){
						alert("에러" + e);
					}
				});  
			
			});
			
			
			
			
		});
	</script>
</body>
</html>