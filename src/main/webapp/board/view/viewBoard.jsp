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
									<div><input type="radio" name="opt" value="b_writer" required="required"> 이름</div> <br>
									<div><input type="radio" name="opt" value="b_title"> 제목</div> <br>
									<div><input type="radio" name="opt" value="b_content"> 내용</div> <br>
									<input type="text" name="boardSearchVal" autocomplete="off">
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
			
		
			
		<c:forEach var="board" items="${boardList}">
				<fmt:formatDate var="b_reg_date" value="${board.b_reg_date}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
						
				<fmt:formatDate var="b_reg_dd" value="${board.b_reg_date}" pattern="yyyyMMdd"/>
				<fmt:formatDate var="today_dd" value="${now}" pattern="yyyyMMdd"/>
				<fmt:parseNumber var="subtract_dd" value="${today_dd - b_reg_dd}" integerOnly="true" />
				
				<fmt:parseNumber var="diffhour" value="${board.diff_date_r/3600000}" integerOnly="true"/>
				<fmt:parseNumber var="diffmin" value="${board.diff_date_r/60000}" integerOnly="true"/>
				<fmt:parseNumber var="diffsec" value="${board.diff_date_r/1000}" integerOnly="true"/>
		
				<input type="hidden" id="b_no" value="${board.b_no}">
				
		
				<tbody>
					<tr>
						<td class="tbNo">${board.b_no}</td>
						
						
						<c:if test="${board.b_pw != null}">
						<td><img src = "/homepage2/icon/lock.gif"></td>
						<td class="tbTitle">
							<div style="margin-left: 50px">
								<c:choose>
									<c:when test="${b_reg_date == today}">
										<a href="/homepage2/viewBoardPassword?b_no=${board.b_no}">${board.b_title} [${board.c_cnt}] <img src="/homepage2/icon/new.gif"></a>
									</c:when>
									
									<c:otherwise>
										<a href="/homepage2/viewBoardPassword?b_no=${board.b_no}">${board.b_title} [${board.c_cnt}] </a>
									</c:otherwise>
								</c:choose>
							</div>
						</td>
						</c:if>
						
						<c:if test="${board.b_pw == null}">
						<td></td>
						<td class="tbTitle">
							<div style="margin-left: 50px">
								<c:choose>
									<c:when test="${b_reg_date == today}">
										<a href="/homepage2/viewBoardContent?b_no=${board.b_no}">${board.b_title} [${board.c_cnt}] <img src="/homepage2/icon/new.gif"></a>
									</c:when>
									
									<c:otherwise>
										<a href="/homepage2/viewBoardContent?b_no=${board.b_no}">${board.b_title} [${board.c_cnt}]</a>
									</c:otherwise>
								</c:choose>
							</div>
						</td>
						</c:if>
						
						
						<c:choose>
							<c:when test="${board.u_grade eq 'admin'}">
								<td class="tbWriter"><img src="/homepage2/icon/admin.gif"></td>
							</c:when>
								
							<c:otherwise>
								<td class="tbWriter">${board.u_name}</td>
							</c:otherwise>
						</c:choose>
						
						
						<td class="tbDate">
						
						<c:choose>
							<c:when test="${b_reg_date == today}">
							
								<c:choose>
								
									<c:when test="${board.diff_date_r >= 3600000}">
										${diffhour}시간 전
									</c:when>
									
									<c:otherwise>
										<c:choose>
										
											<c:when test="${board.diff_date_r >= 60000}">
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
										<fmt:formatDate var="b_reg_date" value="${board.b_reg_date}" pattern="yyyy-MM-dd"/>
										${b_reg_date}
									</c:otherwise>
								</c:choose>
							</c:otherwise>
							
						</c:choose>
						
						
						
						
						
						<%-- <fmt:formatDate var="b_reg_date" value="${board.b_reg_date}" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
						
						<fmt:formatDate var="b_reg_time" value="${board.b_reg_date}" pattern="HH:mm:ss"/>
						<fmt:formatDate var="now_time" value="${now}" pattern="HH:mm:ss"/>
						
						<fmt:formatDate var="b_reg_hour" value="${board.b_reg_date}" pattern="HH"/>
						<fmt:formatDate var="now_hour" value="${now}" pattern="HH"/>
						<fmt:parseNumber var="subtracthour" value="${now_hour - b_reg_hour}" integerOnly="true" />
						
						<fmt:formatDate var="b_reg_min" value="${board.b_reg_date}" pattern="mm"/>
						<fmt:formatDate var="now_min" value="${now}" pattern="mm"/>
						<fmt:parseNumber var="subtractmin" value="${now_min - b_reg_min}" integerOnly="true" />
						
						<fmt:formatDate var="b_reg_sec" value="${board.b_reg_date}" pattern="ss"/>
						<fmt:formatDate var="now_sec" value="${now}" pattern="ss"/>
						<fmt:parseNumber var="subtractsec" value="${now_sec - b_reg_sec}" integerOnly="true" />
						
						
						<c:choose>
							<c:when test="${b_reg_date == today}">
							
								<c:choose>
									<c:when test="${subtracthour > 0}">
										${subtracthour}시간전
									</c:when>
										
										
									<c:otherwise>
									
										<c:choose>
											<c:when test="${subtractmin > 0}">
												${subtractmin}분전
											</c:when>
											
											<c:otherwise>
												${subtractsec}초전
											</c:otherwise>
										</c:choose>
										
									</c:otherwise>
								</c:choose>
								
							</c:when>
							
							
							<c:otherwise>
								${board.b_reg_date}
							</c:otherwise>
						</c:choose> --%>
						
						
						
						
						
						
							
							<%-- <fmt:formatDate value="${board.b_reg_date}" pattern="yyyy-MM-dd"/> --%>
							
							
							
							<%-- <c:if test="${board.b_reg_date == board.b_update_date}">
								${board.b_reg_date}
							</c:if>
							
							<c:if test="${board.b_reg_date != board.b_update_date}">
								수정됨
							</c:if> --%>
							
						<%-- ${board.b_reg_date}
						${board.b_update_date} --%>
						
							<%-- 
							  <fmt:parseDate var="dateTempParse" value="${board.u_reg_date}"/>

							<fmt:formatDate val="dateTempParse" value="${board.u_reg_date}"  pattern="yyyy-MM-dd hh:mm:ss.S" />
							 <fmt:formatDate value="${dateTempParse}" pattern="yyyy/MM/dd HH:mm"/> --%>
						
						</td>
						
						<td class="tbViews">${board.b_views}</td>
					</tr>
				</tbody>
					
		</c:forEach>	
		
				<tfoot>
					<tr>
						<td colspan="6" style="border-bottom: none;">
							<div class="boardInsertBtn">
								<!-- <button onclick="location.href='/homepage2/insertBoard'" class="btn btn-outline-primary" id="writeBtn">게시물 작성</button> -->
								<button class="btn btn-outline-primary" id="writeBtn">게시물 작성</button>
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
	            	  var b_no = $("#b_no").val();
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