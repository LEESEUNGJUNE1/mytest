<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/gura_util.jsp</title>
</head>
<body>
   <h1>gura_util.js 테스트</h1>
   <form action="send.jsp" method="post" id="myForm">
      <input type="text" name="msg" placeholder="할말 입력..."/>
      <button type="submit">전송</button>
   </form>
   
   <br />
   
   <button id="sendBtn">눌러보셈</button>
   
   <br />
   <input type="text" name="msg" placeholder="할말 입력..." id="msg"/>
   <button id="sendBtn2">전송</button>
   
   <script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
   <script>
      //위의 폼에 submit 이벤트가 일어 났을때 실행할 함수 등록 
      document.querySelector("#myForm").addEventListener("submit", function(e){
         //폼 제출을 막아준다.
         e.preventDefault();
         //form 에 입력한 내용을 ajax 로 전송하기(페이지 전환없이)
         //ajaxFormPromise(document.querySelector("#myForm"));
         //ajaxFormPromise(this);
         ajaxFormPromise(this)
         .then(function(response){
            return response.text();
         })
         .then(function(data){
            alert(data);
         });
      });
      
      //폼 없이 특정시점(페이지 로딩시)에 ajax 로 어떤 문자열을 전송하고 싶다면 ?
      ajaxPromise("send.jsp", "post", "msg=나야나");
      ajaxPromise("send.jsp", "post", {msg:"오잉?"});
      
      //폼 없이 특정시점(버튼을 누른시점)에 ajax 로 어떤 문자열을 전송하고 싶다면 ?
      document.querySelector("#sendBtn").addEventListener("click", function(){
         ajaxPromise("send.jsp", "post", "msg=버튼을눌렀음");
      });         
         
      //폼 없이  특정시점(버튼을 누른시점)에  input 요소에 입력한 정보를(파일도가능) ajax 로 전송하고 싶다면 ?
      document.querySelector("#sendBtn2").addEventListener("click", function(){
         //input 요소의 참조값
         let myInput=document.querySelector("#msg");
         ajaxInputPromise("send.jsp", myInput)
         .then(response => response.text())
         .then(data => {
            alert(data);
         });
      });   
      
      // javascript 화살표함수 (arrow function )  궁금하면 검색해 보기
      
   </script>
</body>
</html>