<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //1. 삭제할 할일 번호를 읽어온다.
   int num=Integer.parseInt(request.getParameter("num"));
   //2. DB 에서 삭제
   boolean isSuccess=TodoDao.getInstance().delete(num);
   //3. 응답
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/delete.jsp</title>
</head>
<body>
   <%if(isSuccess){ %>
      <script>
         alert("삭제 했습니다.");
         location.href="list.jsp";
      </script>
   <%}else{ %>
      <script>
         alert("삭제 실패!");
         location.href="list.jsp";
      </script>
   <%} %>
</body>
</html>