<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //GET 방식 파라미터로 전달되는 수정할 회원의 번호를 읽어온다.
   int num=Integer.parseInt(request.getParameter("num"));
    //MemberDao 객체를 이용해서 수정할 회원의 정보를 얻어와서
    MemberDto dto=MemberDao.getInstance().select(num);
    //폼에 출력해서 응답한다. 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
</head>
<body>
<div class="container">
   <h1>회원정보 수정 폼</h1>
   <form action="update.jsp" method="post">
   		<!-- 수정할 회원의 primary key는 input type="hidden"을 이용해서 폼 전송한다. -->
   		<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
		<div>
         <label for="name">번호</label>
         <!-- 번호는 primary key 니까 수정 못하도록하고 -->
         <input type="text" name="name" id="name" value="<%=dto.getNum()%>"disabled/>
      </div>
      <div>
         <label for="name">이름</label>
         <input type="text" name="name" id="name" value="<%=dto.getName()%>"/>
      </div>
      <div>
         <label for="addr">주소</label>
         <input type="text" name="addr" id="addr" value="<%=dto.getAddr()%>"/>
      </div>
      <button type="submit">수정 확인</button>
      <button type="reset">취소</button>
   </form>
</div>
</body>
</html>
