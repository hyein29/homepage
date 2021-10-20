<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="userInfoWrap">
		
		<div class="userInfoTitle">
			<h3>회원정보수정</h3>
		</div>
		
		
		<c:forEach var="test" items="${userList}">
		
		<div class="updateUserInfoTable">
			
			<form action="/homepage2/updateUserInfo" method="post" class="updateUserInfoForm">
				<input type="hidden" name="u_no" value="${test.u_no}">
			
				<table>
					<tr>
						<td>아이디</td>
						<td>
							<input type="hidden" name="u_id" value="${test.u_id}" id="u_id">
							${test.u_id}
						</td>
					</tr>
					
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="u_pw" value="${test.u_pw}" id="u_pw"> </td>
					</tr>
					
					<tr>
						<td>이름</td>
						<td><input type="text" name="u_name" value="${test.u_name}"> </td>
					</tr>
					
					<tr>
						<td>생년월일</td>
						<td>
							<input type="text" name="u_birth1" value="${fn:substring(test.u_birth,0,4)}">년
							<input type="text" name="u_birth2" value="${fn:substring(test.u_birth,5,7)}">월
							<input type="text" name="u_birth3" value="${fn:substring(test.u_birth,8,10)}">일
						</td>
					</tr>
					
					<tr>
						<td>성별</td>
						<td>
							<c:if test="${test.u_gender eq 'm'}">
								<input type="radio" name="u_gender" value="m" checked="checked">남
								<input type="radio" name="u_gender" value="f">여
							</c:if>
							<c:if test="${test.u_gender eq 'f'}">
								<input type="radio" name="u_gender" value="m">남
								<input type="radio" name="u_gender" value="f" checked="checked">여
							</c:if>
						</td>
					</tr>
					
					<tr>
						<td>연락처</td>
						<td>
							<c:if test="${fn:substring(test.u_tel,0,3) eq '010'}">
								<select name="u_tel1">
									<option selected="selected">010</option>
									<option>011</option>
									<option>016</option>
								</select>-
							</c:if>
							
							<c:if test="${fn:substring(test.u_tel,0,3) eq '011'}">
								<select name="u_tel1">
									<option>010</option>
									<option selected="selected">011</option>
									<option>016</option>
								</select>-
							</c:if>
							
							<c:if test="${fn:substring(test.u_tel,0,3) eq '016'}">
								<select name="u_tel1">
									<option>010</option>
									<option>011</option>
									<option selected="selected">016</option>
								</select>-
							</c:if>
						
							<input type="text" name="u_tel2" required size="3px" value="${fn:substring(test.u_tel,4,8)}">-
							<input type="text" name="u_tel3" required size="3px" value="${fn:substring(test.u_tel,9,13)}">
						</td>
					</tr>
					
					<tr>
						<td>이메일</td>
						<td><input type="email" name="u_email" value="${test.u_email}"></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<input type="submit" value="수정완료">
							<!-- <input type="button" value="탈퇴하기" id="deleteBtn"> -->
							
						</td>
					</tr>
					
				</table>
			</form>
		
		</div>	
		
		</c:forEach>
		<button onclick="location.href='/homepage2/viewUserInfo'">뒤로가기</button>
		<button id="deleteBtn">탈퇴하기</button>
		
			
	</div>		
	
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$(function(){
		
		$("#deleteBtn").on("click", function(){
			/* var u_id = $("#u_id").val(); */
			var u_pw = prompt("비밀번호를 입력하세요");
			
			if(u_pw == $("#u_pw").val()){
				if(confirm("정말 탈퇴하시겠습니까?")){
					alert("탈퇴가 처리되었습니다.");
					location.href="/homepage2/deleteUser";
				}else{
					alert("취소되었습니다.");
				}
			}else if(u_pw == null){
				
			}else{
				alert("비밀번호가 일치하지 않습니다.");
			}
			
		})
		
		
	});
		


</script>



</body>
</html>