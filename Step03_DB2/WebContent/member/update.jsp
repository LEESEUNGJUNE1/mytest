<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.깨지지 않게 한글로 변환해주고
	request.setCharacterEncoding("utf-8");
	
	//2. GET 방식 파라미터로 전달되는 수정할 회원의 번호,이름,지역을 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	//3. MemberDao 객체를 이용해서 DB에 수정하기
	MemberDao dao=MemberDao.getInstance();
	MemberDto dto=new MemberDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);
	boolean isSuccess=MemberDao.getInstance().update(dto);
	
	//4. 응답한다.
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
         alert("갱신 성공!!");
         //목록보기로 이동 시키기
         location.href="list.jsp";
      </script>
   <%}else{ %>
      <script>
         alert("갱신 실패..");
         location.href="list.jsp";
      </script>
   <%} %>
</body>
</html>
