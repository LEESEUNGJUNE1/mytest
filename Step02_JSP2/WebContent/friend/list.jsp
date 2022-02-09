<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   List<String> list=new ArrayList<>();
   list.add("김구라");
   list.add("김구라2");
   list.add("김구라3");
   list.add("김구라4");
   list.add("김구라5");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/friend/list.jsp</title>
</head>
<body>
   <h1>친구 이름 목록 입니다.</h1>
   <ul>
      <%for(int i=0; i<list.size(); i++){ %>
         <li><%=list.get(i) %></li>
      <%} %>
   </ul>
   
   <h1>친구 이름 목록 입니다.</h1>
   <ul>
      <%for(String tmp:list){ %>
         <li><%=tmp %></li>
      <%} %>
   </ul>
</body>
</html>