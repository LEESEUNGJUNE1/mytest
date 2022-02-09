<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 전송되는 추가할 회원의 이름과 주소 읽어오기
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	//2. MemberDao 객체를 이용해서 DB에 저장하기
	MemberDao dao=MemberDao.getInstance();
	MemberDto dto=new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	boolean isSuccess=dao.insert(dto);
	//3. 작업의 성공여부를 응답하기
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<h1>작업 여부 입니다.</h1>
	<%if(isSuccess=true){ %>
		<p class="alert alert-success">
		추가 성공!!
		<a class="alert-link" href="list.jsp">목록으로가기</a> </p>
	<%}else{ %>
		<p class="alert alert-dager">
		추가 실패..
		<a class="alert-link" href="insertform.jsp">다시하기</a> </p>
	<%} %>
</body>
</html>