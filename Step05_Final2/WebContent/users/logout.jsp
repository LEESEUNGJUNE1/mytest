<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope 에 "id"라는 키값으로 지정된 값 삭제하기
	session.removeAttribute("id");
	//session.invalidate(); // 세션 초기화
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("로그아웃 되었습니다.")
		location.href="${pageContext.request.contextPath }/index.jsp";
	</script>
</body>
</html>