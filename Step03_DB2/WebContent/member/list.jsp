<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//MemberDao 객체의 참조값을 얻어와서
	MemberDao dao=MemberDao.getInstance();
	//회원 목록 얻어오기 
	List<MemberDto> list=dao.selectAll();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<%--
	include 된 jsp 페이지에 필요한 파라미터를 include 할때 전달할수 있다.
	
	<jsp:param value="전달할 문자열" name="파라미터명"/>
	
	이렇게 전달한 정보는 HttpServletRequest 객체에 파라미터 정보로 저장이 되기 때문에
	
	include 된 jsp 페이지에서 request.getParameter("파라미터명") 과 같은 방법으로 해당 문자열을 추출할 수 있다.
 --%>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="member" name="thisPage"/>
</jsp:include>
<div class="container">
	<a href="insertform.jsp" style="font-size:2rem; color:green;">
		<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
  			<path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  			<path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
		</svg>
	</a>
	<h1>회원 목록 입니다.</h1>
	<table class="table table-info table-striped table-hover">
		<thead class="table-dark">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%for(MemberDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getAddr() %></td>
				<td>
					<a href="updateform.jsp?num=<%=tmp.getNum() %>">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
						<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
						<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
					</svg>
					</a>
				</td>
				<td><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>