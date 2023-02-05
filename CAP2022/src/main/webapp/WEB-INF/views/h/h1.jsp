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
    <title>h1</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/album/">
	  
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
	<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">    
	<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>    
	<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
    

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<script type='text/javascript'>   
$(function(){        
	$('.input-group.date').datepicker({            
		calendarWeeks: false,            
		todayHighlight: true,            
		autoclose: true,            
		format: "yyyy/mm/dd",           
		language: "kr"        
		});    
	});    
	
</script>
 
<meta name="theme-color" content="#7952b3">


    <style>
    body {
        width: 100%;
        height: 100%;
        padding: 30px;
        margin: 0;
    }

    #contact_map {
        width: 800px;
        height: 500px;
    }

    #contact_map iframe {
        width: 100%;
        height: 100%;
        border:0;
    }
    
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
      
    </style>

    
  </head>
  
  <body>
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
      <a class="btn btn-sm btn-outline-secondary" href="/cap/board/editUser">내 정보</a>
   <% } %>
        
        
        <a class="btn btn-sm btn-outline-secondary" href="/cap/board/sup">고객센터</a>
        
      </div>
    </div>
  </header>
  </div>
<main>
<section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">상품명</h1>
        
      </div>
    </div>
  </section>
<div class="album py-5 bg-light">
 
<div class="container">

  <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://content.skyscnr.com/m/76ff7bd01e8159da/original/eyeem_116887427-jpg.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdKPw0j%2FbtrAOBDFTxb%2FFheVyzxQlNXP0lgur6cCm0%2Fimg.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://content.skyscnr.com/m/76ff7bd01e8159da/original/eyeem_116887427-jpg.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<ol class="list-group list-group-numbered">
  <li class="list-group-item d-flex justify-content-between align-items-start">
    <div class="ms-2 me-auto">
      <div class="fw-bold">상품명</div>
      상품설명
    </div>
    
  </li>
   <li class="list-group-item">날짜선택
   				<div class="input-group date">
              
              <input type=text class="form-control" id='birth' name='birthday' required numeric value=''>
              <span class="fieldError"><form:errors path="birthday"/></span>
              
              <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				
				</div></li>
   <li class="list-group-item">가격</li>
   <li class="list-group-item">인원선택
   
   <button type="button" class="minus" >-</button>
   <input type="number" class="numBox" min="1" max="10" value="1" readonly="readonly"/>
   <button type="button" class="plus" >+</button>
	 <script>
	  $(".plus").click(function(){
	   var num = $(".numBox").val();
	   var plusNum = Number(num) + 1;
	   
	   if(plusNum > 10) {
	    $(".numBox").val(num);
	   } else {
	    $(".numBox").val(plusNum);          
	   }
	  });
	  
	  $(".minus").click(function(){
	   var num = $(".numBox").val();
	   var minusNum = Number(num) - 1;
	   
	   if(minusNum <= 0) {
	    $(".numBox").val(num);
	   } else {
	    $(".numBox").val(minusNum);          
	   }
	  });
	 </script>

   </li>
  </ol>
  <div class="accordion" id="accordionPanelsStayOpenExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
        이용안내
      </button>
    </h2>
    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
      <div class="accordion-body">
        <strong>이용 시간</strong> <br>- 10:30 ~ 18:00 (입장마감 17:30)<br>- 연중무휴<br>
      	<strong>위치 안내</strong> <br>
      	 <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6338.834159223863!2d126.91893155291746!3d37.40361559050426!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b60dab5220ea1%3A0x3df67490412ac66b!2z7JWI7JaR!5e0!3m2!1sko!2skr!4v1659764459232!5m2!1sko!2skr" 
      		width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

      	
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
        취소 및 환불 규정
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
      <div class="accordion-body">
        <strong>- 유효기간 내 취소/환불 가능<br>
- 미사용 티켓 100% 환불가능<br>
- 사용한 티켓 환불 불가<br>
- 부분 환불 불가
(ex. 2장 구매 후 1장만 환불 불가 / 전체 취소 후 재구매)<br>
- 패키지 상품의 경우 관광지 중 1개라도 사용시 환불 불가</strong>
      </div>
    </div>
  </div>
  
</div>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
<%if(session.getAttribute("userId") == null){ %>
     <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  예약하기
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>로그인 후 이용 가능하신 서비스입니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="location.href='/cap/board/login' ">로그인하러 가기</button>
      </div>
    </div>
  </div>
</div>
   <% } %>
   
<%if(session.getAttribute("userId") != null){ %>
    <button type="button" class="btn btn-primary btn-lg" onclick="location.href='hreserve' ">예약하기</button>
   <% } %>
</div>


</div>

</div>
</main>

<footer class="text-muted py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
    <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="/docs/5.1/getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>


 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
  </body>
</html>
