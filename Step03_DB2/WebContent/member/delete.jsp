<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //GET 방식 파라미터로 전달되는 삭제할 회원의 번호 읽어오기
   int num=Integer.parseInt(request.getParameter("num"));
   //MemberDao 객체를 이용해서 DB 에서 삭제한다.
   boolean isSuccess=MemberDao.getInstance().delete(num);
   //응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
</head>
<body>
   <%if(isSuccess){ %>
      <script>
         //알림창 띄우기
         alert("삭제 성공!!");
         //목록보기로 이동 시키기
         location.href="list.jsp";
      </script>
   <%}else{ %>
      <script>
         alert("삭제 실패..");
         location.href="list.jsp";
      </script>
   <%} %>
</body>
</html>
