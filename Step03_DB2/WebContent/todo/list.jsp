<%@page import="test.todo.dao.TodoDao"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//할일 목록을 가져오기
	List<TodoDto> list=TodoDao.getInstance().selectAll();
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
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="member"name=thisPage"/>
</jsp:include>
	<div class="container">
		<div class="p-3 mb-2 bg-secondary text-white">
			<h1>나의 스케줄</h1>
		</div>
		<div class="col-lg-6">
			<a href="insertform.jsp" style="font-size:1.5rem; color:green;">추가하기!
			<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-file-earmark-plus" viewBox="0 0 16 16">
			  <path d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5z"/>
			  <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
			</svg>
			</a>
			<table class="table table-dark table-striped table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>할일</th>
						<th>날짜</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
				<%for(TodoDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getContent() %></td>
						<td><%=tmp.getRegdate() %></td>
						<td>
							<a href="updateform.jsp?num=<%=tmp.getNum() %>" style="font-size:1rem; color:sky;">수정
								<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
						  			<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
								</svg>
							</a>
						</td>
						<td>
							<a href="delete.jsp?num=<%=tmp.getNum() %>" style="font-size:1rem; color:pink;">삭제
								<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-calendar-x" viewBox="0 0 16 16">
								  <path d="M6.146 7.146a.5.5 0 0 1 .708 0L8 8.293l1.146-1.147a.5.5 0 1 1 .708.708L8.707 9l1.147 1.146a.5.5 0 0 1-.708.708L8 9.707l-1.146 1.147a.5.5 0 0 1-.708-.708L7.293 9 6.146 7.854a.5.5 0 0 1 0-.708z"/>
								  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
								</svg>
							</a>
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>