<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/play.jsp</title>
</head>
<body>
	<%
		String nick=(String)session.getAttribute("nick");
	%>
	<h1>play.jsp 페이지 입니다.</h1>
	<%if(nick == null){ %>
		<p>session 영역에 "nick" 이라는 키값으로 저장된 값이 없습니다.</p>
	<%}else{ %>
		<p>
			<strong><%=nick %></strong> 님 놀러 오셨네요? 신나게 놀다 가세요~
			<a href="delete.jsp">로그아웃(세션에 저장된 내용 삭제하기)</a>
		</p>
	<%} %>
</body>
</html>