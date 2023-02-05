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
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <title>HALF</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/album/">


 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    

    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Brush+Script&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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
       .input[type="submit"]{font-family: FontAwesome;
       }
    </style>
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
<script>	  
	function errCodeCheck(){
		var errCode = <%=request.getParameter("errCode")%>;
		if(errCode != null || errCode != ""){
		switch (errCode) {
		case 1:
			alert("댓글 내용이 없습니다!");
			break;
		case 2:
			alert("이미 위시리스트에 등록된 상품입니다");
			location.href ="hboard";
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
		location.href = "hboard?hno=${half.hno}";
	}
	break;
	  }
	}



	</script> 
  
  </head>
  <body onload="errCodeCheck()">
  
  
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
	
	</form>      <a class="btn btn-sm btn-outline-secondary" href="/cap/board/editUser">내 정보</a>
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
        <h1 class="fw-light" span style="font-family: 'Gowun Dodum' !important; font-size:80px" >반나절 투어</h1>
        <p class="lead text-muted" span style="font-family: 'Gowun Dodum' !important; font-size:30px">반나절 투어는 레저 및 체험 활동으로 반나절 동안 잊지 못할 경험을 하고 싶은 분들에게 추천합니다.</p>
        
      </div>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
     
      <c:forEach var="h" items="${hList}">
      
        <div class="col">
          <div class="card shadow-sm">
          <a href="hview?hno=${h.hno}" >
            <img src="<c:url value='/resources/images/${h.img1}'/>" href="hview?hno=${h.hno}" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
			</a>
            <div class="card-body">
              <p class="card-text" span style="font-family: 'Gowun Dodum' !important;font-size:18px">${h.name}</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
               
        			<form name="bwish" action="bwish" method="post" onsubmit="return errCodeCheck()">
                		
                	 <input type="hidden" id="hno" name="hno" value="${h.hno}" />
                	 <input type="hidden" id="userid" name="userid" value="${userId}" />
                	 <input type="hidden" id="img1" name="img1" value="${h.img1}" />
                     <input type="hidden" id="name" name="name" value="${h.name}" />
                     <input type="hidden" id="price" name="price" value="${h.price}" />	                
		                <div class="d-grid gap-2 d-md-flex justify-content-md-end"> 
		                 <%if(session.getAttribute("userId") != null){ %>            
		                  <button  class="btn btn-outline-light" id="liveToastBtn">
		                   	<a href="#" onclick="moveAction(4)">	          
		    				<i class="bi bi-heart"> </i>
		    				<script>
							    var i = 0;
							    $('.bi-heart').hover(function(){
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
		    				  	
		    				</a>			
		    				 </button>
		    				 <% } %>
		    				 </div>
    				 </form>
    				 
                </div>
                <small class="text-muted" span style="font-family: 'Gowun Dodum' !important;">${h.price}</small>
              </div>
                
            </div>
          </div>
        </div>
        </c:forEach>
        
         

        
        
      </div>
      <br>
      <div class="d-grid gap-2 d-md-flex justify-content-md-end">
      <%if("manager".equals(session.getAttribute("userId"))){ %>
      <a class="btn btn-sm btn-outline-secondary" href="/cap/board/write">새 상품 등록</a>
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
