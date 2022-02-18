<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //폼 전송되는 파라미터 추출 
   String id=request.getParameter("id");
   String pwd=request.getParameter("pwd");
   String isSave=request.getParameter("isSave");
   //로그인 정보를 저장하기로 했는지 확인
   if(isSave != null){//저장 하기로 했으면
      //아이디 비밀번호를 쿠키로 응답한다.
      Cookie cook1=new Cookie("savedId", id);
      Cookie cook2=new Cookie("savedPwd", pwd);
      cook1.setMaxAge(60*10);
      cook2.setMaxAge(60*10);
      response.addCookie(cook1);
      response.addCookie(cook2);
   }else{//저장하기로 하지 않았으면 
      //.setMaxAge(0) 로 응답하면 쿠키가 자동 삭제 된다. 
      Cookie cook1=new Cookie("savedId", "");
      Cookie cook2=new Cookie("savedPwd", "");
      cook1.setMaxAge(0);
      cook2.setMaxAge(0);
      response.addCookie(cook1);
      response.addCookie(cook2);
   }
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/login.jsp</title>
</head>
<body>
   <p>
      로그인 되었습니다.
      <a href="cookie_form3.jsp">다시 테스트</a>
   </p>
</body>
</html>