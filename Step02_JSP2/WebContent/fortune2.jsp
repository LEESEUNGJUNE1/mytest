<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    List<String> list = new ArrayList<>();
    list.add("동쪽으로 가면 귀인을 만나요");
	list.add("로또를 사면 3등에 당첨 될거에요");
	list.add("이상형을 만나게 될거에요");
	list.add("뜻밖의 횡제를 합니다");
	list.add("물건을 읽어 버려요 조심하세요");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fortune2.jsp</title>
</head>
<body>
<%
	Random ran = new Random();
	int ranNum=ran.nextInt(5);
%>
<p>오늘의 운세 : <%=list.get(ranNum) %></p>
</body>
</html>