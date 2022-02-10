<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //1. 전송되는 추가할 회원의 이름과 주소 읽어오기
   request.setCharacterEncoding("utf-8");

   String content = request.getParameter("content");
   String regdate = request.getParameter("regdate");
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
<title>/todo/insert.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
   <h1>작업 여부 입니다.</h1>
   <%if(isSuccess){ %>
      <script>
         //알림창 띄우기
         alert("추가 성공!!");
         //목록보기로 이동 시키기
         location.href="list.jsp";
      </script>
   <%}else{ %>
      <script>
         alert("추가 실패..");
         location.href="list.jsp";
      </script>
   <%} %>
</body>
</html>