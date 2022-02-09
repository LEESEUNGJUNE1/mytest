<%@page import="test.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	List<MemberDto> list = new ArrayList<MemberDto>();
    	list.add(new MemberDto(1,"쿠르투아","벨기에"));
    	list.add(new MemberDto(2,"카르바할","스페인"));
    	list.add(new MemberDto(3,"밀리탕","브라질"));
    	list.add(new MemberDto(4,"알라바","오스트리아"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MemberDto 입니다.</h1>
	<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>국가</th>
		</td>
	</thead>
	<tbody>
	<%for(MemberDto tmp:list){ %>
		<tr>
			<td><%=tmp.getNum()%></td>
			<td><%=tmp.getName()%></td>
			<td><%=tmp.getAddr()%></td>
		</tr>
		<%} %>
		</tbody>
	</table>
</body>
</html>