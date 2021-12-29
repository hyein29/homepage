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
		
		<div class="updateFormTitle">
			<h3>게시물 수정</h3>
		</div>
		
		
		<c:forEach var="test" items="${boardContentList}">
		
		<div class="updateForm">
			
			<form action="/homepage2/updateBoardContent" method="post" onsubmit="return confirm('게시물을 수정하시겠습니까?');">
		
				<input type="hidden" name="b_no" value="${test.b_no}">
				<%-- <input type="hidden" name="b_views" value="${test.b_views}"> --%>
		
				<table class="updateTable">
				
					<tr>
						<td class="updateTitle"><input type="text" name="b_title" value="${test.b_title}"  size="130px;" style="height: 30px;" autocomplete="off"></td>
					</tr>
					
					<tr>
						<%-- <td>작성자</td>
						<td><input type="hidden" name="b_writer" value="${test.u_name}">
							${test.u_name}
						</td> --%>
						
						<td class="updateWriter">
							<div class="updateWriterDiv">
								<div>
									<b>작성자 </b>
									<span><input type="hidden" name="b_writer" value="${test.u_name}">${test.u_name}</span>
								</div>
							</div>
						</td>
					</tr>
					
					<tr>
						<c:if test="${test.b_pw != null}">
							<td class="updatePassword">
								<div>						
									<div class="pwCheck">
										<div>
											<label>비밀글 <input type="checkbox" name="checkbox" value="1" checked="checked"></label>
											<input type="password" name="b_pw" value="${test.b_pw}" style="margin-left: 5px;">
										</div>
									</div>
								</div>
								<%-- <label>비밀글<input type="checkbox" name="checkbox" value="1" checked="checked"></label>
								<input type="password" name="b_pw" value="${test.b_pw}"> --%>
							</td>
						</c:if>
						<c:if test="${test.b_pw == null}">
							<td class="updatePassword">
								<div>						
									<div class="pwCheck">
										<div>
											<label>비밀글<input type="checkbox" name="checkbox" value="1"></label>
											<input type="password" name="b_pw" placeholder="숫자네자리">
										</div>
									</div>
								</div>
							
								<!-- <label>비밀글<input type="checkbox" name="checkbox" value="1"></label>
								<input type="password" name="b_pw" placeholder="숫자네자리"> -->
							</td>
						</c:if>
					</tr>
					
					<tr>
						<td><textarea rows="15" cols="132" name="b_content">${test.b_content}</textarea></td>
					</tr>
					
					<!-- <tr>
						<td><input type="submit" value="수정완료"></td>
					</tr> -->
					
					<tr>
						<td class="updateBtns">
						<div class="updateBtnsDiv">
							<div class="updateSubmitBtn">
								<input type="submit" value="수정완료" class="btn btn-dark btn-sm">
							</div>
							<div class="updateCancelBtn">
								<input type="button" value="작성취소" onclick="location.href='/homepage2/viewBoardContent?b_no=${test.b_no}'" class="btn btn-outline-dark btn-sm">
							</div>
						</div>
						</td>
						
					</tr>
					
				</table>
			
			</form>
			<%-- <button onclick="location.href='/homepage2/viewBoardContent?b_no=${test.b_no}&b_views=${test.b_views}'">작성취소</button> --%>
		
		</div>
		</c:forEach>
		
	</div>	
	
	
	

</body>
</html>