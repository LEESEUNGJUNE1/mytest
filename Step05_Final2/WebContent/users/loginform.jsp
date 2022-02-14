<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET방식 파라미터 url이라는 이름으로 전달되는 값이 있는지 읽어와본다.
	String url=request.getParameter("url");
	//만일 넘어오는 값이 없다면
	if(url==null){
		//로그인 후에 인덱스 페이지로 갈수 있도록 한다.
		String cPath=request.getContextPath();
		url=cPath+"/index.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
</head>
<body>
<div class="container">
	<h1>로그인 폼</h1>
	<form action="login.jsp" method="post">
		<%-- 로그인 성공후 이동할 목적지 정보도 같이 전송되게 한다. --%>
		<input type="hidden" name="url" value="<%=url%>"/>
		<div>
			<label for="id"></label>
			<input type="text" name="id" id="id"/>
		</div>
		<div>
			<label for="pwd"></label>
			<input type="text" name="pwd" id="pwd"/>
		</div>
		<button type="submit">로그인</button>
	</form>
</div>
</body>
</html>