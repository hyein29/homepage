<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="sessionId" value="${sessionScope.u_id}"/>
<c:set var="sessionGrade" value="${sessionScope.u_grade}"/>
<%-- ${sessionGrade} --%>

<c:if test="${sessionId == null}">
	<c:set var="sessionId" value="null"></c:set>
</c:if>

	<c:forEach var="content" items="${boardContentList}">
		<input type="hidden" name="b_no" id="b_no" value="${content.b_no}">
		<input type="hidden" name="b_views" id="b_views" value="${content.b_views}">
		<input type="hidden" id="session_id" value="${sessionId}">
		<input type="hidden" id="session_grade" value="${sessionGrade}">
		<%-- ${content.b_no}
		${content.u_id}
		${sessionId} --%>
	</c:forEach>
	

	<div class="cmtWrap">
	
	<div class="cmtTablesDiv">
	
		
	<c:if test="${sessionId =! null}">
	
		<c:forEach var="user" items="${userList}">	
			<div class="cmtTable1Div">
		
			<input type="hidden" name="c_writer" id="c_writer" value="${user.u_name}">
			<input type="hidden" name="u_id" id="u_id" value="${user.u_id}">
			
				<table class="cmtTable1">
					<tr>
						<td style="padding: 5px; padding-left: 10px;"><b>${user.u_name}</b></td>
						<td></td>
						<td></td>
					</tr>
				
					<tr>
						<td colspan="2" style="padding: 10px; padding-top: 3px;"><textarea rows="3" cols="80" name="c_content" id="c_content" placeholder="타인을 배려하는 마음을 담아 댓글을 달아주세요." required="required" class="cmt1Con"></textarea></td>
						<td style="padding-right: 10px;"><button id="insertCommentBtn" class="btn btn-dark btn-sm">등록</button> </td>
					</tr>
					
				</table>
				
			</div>
			
		</c:forEach>
	
	</c:if>
	
	
			<div class="cmtTable2Div">
				<table id="cmtListTable" class="cmtTable2">
				
					
					
				</table>
			</div>
	</div>			
	</div>			
		
			
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	var b_no = $("#b_no").val();
	var b_views = $("#b_views").val();
	var session_id = $("#session_id").val();
	var session_grade = $("#session_grade").val();
	
	$.ajax({
		url : "/homepage2/viewBoardComment",
		type : "POST",
		data : {b_no:b_no},
		success : function(data) {
		
		var tableElement = "<tr>"; 
		if(data.length < 1){
			tableElement += "<td>등록된 댓글이 없습니다.<td></tr>";
		}else{
			
			
             
			$.each(data, function(i){
				
				var c_no = data[i].c_no;
				var c_writer = data[i].c_writer;
				var c_reg_date = data[i].c_reg_date;
				var c_content = data[i].c_content;
				var c_id = data[i].u_id;
				var u_name = data[i].u_name;
				var delete_c_no = "delete"+c_no;
				var update_c_no = "update"+c_no;
				
				
				tableElement += "<td class='cmt2Writer'><b>"
							+ c_writer
							+ "</b>"
							+ "<span class='cmt2Date'>"
							+ c_reg_date 
							+ "</span></td>";
							
							
								
				if(c_id==session_id){
					tableElement += "<td class='cmt2Up'><a href='#' id='" + update_c_no + "'>수정</a>"
							+ "</td>"
							+ "<td class='cmt2Del'><a href='#' id='" + delete_c_no + "'>삭제</a></td>";
				
				}else{
					if(session_grade=="admin"){
						tableElement += "<td class='cmt2Up'></td>"
							+ "<td class='cmt2Del'><a href='#' id='" + delete_c_no + "'>삭제</a></td>";
					
					}else{
						tableElement += "<td class='cmt2Up'></td>"
									+ "<td class='cmt2Del'></td>";
					}		
				}
				
				tableElement += "</tr><tr><td colspan='5' class='cmt2Con'>" + c_content + "</td></tr>";
				
				$(document).on("click", "#"+delete_c_no, function(){
					if(confirm("정말 삭제하시겠습니까?")){
						alert("댓글이 삭제되었습니다.");
						location.href="/homepage2/deleteBoardComment?b_no="+b_no+"&b_views="+b_views+"&c_no="+delete_c_no;
					}else{
						alert("취소되었습니다.");
					}   
				})
				
				
				
				$(document).on("click", "#"+update_c_no, function(){
					
					alert("기능 미구현");
					
					/* if(confirm("수정하시겠습니까?")){
						alert("댓글이 수정되었습니다.");
						location.href="/homepage2/updateBoardComment?b_no="+b_no+"&b_views="+b_views+"&c_no="+update_c_no+"&c_content="+c_content;
					}else{
						alert("취소되었습니다.");
					}  */  
				})
				
			})
			
		}	
			$("#cmtListTable").append(tableElement);
			
			
		},
		error : function(request, status, error) {
			alert("에러");
			alert("code:"+request.status);
		}
		
	});
	
	
		
	
		$("#insertCommentBtn").click(function() {
			var c_writer = $("#c_writer").val();
			var c_content = $("#c_content").val();
			/* var b_no = $("#b_no").val(); */
			
			if(confirm("댓글을 작성하시겠습니까?")){
				$.ajax({
					url : "/homepage2/insertBoardComment",
					type : "POST",
					data : {c_writer:c_writer, c_content:c_content, b_no:b_no},
					success : function(data) {
						alert("댓글이 등록되었습니다.");
						location.reload();
					},
					error : function(request, status, erro) {
						alert("에러");
						alert("code:"+request.status);
					}
				});
				
			}else{
				alert("취소되었습니다.");
			}
			
		})
	
		
	});
		


</script>	


	
	
	

</body>
</html>