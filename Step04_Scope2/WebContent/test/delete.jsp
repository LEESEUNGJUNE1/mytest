<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/delete.jsp</title>
</head>
<body>
<%
	session.removeAttribute("nick");
	//session.invalidate() 세션초기화(모든 내용 다 삭제)
%>
<p>session 영역에 저장된 값을 삭제 했습니다.</p>
<a href="../"ndex.jsp">인덱스로 가기</a>
</body>
</html>