<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//여기가 어디지?
    	String fortuneToday="동쪽으로 가면 귀인을 만나요";
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fortune.jsp</title>
</head>
<body>
	<h1>오늘의 운세 페이지</h1>
	<p>오늘의 운세: <%=fortuneToday %></p>
	
	<%for(int i=0; i<10; i++){ %>
		<p>Hello</p>
	<%} %>
	
</body>
</html>