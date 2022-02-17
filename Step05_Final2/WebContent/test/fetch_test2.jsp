<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/fetch_test.jsp</title>
</head>
<body>
<a href="get_msg2.jsp">이동하기</a>
<button id="myBtn">눌러보셈</button>
<script>
	document.querySelector("#myBtn").addEventListener("click",function(){
		fetch("get_msg2.jsp")
		.then(function(response){
			/*
				서버에서 응답한 문자열이 json 형식이면 response.json() 을 호출해서 리턴하고
				그 이외의 형식이면 response.text() 을 호출해서 리턴해주어야 한다.
			*/
			return response.json();
		})
		.then(function(data){
			/*
				위의 함수에서 response.json() 을 호출해서 리턴했다면 data는 object 혹은 array 이다.
				위의 함수에서 response.text() 을 호출해서 리턴했다면 data는 string(서버가 응답한 문자열)이다.
			*/
			console.log(data);
		}).catch(function(data){
			//data는 에러메세지 이다.
			console.log(data);
		});
		
		console.log("get_msg2.jsp 에 요청을 했습니다.")
	});
</script>
</body>
</html>