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
   <h1>회원 추가 양식</h1>
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
      			<button type="submit">추가</button>
   			</form>
   		</div>
   </div>
</div>
</body>
</html>