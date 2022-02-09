<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 전송되는 추가할 회원의 이름과 주소 읽어오기
	request.setCharacterEncoding("utf-8");

	String content = request.getParameter("content");
	String regdate = request.getParameter("ragdate");
	//2. MemberDao 객체를 이용해서 DB에 저장하기
	TodoDao dao = TodoDao.getInstance();
	TodoDto dto = new TodoDto();
	dto.setContent(content);
	dto.setRegdate(regdate);
	boolean isSuccess=dao.insert(dto);
	//3. 작업의 성공여부를 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>작업 여부 입니다.</h1>
	<%if(isSuccess=true){ %>
		<p class="alert alert-success">
		추가 성공!!
		<a class="alert-link" href="list.jsp">목록으로가기</a> </p>
	<%}else{ %>
		<p class="alert alert-dager">
		추가 실패..
		<a class="alert-link" href="insertform.jsp">다시하기</a> </p>
	<%} %>
</body>
</html>