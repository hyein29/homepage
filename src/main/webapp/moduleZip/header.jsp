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
										<a href="#">장바구니</a>
									</li>
									
									<li class="hdNavItem">
										<a href="#">주문배송</a>
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
								<a href="#">장바구니</a>
							</li>
							
							<li class="hdNavItem">
								<a href="#">주문배송</a>
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
					<input type="search" name="search">
					<input type="submit" value="검색">
				</form>
			</div>
			
		</div>
	</div>
	
</div>

	






	
<%-- <div class="hdWrap">	
	<div class="hdTop">
<%

	if(session.getAttribute("u_id") != null){
%>	
		<div class="hdNavBar">
			<nav class="test">
			
				<ul class="hdNav">
				
					<li class="hdNavItem">
						<a href="/homepage2/logout">로그아웃</a>
					</li>
					
					<li class="hdNavItem">
						<a href="../userInfo/userInfoPage.jsp?u_id=<%= session.getAttribute("u_id") %>">마이페이지</a>
						<a href="/homepage2/viewUserInfo">마이페이지</a>
					</li>
					
					<li class="hdNavItem">
						<a href="#">장바구니</a>
					</li>
					
					<li class="hdNavItem">
						<a href="#">주문배송</a>
					</li>
					
					<li class="hdNavItem">
						<a href="/homepage2/viewBoardList">고객센터</a>
					</li>
				</ul>
			</nav>
		</div>
		
	</div>
	

<%
		
	}else if(session.getAttribute("u_id") == null){
%>
		
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
						<a href="#">장바구니</a>
					</li>
					
					<li class="hdNavItem">
						<a href="#">주문배송</a>
					</li>
					
					<li class="hdNavItem">
						<a href="/homepage2/viewBoardList">고객센터</a>
					</li>
				</ul>
			</nav>
		</div>
		
	</div>
		
<%		
		
	}

%>


	
	
	
	
	<div class="hdInner">
	
		<div class="logo">
			<a href="/homepage2/home/homePage.jsp"><img src="https://image.oliveyoung.co.kr/pc-static-root/image/comm/h1_logo.png"></a>
		</div>
		
		<div class="searchBox">
			<form action="#">
				<input type="search" name="search">
				<input type="submit" value="검색">
			</form>
		</div>
		
	</div>

	
	
	

</div> --%>