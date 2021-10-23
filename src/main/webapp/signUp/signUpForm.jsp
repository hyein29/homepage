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
						<td class="td2"><input type="text" id="u_id" name="u_id" required minlength="4" autocomplete="off"></td>
						<td class="td3"><button id="checkId" class="btn btn-light btn-sm">중복체크</button></td>
					</tr>
					
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="u_pw" name="u_pw" required minlength="8" autocomplete="off"></td>
						<td></td>
					</tr>
					
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" id="u_pw2" required autocomplete="off"></td>
						<td><div id="alertPw"></div></td>
					</tr>
					
					<tr>
						<td>이름</td>
						<td><input type="text" id="u_name" name="u_name" required autocomplete="off"></td>
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
							<label><input type="radio" name="u_gender" id="u_gender" value="m" class="male"> 남자</label>
							<label><input type="radio" name="u_gender" id="u_gender" value="f" class="female" style="margin-left: 10px;"> 여자</label>
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
							<input type="text" name="u_tel2" id="u_tel2" required size="2px" autocomplete="off">-
							<input type="text" name="u_tel3" id="u_tel3" required size="2px" autocomplete="off">
						</td>
						<td></td>
					</tr>
					
					<tr>
						<td>이메일</td>
						<td colspan="2">
							<input type="text" name="u_email1" id="u_email1" required size="10px" autocomplete="off"> @
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
								<input type="button" value="가입하기" id="signUpBtn" class="btn btn-outline-dark">
							</div>
							<div>
								<button onclick="location.href='/homepage2/home/homePage.jsp'" id="signUpCancelBtn" class="btn btn-dark">취소하기</button>
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
			var idRegExp = /^[a-zA-z0-9]{4,12}$/;
			
			if(!idRegExp.test(u_id)){
				
				if(u_id.length == 0){
					$("#checkId").attr("checkId", "N");
					alert("아이디를 입력하세요.")
					$("#u_id").focus();
					return;
					
				}else if(u_id.indexOf(" ") >= 0){
					$("#checkId").attr("checkId", "N");
					alert("아이디에 공백을 사용할 수 없습니다.")
					$("#u_id").focus();
					return;
					
				}else{
					$("#checkId").attr("checkId", "N");
					alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.");
					$("#u_id").focus();
					return;
				}
				
			}else{
				
				$.ajax({
					url : "/homepage2/idCheck",
					type : "POST",
					data : {u_id:u_id},
					success : function(data) {
						if(data==1){
							$("#checkId").attr("checkId", "N");
							alert("이미 존재하는 아이디입니다.");
							$("#u_id").focus();
						}else if(data==2){
							$("#checkId").attr("checkId", "N");
							alert("아이디를 입력하세요.");
							$("#u_id").focus();
						}else if(data==0){
							$("#checkId").attr("checkId", "Y");
							alert("사용가능한 아이디입니다.");
							$("#u_pw").focus();
						}
					},
					error : function(request, status, error) {
						alert("에러");
						alert("code:"+request.status);
					}
				})
				
			}
		})
		
		
		$("#u_id").change(function(){
			$("#checkId").attr("checkId", "N");
		})
		
		
		
		$("#u_pw2").on("keyup", function(){
			if($("#u_pw").val() != $("#u_pw2").val()){
				
			$("#alertPw").text("비밀번호가 일치하지 않습니다.").css({
				"color" : "red",
				"font-size" : "x-small"
			})
			}else{
				$("#alertPw").empty();
			}
		})
		
		
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
		var checkId = $("#checkId").attr("checkId"); 
		var u_pw = $("#u_pw").val();
		var u_pw2 = $("#u_pw2").val();
		var u_name = $("#u_name").val();
		var u_birth = $("#u_birth").val();
		var u_gender = $("#u_gender").val();
		var u_tel1 = $("#u_tel1").val();
		var u_tel2 = $("#u_tel2").val();
		var u_tel3 = $("#u_tel3").val();
		var u_email1 = $("#u_email1").val();
		var u_email2 = $("#u_email2").val();
		
		if(u_id == null || u_id == undefined || u_id == ""){
			alert("아이디를 입력해주세요.");
			$("#u_id").focus();
			return;
		}
		if(checkId == "" || checkId == "N"){
			alert("아이디 중복체크를 해주세요.");
			$("#checkId").focus();
			return;
		}
		if(u_pw == null || u_pw == undefined || u_pw == ""){
			alert("비밀번호를 입력해주세요.");
			$("#u_pw").focus();
			return;
		}
		if(u_pw.length < 4){
			alert("비밀번호를 4자 이상 입력해주세요.");
			$("#u_pw").focus();
			return;
		}
		if(u_pw2 == null || u_pw2 == undefined || u_pw2 == ""){
			alert("비밀번호 확인을 입력해주세요.");
			$("#u_pw2").focus();
			return;
		}
		if(u_pw2 != u_pw){
			alert("비밀번호가 일치하지 않습니다.");
			$("#u_pw2").focus();
			return;
		}
		if(u_name == null || u_name == undefined || u_name == ""){
			alert("이름을 입력해주세요.");
			$("#u_name").focus();
			return;
		}
		if(u_birth == null || u_birth == undefined || u_birth == ""){
			alert("생년월일을 선택해주세요.");
			return;
		}
		if(!$(".male").checked && !$(".female").prop("checked")){
			alert("성별을 선택해주세요.");
			return;
		}
		if(u_tel2 == null || u_tel2 == undefined || u_tel2 == ""){
			alert("연락처를 입력해주세요.");
			$("#u_tel2").focus();
			return;
		}
		if(u_tel3 == null || u_tel3 == undefined || u_tel3 == ""){
			alert("연락처를 입력해주세요.");
			$("#u_tel3").focus();
			return;
		}
		if(u_email1 == null || u_email1 == undefined || u_email1 == ""){
			alert("이메일을 입력해주세요.");
			$("#u_email1").focus();
			return;
		}
		
		
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