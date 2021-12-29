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
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


	<div class="insertWrap">
		
		<div class="insertFormTitle">
			<h3>게시물 작성</h3>
		</div>
		
		<c:forEach var="test" items="${userList}">
		
		<div class="insertForm">
		
			<form action="/homepage2/insertBoardContent" method="post" onsubmit="return confirm('게시물을 등록하시겠습니까?');">
				
				<table class="insertTable">
					
					<tr>
						<td class="insertTitle"><input type="text" name="b_title" placeholder=" 제목을 입력하세요." size="130px;" style="height: 30px;" autocomplete="off" autofocus="autofocus"></td>
					</tr>
					
					<tr>
						<td class="insertWriter">
							<div class="insertWriterDiv">
								<div>
									<b>작성자 </b>
									<span><input type="hidden" name="b_writer" value="${test.u_name}">${test.u_name}</span>
								</div>
							</div>
						</td>
					</tr>
					
					<tr>
						<td class="insertPassword">	
							<div>						
								<div class="pwCheck">
									<div>
										<label>비밀글 <input type="checkbox" name="checkbox" value="1"></label>
									
										<input type="password" name="b_pw" placeholder="숫자네자리" style="margin-left: 5px;">
									</div>
								</div>	
							
							</div>
						</td>
					</tr>
					
					<tr>
						<td><textarea rows="15" cols="132" name="b_content"></textarea></td>
					</tr>
					
				
					
					<tr>
						<td class="insertBtns">
						<div class="insertBtnsDiv">
							<div class="insertSubmitBtn">
								<input type="submit" value="작성완료" class="btn btn-dark btn-sm completed">
							</div>
							<div class="insertCancelBtn">
								<input type="button" value="작성취소" onclick="location.href='/homepage2/viewBoardList'" class="btn btn-outline-dark btn-sm">
							</div>
						</div>
						</td>
						
					</tr>
					
				</table>
				
			
			</form>
			
		
		</div>
		
		</c:forEach>
		
	</div>	
	
<script>

</script>	

</body>
</html>