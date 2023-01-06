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
					<td><button type="button" value="삭제" class="btn_delete btn btn-danger">삭제</button> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script>
		$(document).ready(function(){
			// 삭제 버튼을 눌렀을 때
			$('.btn_delete').on('click', function() {
				let btn_delete = document.querySelector(".btn_delete");
				btn_delete.onclick = (e)=>{
					e.preventDefault();
				}
				$.ajax({
					//request
					type:"post"
					, url:"/lesson06/quiz01/delete"
					, data:{"id":btn_delete}
					//response
					, success:function(data){
						location.href="lesson06/quiz01/after_add_favorite_view"
					}
					, error:function(e){
						alert("에러" + e);
					}
				})
			});
			
		});
	</script>
</body>
</html>