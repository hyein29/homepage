<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/homepage2/css/home.css">
<link rel="stylesheet" href="/homepage2/css/header.css">
<link rel="stylesheet" href="/homepage2/css/nav.css">
<link rel="stylesheet" href="/homepage2/css/content.css">
<link rel="stylesheet" href="/homepage2/css/footer.css">
<link rel="stylesheet" href="/homepage2/css/board.css">
<link rel="stylesheet" href="/homepage2/css/boardContent.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

	<div id="wrapper">
		
		<div id="header">
			<jsp:include page="/moduleZip/header.jsp"></jsp:include>
		</div>
		
		
		
		<div id="nav">
			<jsp:include page="/moduleZip/nav.jsp"></jsp:include>
		</div>
		
				
		
		<div id="content">
			<div>
				<jsp:include page="/board/viewContent/viewBoardContent.jsp"></jsp:include>
			</div>
			
			<div>
				<jsp:include page="/board/viewContent/comment/commentUpdateForm.jsp"></jsp:include>
			</div>
		</div>
		
		
		
		<div id="footer">
			<jsp:include page="/moduleZip/footer.jsp"></jsp:include>
		</div>
		
		
	</div>
	
	

</body>
</html>