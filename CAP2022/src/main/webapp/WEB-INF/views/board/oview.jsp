<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
  <head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>h1</title>

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
    
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

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Brush+Script&display=swap" rel="stylesheet">



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
 <script type="text/javascript">  
	function errCodeCheck(){
		var errCode = <%=request.getParameter("errCode")%>;
		if(errCode != null || errCode != ""){
		switch (errCode) {
		case 1:
			alert("댓글 내용이 없습니다!");
			break;
		case 2:
			alert("이미 위시리스트에 등록된 상품입니다");
			break;
		case 3:
			alert("자기 글은 추천할 수 없습니다.!");
			break;
		case 4:
			alert("로그인하셔야 추천할 수 있습니다.!");
			break;
			}
		}
	}
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

	case 3:
		location.href = "list";
	break;

	case 4:
	if(confirm("위시리스트에 추가하시겠습니까?")){
		location.href = "hview?hno=${half.hno}";
	}
	break;
	  }
	}



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
       .bi-heart{
            font-size: 30px;
            line-height: 30px;
            color:crimson;
        }

        .bi-heart-fill{
            font-size: 30px;
            line-height: 30px;
            color:crimson;
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
<main span style="font-family: 'Gowun Dodum' !important;">
<section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light" >${one.name}</h1>
        
      </div>
    </div>
  </section>
<div class="album py-5 bg-light">
 
<div class="container">

  <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
       <img src="<c:url value='/resources/images/${one.img1}'/>" height="600" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<c:url value='/resources/images/${one.img2}'/>" height="600" class="d-block w-100" alt="...">
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
      <div class="fw-bold">${one.name}</</div>
      
    </div>
    
  </li>
  
	   
   <li class="list-group-item">${one.price}원</li>
   
   
  </ol>
  <div class="accordion accordion-flush" id="accordionFlushExample">
  <div class="accordion-item" style="text-align : center;">
    <h2 class="accordion-header" id="panelsStayOpen-headingZ">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseZ" aria-expanded="true" aria-controls="panelsStayOpen-collapseZ">
        상품정보
      </button>
    </h2>
    <div id="panelsStayOpen-collapseZ" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingZ">
      <div class="accordion-body">
       
      	 <img src="<c:url value='/resources/images/${one.picture}' />"  width="720" alt="">
      	<br>
      	<br>
      	<br>
		 ${one.content}
      	
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
        ${one.detail1}의 이용안내
      </button>
    </h2>
    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
      <div class="accordion-body">
        <strong>이용 시간</strong> <br>${one.time1}<br>
      	<strong>위치 안내</strong> <br>
      	 <iframe src="${one.place1}" 
      		width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

      	
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
        ${one.detail2}의 이용안내
      </button>
    </h2>
    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
      <div class="accordion-body">
        <strong>이용 시간</strong> <br>${one.time2}<br>
      	<strong>위치 안내</strong> <br>
      	 <iframe src="${one.place2}" 
      		width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

      	
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
		후기
      </button>
    </h2>
    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
      <div class="accordion-body">
       <div class="col-12">
	      
	              <div class="row mb-2">
	      <c:forEach var="ore" items="${oreviewList}">
	        
	
	         <div class="col-md-6">
	      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
	        <div class="col p-4 d-flex flex-column position-static">
	          <h3 class="mb-0">${ore.title}</h3>
	          <div class="mb-1 text-muted">${ore.regdate}</div>
	          <input type="hidden" id="userid" name="userid" value="${ore.userid}" required />
	         
	          <p class="card-text mb-auto">${ore.content}</p>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			 </div>
	        </div>   
	            
	      </div>
	    </div>
	    
	    
	    
	   
	    
	    </c:forEach>
	        </div>
	    
	      </div>
      </div>
    </div>
    
    
    
  </div>
</div>

<div class="d-grid gap-2 d-md-flex justify-content-md-end">
<%if(session.getAttribute("userId") != null){ %>
                    
                    <form name="owish" action="owish" method="post" onsubmit="return errCodeCheck()">
                	<input type="hidden" id="userid" name="userid" value="${userId}" />
                	<input type="hidden" id="ono" name="ono" value="${one.ono}" />
                	<input type="hidden" id="img1" name="img1" value="${one.img1}" />
                    <input type="hidden" id="name" name="name" value="${one.name}" />
                    <input type="hidden" id="price" name="price" value="${one.price}" />
                    
                 
                 
    				<button class="btn btn-outline-light" id="liveToastBtn">
    				<a href="#" onclick="moveAction(4)">
    				<i class="bi bi-heart">    					
    				</i>
    				</a>
    				 </button>
    				
    				
    				<script>
					    var i = 0;
					    $('.bi-heart').on('click',function(){
					        if(i==0){
					            $(this).removeClass('bi-heart');
					            $(this).addClass('bi-heart-fill');
					            i++;
					        }else if(i==1){
					            $(this).removeClass('bi-heart-fill');
					            $(this).addClass('bi-heart');
					            i--;
					        }
					        
					    });
					
					</script>
					
					</form>
					 <% } %>
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


	
	
    <button type="button" class="btn btn-primary btn-lg" onclick="location.href='/cap/board/oreserve?ono=${one.ono}' " >예약하기</button>
   <% } %>
   
</div>
	
	   
	   
	   <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
        취소 및 환불 규정
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
      <div class="accordion-body">
        <strong>${one.cancel}</strong>
      </div>
    </div>
  </div>
	   
	   
	   

</div>

</div>

</main>





   
   
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   
  </body>
</html>
