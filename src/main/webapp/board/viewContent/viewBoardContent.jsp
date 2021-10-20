<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="sessionId" value="${sessionScope.u_id}"/>
<c:set var="sessionGrade" value="${sessionScope.u_grade}"/>
<% pageContext.setAttribute("replaceChar", "\n"); %>



	<div id="boardContent">
		
		<div class="boardTitle">
			<h3>게시판</h3>
		</div>
		
			
		<div class="conTable">
			
			<table>
					
			<c:forEach var="test" items="${boardContentList}">
				<input type="hidden" id="b_no" value="${test.b_no}">
				<tr>
					<th class="conTitle" colspan="3"><h3>${test.b_title}</h3></th>
				</tr>
				
				<tr>
					<td>작성자: ${test.u_name}</td>
					<td>작성일: 
						<fmt:formatDate var="b_reg_date" value="${test.b_reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
						${b_reg_date}
					</td>
					
					
					<td>조회수: ${test.b_views}</td>
				</tr>
				
				<tr>
					
					<td colspan="3">
						<div class="conCon">
							${fn:replace(test.b_content, replaceChar, "<br/>")}
						</div>
					</td>
					
				</tr>
				
			</c:forEach>
			
			</table>
			
		</div>
		
		<c:forEach var="test" items="${boardContentList}">
			<div>
			
			<c:choose>
				<c:when test="${sessionId == test.u_id}">
					<%-- <button onclick="location.href='../update/updatePage.jsp?b_no=${test.b_no}'">수정</button> --%>
					<%-- <button onclick="location.href='/homepage2/viewBoardContent?b_no=${test.b_no}&b_views=${test.b_views}&update=1'">수정</button> --%>
					<button onclick="location.href='/homepage2/viewBoardContent?b_no=${test.b_no}&update=1'">수정</button>
					<button id="deleteContentBtn">삭제</button>
					<button onclick="location.href='/homepage2/viewBoardList'">뒤로가기</button>
				</c:when>
				
				<c:otherwise>
					<c:choose>
						<c:when test="${sessionGrade eq 'admin'}">
							<button id="deleteContentBtn">삭제</button>
							<button onclick="location.href='/homepage2/viewBoardList'">뒤로가기</button>
						</c:when>
						<c:otherwise>
							<button onclick="location.href='/homepage2/viewBoardList'">뒤로가기</button>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			 	
			</div>
		</c:forEach>
			
		
	</div>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$(function(){
		
		$("#deleteContentBtn").on("click", function(){
			var b_no = $("#b_no").val();
			
			
			if(confirm("정말 삭제하시겠습니까?")){
				alert("게시물이 삭제되었습니다.");
				location.href="/homepage2/deleteBoardContent?b_no="+b_no;
			}else{
				alert("취소되었습니다.");
			}
		
			
		})
		
	
		
	});
		


</script>
	
	
	

</body>
</html>