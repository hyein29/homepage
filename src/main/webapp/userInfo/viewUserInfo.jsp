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

	<div class="userInfoWrap">
		
		<div class="userInfoTitle">
			<h3>마이페이지</h3>
		</div>
		
		
		<c:forEach var="test" items="${userList}">
		
		<div class="userInfoTable">
			
			<input type="hidden" id="u_id" value="${test.u_id}">
			<input type="hidden" id="u_pw" value="${test.u_pw}">
			
			<table>
				<tr>
					<td>안녕하세요. <b><c:out value="${test.u_name}"/>(<c:out value="${test.u_id}"/></b>)회원님</td>
					<%-- <td><button onclick="location.href='/homepage2/userInfo/updateUserInfoPage.jsp?u_id=${test.u_id}'">정보수정</button></td> --%>
 					<%-- <td><button onclick="location.href='/homepage2/viewUserInfo?u_id=${test.u_id}&modify=1'">정보수정</button></td> --%>
 					<td><button id="updateUserInfoBtn">정보수정</button></td>
				</tr>
				
				<tr>
					<td colspan="2"><c:out value="${test.u_id}"/>님은 [<c:out value="${test.u_grade}"/>]회원입니다.</td>
				</tr>
			
			
			</table>
			
		</div>	
		
		</c:forEach>	
			
	</div>		

<script>
	$(function(){
	
		
		$("#updateUserInfoBtn").click(function(){
			
			var u_id = $("#u_id").val();
			var u_pw = prompt("비밀번호를 입력하세요.");
			
			if(u_pw == $("#u_pw").val()){
				
				location.href="/homepage2/viewUserInfo?u_id="+u_id+"&modify=1";

			}else if(u_pw == null){
				
			}else{
				alert("비밀번호가 일치하지 않습니다.");
			}
			
		})
		
		
		
		
		
		
		
	});

</script>



</body>
</html>