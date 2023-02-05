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
    <a class="nav-link active" aria-current="page" href="/cap/board/sup">자주묻는질문</a>
  </li>
  <li class="nav-item">
 <%if(session.getAttribute("userId") != null && !"manager".equals(session.getAttribute("userId"))){ %>     
     
	     <form action="qna" modelAttribute="searchVO" method="get">
	
	<input type="hidden" id="type" name="type" value="writerId" />
	<input type="hidden" id="keyword" name="keyword" value="${userId}" />
	<input type="submit" class="nav-link" aria-current="page" id="search" value="1:1질문" />
	
	</form>
     
     <%} %>
           <%if("manager".equals(session.getAttribute("userId"))){ %>
                <a class="nav-link " href="/cap/board/qna">답변하기</a>
          <%} %>
     
  </li>
</ul>
    
   

  
    <div class="col-12">
      <div class="accordion" id="accordionPanelsStayOpenExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
        하루 투어와 반나절 투어의 차이점은 무엇인가요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
      <div class="accordion-body">
        <strong>하루 투어는 하루 동안 레저 체험을 통해 하루 종일 알차고 재밌는 시간을 보낼 수 있는 상품이고 반나절 투어는 오전 또는 오후 중에 원하는 레저 상품을 선택하여 짧지만 의미 있는 활동을 하고 싶은 분들께 추천하는 상품입니다. </strong>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
        예약을 취소하고 싶어요.
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
      <div class="accordion-body">
        <strong>예약취소는 로그인 > 내정보 > 예약관리에서 직접 가능합니다. </strong> 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
회원정보 수정은 어떻게 하나요?
      </button>
    </h2>
    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
      <div class="accordion-body">
        <strong>회원정보 수정은 로그인 후 페이지 상단 내정보에서 수정이 가능합니다.</strong>
      </div>
    </div>
  </div>
</div>
      
        
   
      </div>
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
