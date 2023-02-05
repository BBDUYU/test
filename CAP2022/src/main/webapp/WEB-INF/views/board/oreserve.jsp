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
	<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">    
		<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
		<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>    
	
    

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


 
<meta name="theme-color" content="#7952b3">


    <style>
    
    .exam{ width:50% !important;}
    
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
   <script>

   $(function(){

	   $('button.num_btn').on('click',function(){
		   
	             var cnt = $("input.num_sum").length;     
	             console.log(cnt);
	             
	     for( var i=1; i< cnt; i++){
	        var sum = parseInt($(this).val() || 0 );
	        sum++
	       console.log(sum);
	     }
	     
	               var sum1 = parseInt($("#price").val() ); 
	               var sum2 = parseInt($("#num").val());
	               
	              

	               var sum = sum1 * sum2 
	               console.log(sum);
	               $("#total").val(sum);
	           });


	    
	   });
</script>
  
   
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

  
  
  
  <%
	String numBox = request.getParameter("numBox");
	String date = request.getParameter("date");

%>
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
      <form modelAttribute="oresVO" name="join" Action='oreserve' method="post"  enctype="multipart/form-data">
  
<main span style="font-family: 'Gowun Dodum' !important;">

<div class="container">
<div class="row mb-2">
 <div class="col-md-8">
    <div class="col">
      상품명
       <div class="p-3 border bg-light">
       <div>
       <img src="<c:url value='/resources/images/${one.img1}'/>" width="150" height="150" >
       <span class="mb-0" style="vertical-align:top;font-size:30px">${one.name}</span>
       <p class="price" style="vertical-align:bottom;font-size:20px;text-align:right;" >상품가격: ${one.price}원</p>
       <input type='hidden' class="price" size=10 id="price" name="price" value="${one.price}" readonly="readonly" onKeyUp=calculationtest(); required >
       
       </div>
       <input type='hidden' class="name" size=30 id="name" name="name" value="${one.name}" readonly="readonly" required >
       
        </div>
       <input type="hidden" id="ono" name="ono" value="${one.ono}" required />
       <input type="hidden" id="username" name="username" value="${userName}" required/> <!– 세션변수 ->
  	   <input type="hidden" id="userid" name="userid" value="${userId}" required />
       
    </div>
   
    <div class="col">
      인원
       <div class="p-3 border bg-light">
   <button type="button" class="minus num_btn" >-</button>
   <input type="text"  size=5  id="num" name="num" class="numBox" min="1" max="10" value="" readonly="readonly" onKeyUp=calculationtest(); required>
   <button type="button" class="plus num_btn" >+</button>
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
   </div>
    </div>
    <div class="col">
      날짜
      <div class="p-3 border bg-light">
       <div class="input-group date">
              
      <input type=text size=10 class="form-control" id="resdate" name="resdate" required numeric value='' required>
      <span class="fieldError"><form:errors path="birthday"/></span>
              
      <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				
	  </div>
	  </div>
	  
    </div>
   
 
  
  
  
 </div>

 
    
    
 
  
 


  
   <div class="col-md-4">
    <div class="col">
      총 금액
      <div class="p-3 border bg-light">
     <input type='text' class="form-control text-right font-weight-bold num_only num_comma num_sum" id="total"  name="total" numeric value="" placeholder="" size='7' readonly="readonly" required >
      
      <footer class="text-muted py-5">
  <div class="container">
    <p class="float-end mb-1">
     <button class="btn btn-lg btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">예약하기</button>
     <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">예약확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        예약 하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary">예약하기</button>
      </div>
    </div>
  </div>
</div>





     </div>
</footer>
      
      
      
      </div>    
    </div>
  
  </div>
  
  
  
  
  
  
  
</div>
</main>


   
   </form>




 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

      
  </body>
</html>
