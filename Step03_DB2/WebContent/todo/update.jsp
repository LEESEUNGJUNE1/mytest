<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인코딩 설정 
	request.setCharacterEncoding("utf-8");
	
	// 수정할 할일번호, 내용을 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	String regdate=request.getParameter("regdate");
	
	// Dto 에 담고
	TodoDto dto=new TodoDto();
	dto.setNum(num);
	dto.setContent(content);
	dto.setRegdate(regdate);
	
	// DB 에 수정 반영
	boolean isSuccess=TodoDao.getInstance().update(dto);
	
	// 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<%if(isSuccess){ %>
      <script>
         //알림창 띄우기
         alert("수정 성공!!");
         //목록보기로 이동 시키기
         location.href="list.jsp";
      </script>
   <%}else{ %>
      <script>
         alert("수정 실패..");
         location.href="list.jsp";
      </script>
   <%} %>
</body>
</html>