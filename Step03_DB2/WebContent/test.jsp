<%@page import="java.sql.Connection"%>
<%@page import="test.utill.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn=new DbcpBean().getConn();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test.jsp</title>
</head>
<body>
	<h1>DB연결 테스트 결과</h1>
	<%if(conn!=null){ %>
		<p>DB 연결 완료!!</p>
	<%}else{ %>
		<p>DB 연결 실패..</p>
	<%} %>
</body>
</html>