<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
	<div id="passwordWrap">
		
		<div class="passwordTitle">
			<h3>게시판</h3>
		</div>
		
		
		<c:forEach var="test" items="${boardContentList}">	

		<div class="passwordForm">
		<!-- 	<form action="#" method="post" id="update"> -->
				<input type="hidden" id="b_no" name="b_no" value="${test.b_no}">
				<input type="hidden" id="b_pw" name="b_pw" value="${test.b_pw}">
				<input type="hidden" id="b_views" name="b_views" value="${test.b_views}">
				<input type="hidden" id="u_grade" name="u_grade" value="${test.u_grade}">
			
				<div class="passwordBox">
					<div><h3>비밀번호를 입력하세요</h3></div> <br>
					<div><input type="password" name="input_b_pw" id="input_b_pw"></div> <br>
					<input type="button" value="확인" id="btn">
				</div>
		<!-- 	</form> -->
		</div>
		
		<div>
			<button onclick="location.href='/homepage2/viewBoardList'">취소</button>
		</div>
		
		</c:forEach>
		
	</div>
		
		
	<script>
		$(function(){
			$("#btn").on("click", function(){
				var b_no = $("#b_no").val();
				var b_pw = $("#b_pw").val();
				var b_views = $("#b_views").val();
				var u_grade = $("#u_grade").val();
					
				var res = $("#b_pw").val() == $("#input_b_pw").val();
					
				if(res){
						
					location.href = "/homepage2/viewBoardContent?b_no="+b_no+"&b_pw="+b_pw+"&b_views="+b_views+"&u_grade="+u_grade;
						
				}else{
					alert("비밀번호를 다시 확인해주세요.");
				}
			});
		});
	</script>


</body>
</html>