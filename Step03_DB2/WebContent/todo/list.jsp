<%@page import="test.todo.dao.TodoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//TodoDao 객체의 참조값을 얻어오기
	TodoDao dao= TodoDao.getInstance();
	//Dto로 할일 목록을 가져오기
	List<TodoDto> list = dao.selectAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<div>
	<a href="insertform.jsp">추가하러 가기</a>
		<h1>할일 입니다!</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>할일</th>
					<th>날짜</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%for(TodoDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getContent() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>