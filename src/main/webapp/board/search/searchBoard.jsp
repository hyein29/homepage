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

<c:set var="sessionId" value="${sessionScope.u_id}"/>
<c:set var="sessionGrade" value="${sessionScope.u_grade}"/>

<c:set var="now" value="<%=new java.util.Date()%>" />


	<div id="boardWrap">
		
		<div class="boardTitle">
			<h3>게시판</h3>
		</div>
		
		<div class="boardTableDiv">
			<table class="boardTable">
			
				<thead>
					<tr>
						<td colspan="6" class="boardTableSearch">
							<div class="boardSearchForm">
							<form action="/homepage2/searchBoardList" method="get">
								<div class="boardSearchBox">
									<c:if test="${searchOption eq 'b_writer'}">
									<div><input type="radio" name="opt" value="b_writer" checked="checked" required="required"> 이름</div> <br>
									<div><input type="radio" name="opt" value="b_title"> 제목</div> <br>
									<div><input type="radio" name="opt" value="b_content"> 내용</div> <br>
									</c:if>
									
									<c:if test="${searchOption eq 'b_title'}">
									<div><input type="radio" name="opt" value="b_writer" required="required"> 이름</div> <br>
									<div><input type="radio" name="opt" value="b_title" checked="checked"> 제목</div> <br>
									<div><input type="radio" name="opt" value="b_content"> 내용</div> <br>
									</c:if>
									
									<c:if test="${searchOption eq 'b_content'}">
									<div><input type="radio" name="opt" value="b_writer" required="required"> 이름</div> <br>
									<div><input type="radio" name="opt" value="b_title"> 제목</div> <br>
									<div><input type="radio" name="opt" value="b_content" checked="checked"> 내용</div> <br>
									</c:if>
								
									<input type="text" name="boardSearchVal" value="${searchValue}">
									<input type="submit" value="검색">
								</div>	
							</form>
							</div>
						</td>
					</tr>
				
				
				
					<tr>
						<th>번호</th>
						<th class="lock"></th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
			
			
			
		<c:forEach var="search" items="${searchBoardList}">
				<fmt:formatDate var="b_reg_date" value="${search.b_reg_date}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
						
				<fmt:formatDate var="b_reg_dd" value="${search.b_reg_date}" pattern="yyyyMMdd"/>
				<fmt:formatDate var="today_dd" value="${now}" pattern="yyyyMMdd"/>
				<fmt:parseNumber var="subtract_dd" value="${today_dd - b_reg_dd}" integerOnly="true" />
				
				<fmt:parseNumber var="diffhour" value="${search.diff_date_r/3600000}" integerOnly="true"/>
				<fmt:parseNumber var="diffmin" value="${search.diff_date_r/60000}" integerOnly="true"/>
				<fmt:parseNumber var="diffsec" value="${search.diff_date_r/1000}" integerOnly="true"/>
		
				<input type="hidden" id="b_no" value="${search.b_no}">
		
				<tbody>
					<tr>
						<td class="tbNo"><c:out value="${search.b_no}"/></td>
						
						<c:if test="${search.b_pw != null}">
						<td><img src = "/homepage2/icon/lock.gif"></td>
						<td class="tbTitle">
							<div style="margin-left: 50px">
								<c:choose>
									<c:when test="${b_reg_date == today}">
										<a href="/homepage2/viewBoardPassword?b_no=${search.b_no}">${search.b_title} [${search.c_cnt}] <img src="/homepage2/icon/new.gif"></a>
									</c:when>
									
									<c:otherwise>
										<a href="/homepage2/viewBoardPassword?b_no=${search.b_no}">${search.b_title} [${search.c_cnt}] </a>
									</c:otherwise>
								</c:choose>
							</div>
						</td>
						</c:if>
						
						<c:if test="${search.b_pw == null}">
						<td></td>
						<td class="tbTitle">
							<div style="margin-left: 50px">
								<c:choose>
									<c:when test="${b_reg_date == today}">
										<a href="/homepage2/viewBoardContent?b_no=${search.b_no}">${search.b_title} [${search.c_cnt}] <img src="/homepage2/icon/new.gif"></a>
									</c:when>
									
									<c:otherwise>
										<a href="/homepage2/viewBoardContent?b_no=${search.b_no}">${search.b_title} [${search.c_cnt}]</a>
									</c:otherwise>
								</c:choose>
							</div>
						</td>
						</c:if>
						
						<%-- <c:if test="${search.b_pw != null}">
						<td><img src = "/homepage2/icon/lock.gif"></td>
						<td class="tbTitle"><a href="/homepage2/viewBoardPassword?b_no=${search.b_no}&b_pw=${search.b_pw}">${search.b_title} [${search.c_cnt}]</a></td>
						</c:if>
						
						<c:if test="${search.b_pw == null}">
						<td></td>
						<td class="tbTitle"><a href="/homepage2/viewBoardContent?b_no=${search.b_no}">${search.b_title} [${search.c_cnt}]</a></td>
						</c:if> --%>
						
						
						<c:choose>
							<c:when test="${search.u_grade eq 'admin'}">
								<td class="tbWriter"><img src="/homepage2/icon/admin.gif"></td>
							</c:when>
								
							<c:otherwise>
								<td class="tbWriter">${search.u_name}</td>
							</c:otherwise>
						</c:choose>
						
						
						<td class="tbDate">
							
							<c:choose>
								<c:when test="${b_reg_date == today}">
								
									<c:choose>
									
										<c:when test="${search.diff_date_r >= 3600000}">
											${diffhour}시간 전
										</c:when>
										
										<c:otherwise>
											<c:choose>
											
												<c:when test="${search.diff_date_r >= 60000}">
													${diffmin}분 전
												</c:when>
												
												<c:otherwise>
													<c:choose>
														<c:when test="${diffsec == 0}">
															방금 전
														</c:when>
														
														<c:otherwise>
															${diffsec}초 전
														</c:otherwise>
													</c:choose>
												</c:otherwise>
												
											</c:choose>
										</c:otherwise>
										
									</c:choose>
								
								</c:when>
								
								
								<c:otherwise>
									<c:choose>
										<c:when test="${subtract_dd == 1}">
											어제
										</c:when>
										
										<c:otherwise>
											<fmt:formatDate var="b_reg_date" value="${search.b_reg_date}" pattern="yyyy-MM-dd"/>
											${b_reg_date}
										</c:otherwise>
									</c:choose>
								</c:otherwise>
								
							</c:choose>
						</td>
						
						
						<%-- <td class="tbDate">${search.b_reg_date}</td> --%>
						<td class="tbViews">${search.b_views}</td>
					</tr>
				</tbody>
					
		</c:forEach>
				
				<tfoot>
					<tr>
						<td colspan="6" style="border-bottom: none;">
							<div class="selectBoardListBtns">
								<button class="btn btn-outline-primary" id="writeBtn">게시물 작성</button>
								<button onclick="location.href='/homepage2/viewBoardList'" class="btn btn-outline-warning" id="viewListBtn">뒤로가기</button>
							</div>
						</td>
					</tr>
				</tfoot>
		
		
		
				
			
			</table>
		
		</div>		
		
		
			
		<c:choose>
   
	      <c:when test="${sessionId != null}">
	         <script type="text/javascript">
	            $(function() {
	               
	               $("#writeBtn").click(function() {
	                  location.href = "/homepage2/viewUserInfo?write=1";
	               })
	              
	            });
	         </script>
	      </c:when>
	      
	      <c:otherwise>
	         <script type="text/javascript">
	         $(function() {
	            
	            $("#writeBtn").click(function() {
	               alert("로그인 후 게시물을 등록하실 수 있습니다.")
	            })
	            
	         });
	         </script>
	      </c:otherwise>
	   
	   </c:choose>
	
	</div>
	
	

</body>
</html>