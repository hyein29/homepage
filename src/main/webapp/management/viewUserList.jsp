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
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<div class="userListWrap">
		
		<div class="userListTitle">
			<h3>회원관리</h3>
		</div>
		
		
		
		
		
		
		
		<div class="userListTable">
		
			<table>
				<thead>
					<tr>
						<th class="userNo">번호</th>
						<th class="userId">아이디</th>
						<th class="userName">이름</th>
						<th class="userBday">BD</th>
						<th class="userGender">성별</th>
						<th class="userTel">연락처</th>
						<th class="userEmail">이메일</th>
						<th class="userGrade">등급</th>
						<th class="userRegDate">가입일</th>
						<th></th>
					</tr>
				</thead>
			
				<tbody>	
				<c:forEach var="users" items="${usersList}">
				
			
						
			
				
					<tr>
					
						<td>${users.u_no}</td>
						<td>${users.u_id}</td>
						<td>${users.u_name}</td>
						<td>${users.u_birth}</td>
						<td>${users.u_gender}</td>
						<td>${users.u_tel}</td>
						<td>${users.u_email}</td>
						
						
						
						
						<c:if test="${users.u_grade eq 'silver'}">
						<td>
							<select class="u_grade" id="u_grade" data-owner-id="${users.u_id}">
								<option selected="selected">silver</option>
								<option>gold</option>
								<option>vip</option>
								<option>admin</option>
							</select>
						</td>
						</c:if>
						<c:if test="${users.u_grade eq 'gold'}">
						<td>
							<select class="u_grade" id="u_grade" data-owner-id="${users.u_id}">
								<option>silver</option>
								<option selected="selected">gold</option>
								<option>vip</option>
								<option>admin</option>
							</select>
						</td>
						</c:if>
						<c:if test="${users.u_grade eq 'vip'}">
						<td>
							<select class="u_grade" id="u_grade" data-owner-id="${users.u_id}">
								<option>silver</option>
								<option>gold</option>
								<option selected="selected">vip</option>
								<option>admin</option>
							</select>
						</td>
						</c:if>
						<c:if test="${users.u_grade eq 'admin'}">
						<td>
							<select id= class="u_grade""u_grade" data-owner-id="${users.u_id}">
								<option>silver</option>
								<option>gold</option>
								<option>vip</option>
								<option selected="selected">admin</option>
							</select>
						</td>
						</c:if>
						
						
						
						<td>${users.u_reg_date}</td>
						<%-- <td><button id="userDeleteBtn${users.u_id}">삭제</button></td> --%>
						<%-- <td><button class='checkBtn' data-owner-num="${users.u_id}">삭제</button></td> --%>
						<td><button class="checkBtn" id="userDeleteBtn" data-owner-id="${users.u_id}">삭제</button></td>
						
					</tr>
					
					
				</c:forEach>	
				</tbody>
			</table>
			
			
		</div>	
		
		
			
	</div>		

<script>

	$(".checkBtn").click(function(){
		var u_id = $(this).attr("data-owner-id");
		/* var clickbtn = $(this); */
		
			if(confirm("["+ u_id + "] 회원을 삭제하시겠습니까?")){
				alert("삭제되었습니다.");
				location.href="/homepage2/deleteUser?u_id="+u_id;
			}else{
				alert("취소되었습니다.");
			}
	});
	
	
	
	$(".u_grade").change(function(){
		var u_id = $(this).attr("data-owner-id");
		var u_grade = $(this).val();
		
		if(confirm("등급을 변경하시겠습니까?")){
			alert("변경되었습니다.");
			location.href="/homepage2/updateUserInfo?u_id="+u_id+"&u_grade="+u_grade;
		}else{
			alert("취소되었습니다.");
		}	
	});





// 	function delete_btn_id(u_id){
		
// 		alert(u_id);
		
// 		if(confirm(u_id + " 회원을 삭제하시겠습니까?")){
// 			alert("삭제되었습니다.");
// 			location.href="/homepage2/deleteUser?u_id="+u_id;
// 		}else{
// 			alert("취소되었습니다.");
// 		}
// 	};


//  	function delete_btn_id(u_id){
		
//  		var duid = '$("#del'+ u_id +'")';
// 		var test = eval(duid);
 		
//  		test.click(function()
//  				{
 			
// 		 			if(confirm(u_id + " 회원을 삭제하시겠습니까?")){
// 		 				alert("삭제되었습니다.");
// 		 				location.href="/homepage2/deleteUser?u_id="+u_id;
// 		 			}else{
// 		 				alert("취소되었습니다.");
// 		 			}
 				 			
//  				}
//  		);
//  	};
	

</script>



</body>
</html>