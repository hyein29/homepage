<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<div class="signUpWrap">
		
		<div class="signUpTitle">
			<h3>회원가입</h3>
		</div>
		
		
		<div class="signUpForm">
		
			<!-- <form action="#" method="get"> -->
		
				<div>
				<table class="signUpTable">
				
					<tr>
						<td class="td1">아이디</td>
						<td class="td2"><input type="text" id="u_id" name="u_id" required minlength="5"></td>
						<td><button id="checkId">중복체크</button></td>
					</tr>
					
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="u_pw" name="u_pw" required minlength="8"></td>
						<td></td>
					</tr>
					
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" id="u_pw2" required></td>
						<td><div id="alertPw"></div></td>
					</tr>
					
					<tr>
						<td>이름</td>
						<td><input type="text" id="u_name" name="u_name" required></td>
						<td></td>
					</tr>
					
					<tr>
						<td>생년월일</td>
						<td>
							<input type="date" name="u_birth" id="u_birth">
						</td>
						<td></td>
					</tr>
					
					
					<tr>
						<td>성별</td>
						<td>
							<input type="radio" name="u_gender" id="u_gender" value="m" class="gender">남
							<input type="radio" name="u_gender" id="u_gender" value="f" class="gender">여
						</td>
						<td></td>
					</tr>
					
					<tr>
						<td>연락처</td>
						<td>
							<select name="u_tel1" id="u_tel1">
								<option>010</option>
								<option>011</option>
								<option>016</option>
							</select>-
							<input type="text" name="u_tel2" id="u_tel2" required size="3px">-
							<input type="text" name="u_tel3" id="u_tel3" required size="3px">
						</td>
						<td></td>
					</tr>
					
					<tr>
						<td>이메일</td>
						<td colspan="2">
							<input type="text" name="u_email1" id="u_email1" required size="10px"> @
							<input type="text" name="u_email2" id="u_email2" autocomplete="off" readonly value="naver.com">
							
							<select name="u_email_domain" id="u_email_domain">
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="1">직접 입력</option>
							</select>
						</td>
					</tr>
					
					
					<tr>
						<td colspan=3 align=center style="padding-top: 30px;">
						
						<div class="signUpBtns">
							<div>
								<input type="button" value="가입하기" id="signUpBtn">
							</div>
							<div>
								<button onclick="location.href='../home/homePage.jsp'" id="signUpCancelBtn">취소하기</button>
							</div>
						</div>
					
						</td>
					</tr>
					
				</table>
				</div>
			
			<!-- </form> -->
			
		</div>
	
	</div>


<script>
	$(function(){
	
		$("#checkId").click(function(){
			var u_id = $("#u_id").val();
			
			$.ajax({
				url : "/homepage2/idCheck",
				type : "POST",
				data : {u_id:u_id},
				success : function(data) {
					if(data==1){
						alert("이미 존재하는 아이디입니다.");
					}else if(data==2){
						alert("아이디를 입력하세요.");
					}else if(data==0){
						alert("사용가능한 아이디입니다.");
					}
				},
				error : function(request, status, error) {
					alert("에러");
					alert("code:"+request.status);
				}
			})
		})
		
		
		$("#u_pw2").on("keyup", function(){
			if($("#u_pw").val() != $("#u_pw2").val()){
			                    
			$("#alertPw").text("비밀번호가 일치하지 않습니다.").css({
				"color" : "red",
				"font-size" : "small"
			})
			}else{
				$("#alertPw").empty();
			}
		})
		
		
		/* $("#u_email3").hide();
		
		$("#u_email2").change(function(){
			var state = $("u_email2 option:selected").val();
			
			if(state=="option4") {
				$("#u_email3").show();
			}else{
				$("#u_email3").hide();
			}
			
		}); */
		
	$("#u_email_domain").change(function(){
			
			if($(this).val() == "1"){
				$("#u_email2").val("");
				$("#u_email2").attr("readonly", false);
				$("#u_email2").focus();
			}else{
				$("#u_email2").val($(this).val());
				$("#u_email2").attr("readonly", true);
			}
	})
		
		
	});
	
	$("#signUpBtn").click(function(){
		var u_id = $("#u_id").val();
		var u_pw = $("#u_pw").val();
		var u_name = $("#u_name").val();
		var u_birth = $("#u_birth").val();
		var u_gender = $("#u_gender").val();
		var u_tel1 = $("#u_tel1").val();
		var u_tel2 = $("#u_tel2").val();
		var u_tel3 = $("#u_tel3").val();
		var u_email1 = $("#u_email1").val();
		var u_email2 = $("#u_email2").val();
		
		if(confirm("회원가입하시겠습니까?")){
			alert("가입완료되었습니다.");
			location.href="/homepage2/signUp?u_id="+u_id+"&u_pw="+u_pw+"&u_name="+u_name+"&u_birth="+u_birth+"&u_gender="+u_gender+"&u_tel1="+u_tel1+"&u_tel2="+u_tel2+"&u_tel3="+u_tel3+"&u_email1="+u_email1+"&u_email2="+u_email2;
		}else{
			alert("취소되었습니다.");
		}
		
		
	})
	
	
	

	

</script>



</body>
</html>