<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="../boardview/comment/commentInsertProcess.jsp" method="get">
		<input type="hidden" name="b_no" value="<%=request.getParameter("b_no")%>">
		<input type="hidden" name="b_views" value="<%=request.getParameter("b_views")%>">
		
		
		<div class="cmtTable1">
			
			<table>
				<tr>
					<td><input type="text" name="c_writer" placeholder="작성자" required="required"></td>
					<td><input type="password" name="c_pw" placeholder="비밀번호는 숫자 네자리" required="required"></td>
					<td></td>
					<td></td>
				</tr>
			
				<tr>
					<td colspan="3"><textarea rows="3" cols="50" name="c_content" placeholder="타인을 배려하는 마음을 담아 댓글을 달아주세요." required="required"></textarea></td>
					<td><input type="submit" value="등록"></td>
				</tr>
				
			</table>
	
			
		</div>
	</form>
					
				
<%
	String b_no = request.getParameter("b_no");
	String c_no = request.getParameter("c_no");
	String b_views = request.getParameter("b_views");
	

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
			
	try{
		String url = "jdbc:mysql://localhost:3306/homepage?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";
				
		//2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(url, dbUser, dbPassword);
		
		
		String sql = "select * from comment where c_no = ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, c_no);

		rs = pstmt.executeQuery();
		
		

		while(rs.next()){
%>			
			<form action="commentUpdateProcess.jsp" method="post">
				<input type="hidden" name="b_no" value="<%= b_no %>">
				<input type="hidden" name="b_views" value="<%=request.getParameter("b_views")%>">
				<input type="hidden" name="c_no" value="<%=request.getParameter("c_no")%>">
				<input type="hidden" name="c_reg_date" value="<%= rs.getString("c_reg_date")%>">
				<div class="cmtTable2">
				<table>
					<tr>
						<td class="cmt2No" rowspan="2"><%= rs.getString("c_no") %></td>
						<td class="cmt2Writer"><%= rs.getString("c_writer") %></td>
						<td class="cmt2Pw">pw : <input type="password" name="c_pw" value="<%= rs.getString("c_pw") %>" size="3px"></td>
						<td class="cmt2Date"><%= rs.getString("c_update_date") %></td>
						<td class="cmt2Up"><input type="submit" value="등록" class="submitLink"></td>
						<td class="cmt2Can"><a href="../boardContentPage.jsp?b_no=<%= b_no %>&b_views=<%= b_views %>">취소</a></td>
					</tr>
					
					<tr>
						<td colspan="5" class="cmt2Con"> <input type="text" name="c_content" value="<%= rs.getString("c_content") %>" size="80px"></td>
					</tr>
				
				</table>
			
				</div>
			</form>
			
			
<%			
		}
		
	}catch(SQLException e){
		System.out.println("comment update 실패");
	}finally{
		rs.close();
		pstmt.close();
		conn.close();
	}

%>

		
	

</body>
</html>