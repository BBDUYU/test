<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>JeJu Main</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/blog/">

    
 
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
<script type="text/javascript">
function checkMsg(){
var msgCode = "${msgCode}";
if(msgCode != ""){
alert(msgCode);
}
}
</script>
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
      
      .container content, .container aside {
    position: relative;
  }

  figure {
    width: 100%;
    position: relative;
  }
  
  figure img {
    display: block;
    width: 100%;
    height: auto;
  } 
  figure h1 {
    position: absolute;
    top: calc(100% - 150px);
    left: 0;
    width: 100%;
    height: 150px;
    color: #fff;
    background: rgba(0, 0, 0, 0.6);
    margin: 0;
  } 
  figure .overlay {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    overflow: hidden;
    width: 100%;
    height: 0;
    color: #fff;
    background: rgba(0, 0, 0, 0.6);
        -webkit-transition: .6s ease;
        transition: .6s ease;
  }
  figure .overlay .description {
    font-size: 20px;
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    text-align: center;
  }
  
  figure:hover h1 {
    display: none;
  } 
  figure:hover .overlay {
    display: block;
    height: 100%;
  }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="blog.css" rel="stylesheet">
  </head>
  <body onload="checkMsg()">
   
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
	
		<!--  <input type="hidden" id="type" name="type" value="userid" />
	
		<input type="hidden" id="keyword" name="keyword" value="${userId}" />-->
		<input type="submit" class="btn btn-sm btn-outline-secondary" aria-current="page" id="search" onclick="tmpConsole()" value="위시리스트" />
	
	</form>
	
      <a class="btn btn-sm btn-outline-secondary" href="/cap/board/editUser">내 정보</a>
   <% } %> 
        
        
        <a class="btn btn-sm btn-outline-secondary" href="/cap/board/sup">고객센터</a>
        
      </div>
    </div>
  </header>

  
</div>

<main class="container">
    
  	 <div class="container">
  	    
  	 <figure>
      <img src="https://content.skyscnr.com/m/76ff7bd01e8159da/original/eyeem_116887427-jpg.jpg" class="rounded mx-auto d-block" alt="jeju" valign="absmiddle">
	  
      <h1 class="display-4 fst-italic" span style="font-family: 'Gamja Flower' !important;" >제주도<br>&nbsp;&nbsp;&nbsp;&nbsp;오늘은 어디가지?</h1> 
      <div class="overlay">
      <div class="description" span style="font-family: 'Gamja Flower' !important; font-size:50px">    
      익숙하게만 느껴졌던 제주,<p>
      새로운 경험을 위해
      </div>
      </div>
      </figure>
      
  	 	</div>   

  <div class="row mb-2">
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary"></strong>
          <h3 class="mb-0" span style="font-family: 'Gowun Dodum' !important;">반나절 투어</h3><br>
          <div class="mb-1 text-muted"></div>
          <p class="mb-auto" span style="font-family: 'Gowun Dodum' !important;">반나절 투어는 레저 및 체험 활동으로 반나절 동안 잊지 못할 경험을 하고 싶은 분들에게 추천합니다.</p><br>
           <p class="mb-auto" span style="font-family: 'Gowun Dodum' !important;">#오늘은 가볍게 #짧고 굵게 즐기자</p>
          
          <a href="/cap/board/hboard" class="stretched-link"></a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <img src="/cap/resources/images/half1.jpg" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text>
 
        </div>
      </div>
    </div> 
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-success"></strong>
          <h3 class="mb-0" span style="font-family: 'Gowun Dodum' !important;">하루 투어</h3><br>
          <div class="mb-1 text-muted"></div>
          <p class="mb-auto" span style="font-family: 'Gowun Dodum' !important;">하루 투어는 레저 및 체험 활동을 하루 종일 즐기고 싶은 레저 매니아 분들에게 추천합니다.</p><br>
           <p class="mb-auto" span style="font-family: 'Gowun Dodum' !important;">#하루종일 #패키지 여행</p>
            
          <a href="/cap/board/oboard"" class="stretched-link"></a> 
        </div>
        <div class="col-auto d-none d-lg-block">
            <img src="/cap/resources/images/one1.jpg"  width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
 				
        </div>
      </div>
    </div> 
  </div>



</main>




 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
  </body>
</html>
