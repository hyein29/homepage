<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

	<div class="loginWrap">
		<div class="loginForm">
		  <h2>Login</h2>
	      <div class="idForm">
	        <input type="text" name="u_id" class="id" placeholder="ID" id="u_id">
	      </div>
	      <div class="passForm">
	        <input type="password" name="u_pw" class="pw" placeholder="PW" id="u_pw">
	      </div>
	      <button type="button" id="loginBtn" class="btn">
	       LOG IN
	      </button>
	
	      <div class="bottomText">
	        Don't you have ID? <a href="/signUp/signUpPage.jsp">sign up</a>
	      </div>
	    </div>
	</div>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">

	$(function(){
		
		$("#loginBtn").click(function(){
			
			var u_id = $("#u_id").val();
			var u_pw = $("#u_pw").val();
			
			$.ajax({
				url : "/homepage2/login",
				type : "POST",
				data : {u_id:u_id, u_pw:u_pw},
				success : function(data) {
					if(data=="success"){
						
						location.href='/homepage2/home/homePage.jsp';

					}else if(data=="wrongPw"){
						alert("비밀번호를 확인하세요.");
					}else if(data=="wrongId"){
						alert("아이디를 확인하세요.");
					}
				},
				error : function(request, status, error) {
					alert("에러");
					alert("code:"+request.status);
				}
			})
		})
		
		
		
	})



</script>  
    
</body>
</html>