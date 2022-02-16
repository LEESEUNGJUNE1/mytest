<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/upload_form.jsp</title>
</head>
<body>
<form action="upload.jsp" method="post" enctype="multipart/form-data">
   <input type="text" name="msg" placeholder="메세지 입력..."/>
   <br />
   <input type="file" name="myFile" id="myFile"/>
   <br />
   <button type="submit">업로드</button>
</form>
<p>선택한 파일의 의 크기 : <strong id="fileSize"></strong></p>
<script>
   // input type="file" 요소의 참조값
   let myFile=document.querySelector("#myFile");
   
   myFile.addEventListener("change", function(){
      //선택한 파일 객체의 참조값 얻어오기 
      let file=myFile.files[0];
      //파일의 크기 출력해 보기 
      document.querySelector("#fileSize").innerText=file.size;
   });
</script>
</body>
</html>