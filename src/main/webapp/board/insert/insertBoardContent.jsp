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

	<div class="insertWrap">
		
		<div class="insertTitle">
			<h3>게시물 작성</h3>
		</div>
		
		
		
		<div class="insertForm">
		
			<form action="/homepage2/insertBoardContent" method="get">
				
				<c:forEach var="test" items="${userList}">
				
				
				<table>
				
					<tr>
						<td>제목</td>
						<td><input type="text" name="b_title"></td>
					</tr>
					
					<tr>
						<td>작성자</td>
						<td>
							<input type="hidden" name="b_writer" value="${test.u_name}">
							${test.u_name}
						</td>
					</tr>
					
					<tr>
						<td>암호</td>
						<td>
							<label>비밀글<input type="checkbox" name="checkbox" value="1"></label>
							<input type="password" name="b_pw" placeholder="숫자네자리">
						</td>
					</tr>
					
					<tr>
						<td colspan="2"><textarea rows="5" cols="30" name="b_content"></textarea></td>
					</tr>
					
					
					<tr>
						<td colspan="2"><input type="submit" value="작성완료"></td>
					</tr>
					
				</table>
				
				</c:forEach>
			
			</form>
			
			<button onclick="location.href='/homepage2/viewBoardList'">작성취소</button>
		
		</div>
		
		
		
	</div>	
	
	

</body>
</html>