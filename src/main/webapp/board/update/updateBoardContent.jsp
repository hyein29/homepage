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

<c:set var="sessionId" value="${sessionScope.u_id}"/>
<c:set var="sessionGrade" value="${sessionScope.u_grade}"/>


	<div class="updateWrap">
		
		<div class="updateTitle">
			<h3>게시물 수정</h3>
		</div>
		
		
		<c:forEach var="test" items="${boardContentList}">
		<div class="updateForm">
			
			<form action="/homepage2/updateBoardContent" method="get">
		
				<input type="hidden" name="b_no" value="${test.b_no}">
				<input type="hidden" name="b_views" value="${test.b_views}">
		
				<table>
				
					<tr>
						<td>제목</td>
						<td><input type="text" name="b_title" value="${test.b_title}"></td>
					</tr>
					
					<tr>
						<td>작성자</td>
						<td><input type="hidden" name="b_writer" value="${test.u_name}">
							${test.u_name}
						</td>
						
					</tr>
					
					<tr>
						<td>암호</td>
						<c:if test="${test.b_pw != null}">
							<td>
								<label>비밀글<input type="checkbox" name="checkbox" value="1" checked="checked"></label>
								<input type="password" name="b_pw" value="${test.b_pw}">
							</td>
						</c:if>
						<c:if test="${test.b_pw == null}">
							<td>
								<label>비밀글<input type="checkbox" name="checkbox" value="1"></label>
								<input type="password" name="b_pw" placeholder="숫자네자리">
							</td>
						</c:if>
					</tr>
					
					<tr>
						<td colspan="2">
							<textarea rows="5" cols="30" name="b_content">${test.b_content}</textarea>
						</td>
					</tr>
					
					<tr>
						<td colspan="2"><input type="submit" value="수정완료"></td>
					</tr>
					
				</table>
			
			</form>
			<button onclick="location.href='/homepage2/viewBoardContent?b_no=${test.b_no}&b_views=${test.b_views}'">작성취소</button>
		
		</div>
		</c:forEach>
		
	</div>	
	
	
	

</body>
</html>