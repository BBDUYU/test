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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/checkout/">
	  
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
	<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">    
	<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>    
	<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
	
	
	
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

	<script type="text/javascript">
	function formCheck() {
	if (writeForm.title.value.length < 1){
	alert("제목을 입력하세요.");
	writeForm.title.focus();
	return false;
	} 
	if (writeForm.content.value.length < 1){
	alert("내용을 입력하세요.");
	writeForm.content.focus();
	return false;
	}
	return true;
	}
	</script> 

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
  <body class="bg-light" onload="checkMsg()">
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
      <img class="d-block mx-auto mb-4" src="#" alt="" width="72" height="57">
      <h2>상품등록</h2>
    </div>
 
    
    <form modelAttribute="oneVO" name="join" method='post'  Action='owrite' onsubmit='return Check_Form()' enctype="multipart/form-data" >
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="firstName" class="form-label">상품명</label>
              <input type="text" class="form-control" id='name' name="name" placeholder="NAME" required>
              <span id="message"></span>
            </div>

            

            <div class="col-12">
              <label for="pwd" class="form-label">가격</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="price" placeholder="Price" required>
             
              </div>
            </div>
            
            <div class="col-sm-6">
              <label for="firstName" class="form-label">상세상품명(1)</label>
              <input type="text" class="form-control"  name="detail1" placeholder="NAME" required>
              <span id="message"></span>
            </div>
			<div class="col-12">
              <label for="name" class="form-label">이용시간(1)</label>
              <textarea type="text" class="form-control" name="time1" placeholder="TIME" required></textarea>  
              <span class="fieldError"></span>
                
            </div>
            
            <div class="col-12">
              <label for="email" class="form-label">위치(1)</label>
              <input type="text" class="form-control" name="place1" placeholder="LINK" required>
              <span class="fieldError"></span> 

            </div>
            
            
   
   
   			 <div class="col-sm-6">
              <label for="firstName" class="form-label">상세상품명(2)</label>
              <input type="text" class="form-control" id='name' name="detail2" placeholder="NAME" required>
              <span id="message"></span>
            </div>
			<div class="col-12">
              <label for="name" class="form-label">이용시간(2)</label>
              <textarea type="text" class="form-control" name="time2" placeholder="TIME" required></textarea>  
              <span class="fieldError"></span>
                
            </div>
            
            <div class="col-12">
              <label for="email" class="form-label">위치(2)</label>
              <input type="text" class="form-control" name="place2" placeholder="LINK" required>
              <span class="fieldError"></span> 

            </div>
            
            
			<div class="col-12">
              <label for="email" class="form-label">취소환불규정</label>
              <textarea class="form-control" name="cancel" placeholder="취소환불규정" required></textarea>
              <span class="fieldError"></span>

            </div>
            
            <div class="col-sm-6">
              <label for="phone" class="form-label">이미지1</label>
             <input name="img_1" id="egovComFileUploader" type="file" title="첨부파일" />
              <span class="fieldError"></span>
          
            </div>
            <div class="col-sm-6">
              <label for="phone" class="form-label">이미지2</label>
             <input name="img_2" id="egovComFileUploader" type="file" title="첨부파일" />
              <span class="fieldError"></span>
          
            </div>
                        <div class="col-sm-6">
             <label for="phone" class="form-label">상품정보 이미지첨부</label>
             <input name="file_1" id="egovComFileUploader" type="file" title="첨부파일" />
    		 <div id="egovComFileList"></div>
            
            </div>
            <div class="col-12">
              <label for="email" class="form-label">상품정보</label>
              <textarea type="text" class="form-control" name="content" placeholder="상품정보" required></textarea>
              <span class="fieldError"></span>

            </div>
            

            

            

          


          

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">상품등록</button>
        </form>


  
    
    </div>
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017–2022 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>


 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      <script src="form-validation.js"></script>
      
  </body>
</html>
