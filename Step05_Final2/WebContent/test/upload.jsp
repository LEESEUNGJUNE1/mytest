<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 파일을 저장할 서버에서의 실제 경로 구성하기
	String realPath=application.getRealPath("/upload");
	System.out.println("realPath:"+realPath);
	//2. 아래 객체가 예외 발생없이 잘 생성되면 upload 폴더에 파일이 저장된것이다.
	MultipartRequest mr = new MultipartRequest(request,
			realPath,
			1024*1024*50,
			"utf-8",
			new DefaultFileRenamePolicy());
	//3. MultipartRequest 객체의 메소드를 이용해서 폼 전송된 내용을  추출해야한다.
	String msg=mr.getParameter("msg");
	String orgFileName=mr.getOriginalFileName("myFile");//원본 파일명
	String saveFileName=mr.getFilesystemName("myFile");//저장된 파일명
	long fileSize=mr.getFile("myFile").length();//파일의 크기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/upload.jsp</title>
</head>
<body>
	<p>
		upload 폴더의 실제 경로 : <strong><%=realPath %></strong>
	</p>
	<p>
		할말 : <strong><%=msg %></strong>
	</p>
	<p>
		원본 파일명 : <strong><%=orgFileName %></strong>
	</p>
	<p>
		저장된 파일명 : <strong><%=saveFileName %></strong>
	</p>
	<p>
		파일크기 : <strong><%=fileSize %></strong>
	</p>
</body>
</html>