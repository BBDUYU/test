<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>고객센터</title>
	
	<link href="${pageContext.request.contextPath}/resources/css/board.css" rel="stylesheet" type="text/css" />
	
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/checkout/">
	  
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
	<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">    
	<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>    
	<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
	

  <script type="text/javascript">
	
	
	function moveAction(where){
	  switch (where) {
	case 1:
	if(confirm("글을 삭제하시겠습니까?")){
		location.href ="delete?bno=${board.bno}";
	}
	break;

	case 2:
	if(confirm("글을 수정하시겠습니까?")){
		location.href = "modify?bno=${board.bno}";
	}
	break;

	  }
	 
	  }
	</script>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Brush+Script&display=swap" rel="stylesheet">


<meta name="theme-color" content="#7952b3">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .input-group-btn{white-space:nowrap;vertical-align:middle}
    </style>

    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light" onload="errCodeCheck()">
  <div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <a class="link-secondary" href="#"></a>
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="/cap/board/main">하루살이</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="link-secondary" href="#" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
        </a>
        <%if(session.getAttribute("userId") == null){ %>
      <a class="btn btn-sm btn-outline-secondary" href="/cap/board/login">Login</a>
   <% } %>
   
        <%if(session.getAttribute("userId") != null){ %>
     <a class="btn btn-sm btn-outline-secondary" href="/cap/board/logout">Logout</a>
<form action="wishlist" modelAttribute="searchVO" method="get">
	
		<input type="hidden" id="type" name="type" value="userid" />
	
		<input type="hidden" id="keyword" name="keyword" value="${userId}" />
		<input type="submit" class="btn btn-sm btn-outline-secondary" aria-current="page" id="search" onclick="tmpConsole()" value="위시리스트" />
	
	</form>     
      <a class="btn btn-sm btn-outline-secondary" href="/cap/board/editUser">내 정보</a>
   <% } %>
        
        
        <a class="btn btn-sm btn-outline-secondary" href="/cap/board/sup">고객센터</a>
        
      </div>
    </div>
  </header>

  
</div>
  
  
  
<div class="container">

   <main span style="font-family: 'Gowun Dodum' !important;">
  <div class="py-5 text-center">
      <h2>고객센터</h2>
    </div>
  <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" aria-current="page" href="/cap/board/sup">자주묻는질문</a>
  </li>
  <li class="nav-item">
     <%if(session.getAttribute("userId") != null && !"manager".equals(session.getAttribute("userId"))){ %>
    <form action="qna" modelAttribute="searchVO" method="get">
	
	<input type="hidden" id="type" name="type" value="writerId" />
	
	<input type="hidden" id="keyword" name="keyword" value="${userId}" />
	<input type="submit" class="nav-link active" aria-current="page" id="search" onclick="tmpConsole()" value="1:1질문" />
	
	</form>
     <li>
     <a class="nav-link " href="/cap/board/qnaForm">문의하기</a>
     </li>
     <%} %>
      <%if("manager".equals(session.getAttribute("userId"))){ %>
           <a class="nav-link active" href="/cap/board/qna">답변하기</a>
     <%} %>
  </li>
</ul>
    

<table border="0" class="table">
<tr>
</tr>
<tr>
<th>제목</th>
<th>작성자</th>
<th>작성일</th>
</tr>
<tr>
<td>${board.title}</td>
<td>${board.writerId}</td>
<td>${board.regDate}</td>
</tr>
<tr>
      <th colspan="4">내용</th>
</tr>
<tr>
<td >첨부파일</td>
<td colspan="4" align="left" >
<c:forEach var="file" items="${fileList}">
         <a href="filedown?fileName=${file.ofilename}" class="fileview">
		<font size="2px">${file.ofilename}</font>
         <font size="2px">(${file.filesize} byte)</font><br> </a> 
</c:forEach>
<c:if test="${empty fileList}">
       <font color="#A6A6A6" size="2px"> 첨부된 파일이 없습니다. </font>
</c:if>
</td>
</tr>
<tr>
<td colspan="4" align="left"><p>${board.content}</p><br /><br />
<c:if test="${board.writerId != userId}">
  <p align="center" > <a href="#" onclick="moveAction(4)">
  <span><small style="color:red" >:${message}</small></span> </p>
</c:if>
</td>
</tr>
</table>
<table border="0" class="table">
<tr>
      <th colspan="4">답변</th>
</tr>
<tr>
<c:forEach var="reply" items="${replyList}">
<th>작성일</th>
<td>${reply.regDate}</td>
</tr>



<td colspan="4" align="left"><p>${reply.content}</p><br/><br/>
<c:if test="${reply.writerId != userId}">
 
</c:if></td>

</tr>
</c:forEach>
</table>

<br/>
<c:choose>
   <c:when test="${board.writerId == userId}">
   <input type="button" value="삭제" class="writeBt" onclick="moveAction(1)" />
   <input type="button" value="수정" class="writeBt" onclick="moveAction(2)" />
</c:when>

</c:choose>

<br>

           <%if("manager".equals(session.getAttribute("userId"))){ %>

<tr><td class="writer"><strong>답변 작성</strong></td>
<td class="content">
<form  modelAttribute="replyVO" action="writeReply" method="post">
<input type="hidden" id="writer" name="writer" value="${userName}" />
<input type="hidden" id="writerId" name="writerId" value="${userId}" />
<input type="hidden" id="bno" name="bno" value="${board.bno}" />
<div class="mb-3">
<textarea id="exampleFormControlTextarea1" rows="3" name="content" class="form-control"></textarea>
</div>
<input type="submit" value="확인" class="commentBt" />
</form>
</td></tr>
 <%} %>
</div>
</body>
</html>



