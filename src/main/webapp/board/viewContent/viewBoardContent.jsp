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
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


<c:set var="sessionId" value="${sessionScope.u_id}"/>
<c:set var="sessionGrade" value="${sessionScope.u_grade}"/>
<% pageContext.setAttribute("replaceChar", "\n"); %>



	<div id="boardContent">
		
		<!-- <div class="boardTitle">
			<h3>게시판</h3>
		</div> -->
		
			
		<div class="conTableDiv">
			
			<table class="conTable">
					
			<c:forEach var="boardContent" items="${boardContentList}">
				<input type="hidden" id="b_no" value="${boardContent.b_no}">
				<tr>
					<th class="conTitle">${boardContent.b_title}</th>
				</tr>
				
				<tr>
					<td>
						<div class="conTdWrap">
							<div class="conWriter"><b>작성자 </b>${boardContent.u_name}</div>
							<div class="conRegDate"><b>작성일 </b>
						
							<fmt:formatDate var="b_reg_date" value="${boardContent.b_reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate var="b_update_date" value="${boardContent.b_update_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
							
							<c:choose>
								<c:when test="${b_reg_date == b_update_date}">
									${b_reg_date}
								</c:when>
								
								<c:otherwise>
									${b_reg_date} (${b_update_date} 수정됨)
								</c:otherwise>
							</c:choose>
							</div>
						
						
							<div class="conViews"><b>조회수 </b>${boardContent.b_views}</div>
						</div>
					</td>
				</tr>
				
				<tr>
					
					<td>
						<div class="conCon">
							${fn:replace(boardContent.b_content, replaceChar, "<br/>")}
						</div>
					</td>
					
				</tr>
				
			</c:forEach>
			
			</table>
			
		</div>
		
		<c:forEach var="boardContent" items="${boardContentList}">
			<div class="conBtnsDiv">
			
			<c:choose>
				<c:when test="${sessionId == boardContent.u_id}">
					<div class="conBtns">
					<button onclick="location.href='/homepage2/viewBoardContent?b_no=${boardContent.b_no}&update=1'" class="btn btn-dark btn-sm">수정</button>
					<button id="deleteContentBtn" class="btn btn-dark btn-sm" style="margin-left: 5px;">삭제</button>
					<button onclick="location.href='/homepage2/viewBoardList'" class="btn btn-outline-dark btn-sm" style="margin-left: 5px;">뒤로가기</button>
					</div>
				</c:when>
				
				<c:otherwise>
					<c:choose>
						<c:when test="${sessionGrade eq 'admin'}">
							<div class="conBtns">
							<button id="deleteContentBtn" class="btn btn-dark btn-sm" style="margin-left: 5px;">삭제</button>
							<button onclick="location.href='/homepage2/viewBoardList'" class="btn btn-outline-dark btn-sm" style="margin-left: 5px;">뒤로가기</button>
							</div>
						</c:when>
						<c:otherwise>
							<div class="conBtns">
							<button onclick="location.href='/homepage2/viewBoardList'" class="btn btn-outline-dark btn-sm" style="margin-left: 5px;">뒤로가기</button>
							</div>
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