<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   //1. 폼 전송되는 아이디, 비밀번호 읽어오기 
   String id=request.getParameter("id");
   String pwd=request.getParameter("pwd");
   //2. dto 에 담기 
   UsersDto dto=new UsersDto();
   dto.setId(id);
   dto.setPwd(pwd);
   //3. dao 를 이용해서 DB 에 존재하는 맞는 정보인지 확인한다. 
   boolean isValid=UsersDao.getInstance().isValid(dto);
   if(isValid){
      //로그인 처리를 해준다. (로그인된 아이디를 session scope 에 저장)
      session.setAttribute("id", id);
   }
   //4. 응답
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
<div class="container">
   <h1>알림</h1>
   <%if(isValid){ %>
      <p>
         <strong><%=id %></strong> 님 로그인 되었습니다.
         <a href="${pageContext.request.contextPath }/index.jsp">확인</a>
      </p>
   <%}else{ %>
      <p>
         아이디 혹은 비밀번호가 틀려요
         <a href="${pageContext.request.contextPath }/users/loginform.jsp">다시시도</a>
      </p>
   <%} %>
</div>
</body>
</html>