<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="member" name="thisPage"/>
	</jsp:include>
	<nav>
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/">Home</a></li>
	    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a></li>
	    <li class="breadcrumb-item active">회원 추가</li>
	  </ol>
	</nav>
	<div class="p-3 mb-2 bg-success text-white">
	<h1>회원 추가 양식</h1>
	</div>
	<div>
   		<div class="col-lg-6">
   			<form action="insert.jsp" method="post">
      			<div class="mb-2">
         			<label class="form-label" for="name">이름</label>
         			<input class="form-control" type="text" name="name" id="name"/>
      			</div>
      			<div class="mb-2">
         			<label class="form-label" for="addr">주소</label>
         			<input class="form-control" type="text" name="addr" id="addr"/>
      			</div>
      			<button class="btn btn-primary" type="submit">
					<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
						<path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
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
	</div>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>