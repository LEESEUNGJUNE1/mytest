<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //요청 파라미터를 추출해서 콘솔창에 출력하기 
   String msg=request.getParameter("msg");
   System.out.println(msg);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/send.jsp</title>
</head>
<body>
   <p>안녕 클라이언트야!</p>
</body>
</html>