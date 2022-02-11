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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/">Home</a></li>
			    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a></li>
			    <li class="breadcrumb-item active">회원정보 수정</li>
			</ol>
		</nav>
		<div class="p-3 mb-2 bg-primary text-white">
			<h1>회원정보 수정 폼</h1>
		</div>
		<form action="update.jsp" method="post">
   		<!-- 수정할 회원의 primary key는 input type="hidden"을 이용해서 폼 전송한다. -->
   		<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
		<div>
         <label class="form-label" for="name">번호</label>
         <!-- 번호는 primary key 니까 수정 못하도록하고 -->
         <input class="form-control" type="text" name="name" id="name" value="<%=dto.getNum()%>"disabled/>
		</div>
	      <div>
	         <label class="form-label" for="name">이름</label>
	         <input class="form-control" type="text" name="name" id="name" value="<%=dto.getName()%>"/>
	      </div>
	      <div>
	         <label class="form-label" for="addr">주소</label>
	         <input class="form-control" type="text" name="addr" id="addr" value="<%=dto.getAddr()%>"/>
	      </div>
      <button class="btn btn-primary" type="submit">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
					<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
				</svg>
			</button>
			<button class="btn btn-secondary" type="reset">
				<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
                    <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
				</svg>
			</button>
   </form>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
