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
	
	<div class="passwordWrap">
		
		<div class="passwordTitle">
			<h3>비밀번호 확인</h3>
		</div>
		
		
		<c:forEach var="test" items="${boardContentList}">	

		<div class="passwordForm">
				<input type="hidden" id="b_no" name="b_no" value="${test.b_no}">
				<input type="hidden" id="b_pw" name="b_pw" value="${test.b_pw}">
				<%-- <input type="hidden" id="b_views" name="b_views" value="${test.b_views}"> --%>
				<input type="hidden" id="u_grade" name="u_grade" value="${test.u_grade}">
			
				<div class="passwordBox">
					<div class="pwInput">
						<input type="password" name="input_b_pw" id="input_b_pw" placeholder="비밀번호를 입력하세요" autofocus="autofocus">
					</div> <br>
					<div class="pwBtns">
						<div class="pwBtn1"><input type="button" value="확인" id="btn" class="btn btn-primary btn-sm"></div>
						<div class="pwBtn2"><button onclick="location.href='/homepage2/viewBoardList'" class="btn btn-dark btn-sm">취소</button></div>
					</div>
				</div>
		</div>
		
		
		</c:forEach>
		
	</div>
		
		
	<script>
		$(function(){
			$("#btn").on("click", function(){
				var b_no = $("#b_no").val();
				var b_pw = $("#b_pw").val();
				/* var b_views = $("#b_views").val(); */
				var u_grade = $("#u_grade").val();
					
				var res = $("#b_pw").val() == $("#input_b_pw").val();
					
				if(res){
						
					location.href = "/homepage2/viewBoardContent?b_no="+b_no+"&b_pw="+b_pw+"&u_grade="+u_grade;
						
				}else{
					alert("비밀번호를 다시 확인해주세요.");
				}
			});
		});
	</script>


</body>
</html>