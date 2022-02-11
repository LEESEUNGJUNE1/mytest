<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=10;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=10;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
	   //숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
	   pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//startRowNum 과 endRowNum 을 MemberDto 객체에 담고
	MemberDto dto=new MemberDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//MemberDao 객체의 참조값을 얻어와서
	MemberDao dao=MemberDao.getInstance();
	//회원 목록 얻어오기 
	List<MemberDto> list=dao.getList(dto);
	
	//하단 시작 페이지 번호 
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	
	//전체 row 의 갯수
	int totalRow=MemberDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//출력할 끝 페이지 번호가 전체 페이지 갯수보다 크게 계산된거라면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount; //보정해준다.
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<%--
	include 된 jsp 페이지에 필요한 파라미터를 include 할때 전달할수 있다.
	
	<jsp:param value="전달할 문자열" name="파라미터명"/>
	
	이렇게 전달한 정보는 HttpServletRequest 객체에 파라미터 정보로 저장이 되기 때문에
	
	include 된 jsp 페이지에서 request.getParameter("파라미터명") 과 같은 방법으로 해당 문자열을 추출할 수 있다.
 --%>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="member" name="thisPage"/>
</jsp:include>
	<div class="container">
	<nav>
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }">Home</a></li>
	    <li class="breadcrumb-item active">회원목록</li>
	  </ol>
	</nav>
	<div class="p-3 mb-2 bg-secondary text-white">
	<h1>회원 목록 입니다.</h1>
	</div>
	<a href="insertform.jsp" style="font-size:2rem; color:green;">
		<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
  			<path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  			<path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
		</svg>
	</a>
	<table class="table table-info table-striped table-hover">
		<thead class="table-dark">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%for(MemberDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getAddr() %></td>
				<td>
							<a href="updateform.jsp?num=<%=tmp.getNum() %>" style="font-size:1rem; color:sky;">수정
								<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
						  			<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
								</svg>
							</a>
						</td>
						<td>
							<a href="delete.jsp?num=<%=tmp.getNum() %>" style="font-size:1rem; color:pink;">삭제
								<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-calendar-x" viewBox="0 0 16 16">
								  <path d="M6.146 7.146a.5.5 0 0 1 .708 0L8 8.293l1.146-1.147a.5.5 0 1 1 .708.708L8.707 9l1.147 1.146a.5.5 0 0 1-.708.708L8 9.707l-1.146 1.147a.5.5 0 0 1-.708-.708L7.293 9 6.146 7.854a.5.5 0 0 1 0-.708z"/>
								  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
								</svg>
							</a>
						</td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<ul class="pagination">
		<%if(startPageNum != 1){ %>
		<li class="page-item">
			<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>">&laquo;</a>
		</li>
		<%}else{ %>
			<li class="page-item disabled">
				<span class="page-link">&laquo;</span>
			</li>
		<%} %>
      <%for(int i=startPageNum; i<=endPageNum ; i++){ %>
         <li class="page-item <%= i==pageNum ? "active":"" %>">
            <a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
         </li>
      <%} %>
      <%if(endPageNum < totalPageCount){ %>
      <li class="page-item">
      	<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>">&raquo;</a>
      </li>
      <%}else{ %>
      	<li class="page-item disabled">
			<span class="page-link">&raquo;</span>
		</li>
      <%} %>
   </ul>
   <p> &gt; &lt; &laquo; &raquo; &larr; &rarr; &amp; &quot; &nbsp; </p>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>