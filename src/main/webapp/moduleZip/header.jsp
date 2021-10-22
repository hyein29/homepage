<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="sessionId" value="${sessionScope.u_id}"/>
<c:set var="sessionGrade" value="${sessionScope.u_grade}"/>


<div class="hdWrap">	
	
	<div class="haTopWrap">
	<c:choose>
		<c:when test="${sessionId != null}">
		
			<c:choose>
				<c:when test="${sessionGrade eq 'admin'}">
					<div class="hdTop">
		
						<div class="hdNavBar">
							<nav class="test">
							
								<ul class="hdNavForAdmin">
								
									<li class="hdNavItem">
										<a href="/homepage2/logout">로그아웃</a>
									</li>
									
									<li class="hdNavItem">
										<a href="/homepage2/viewUserInfo">마이페이지</a>
									</li>
									
									<li class="hdNavItem">
										<a href="/homepage2/viewUserList">회원관리</a>
									</li>
									
									<li class="hdNavItem">
										<a href="/homepage2/viewBoardList">고객센터</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				
				
				</c:when>
				
				<c:otherwise>
					<div class="hdTop">
		
						<div class="hdNavBar">
							<nav class="test">
							
								<ul class="hdNav">
								
									<li class="hdNavItem">
										<a href="/homepage2/logout">로그아웃</a>
									</li>
									
									<li class="hdNavItem">
										<a href="/homepage2/viewUserInfo">마이페이지</a>
									</li>
									
									<li class="hdNavItem">
										<a href="#" class="notyet">장바구니</a>
									</li>
									
									<li class="hdNavItem">
										<a href="#" class="notyet">주문배송</a>
									</li>
									
									<li class="hdNavItem">
										<a href="/homepage2/viewBoardList">고객센터</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				
				</c:otherwise>
				
			</c:choose>
		
		
	
		
		</c:when>
		
		<c:otherwise>
			<div class="hdTop">
				<div class="hdNavBar">
					<nav class="test">
						<ul class="hdNav">
							<li class="hdNavItem">
								<a href="/homepage2/signUp/signUpPage.jsp">회원가입</a>
							</li>
							
							<li class="hdNavItem">
								<a href="/homepage2/login/loginPage.jsp">로그인</a>
							</li>
							
							<li class="hdNavItem">
								<a href="/homepage2/login/loginPage.jsp">장바구니</a>
							</li>
							
							<li class="hdNavItem">
								<a href="/homepage2/login/loginPage.jsp">주문배송</a>
							</li>
							
							<li class="hdNavItem">
								<a href="/homepage2/viewBoardList">고객센터</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</c:otherwise>
	
	</c:choose>	
	</div>
	
	<div class="hdInnerWrap">	
		<div class="hdInner">
		
			<div class="logo">
				<a href="/homepage2/home/homePage.jsp"><img src="/homepage2/icon/logo.png"></a>
			</div>
			
			<div class="searchBox">
				<form action="#">
					<div style="margin-left: 10px;">
						<input type="search" name="search" class="searchInput" placeholder="★ 아이즈원 주주의 PICK!  #한율유자크림 ★" autocomplete="off">
						<button type="submit" value="검색" class="searchSubmitBtn notyet"><img src="/homepage2/icon/search_icon.png" style="width:25px;"></button>
					</div>
				</form>
			</div>
			
		</div>
	</div>
	
</div>

	<!-- 
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

$(".searchSubmitBtn").on("click", function(){
	alert("기능 미구현");
})

</script> -->