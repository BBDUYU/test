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
    </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
<script type="text/javascript"> 


	function errCodeCheck(){
		var errCode = <%=request.getParameter("errCode")%>;
		if(errCode != null || errCode != ""){
		switch (errCode) {
		case 1:
			alert("댓글 내용이 없습니다!");
			break;
		case 2:
			alert("위시리스트에서 삭제되었습니다");
			break;
		case 3:
			alert("자기 글은 추천할 수 없습니다.!");
			break;
		case 4:
			alert("위시리스트에서 삭제되었습니다");
			break;
			}
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
	
		
		<input type="submit" class="btn btn-sm btn-outline-secondary" aria-current="page" id="search" onclick="tmpConsole()" value="위시리스트" />
	
	</form>      <a class="btn btn-sm btn-outline-secondary" href="/cap/board/editUser">내 정보</a>
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
        <h1 class="fw-light">위시리스트</h1>
        <p class="lead text-muted">관심 있는 상품이나 구매예정인 상품을 모아서 한눈에 보실 수 있습니다.</p>
        
      </div>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
     
            <c:forEach var="w" items="${wList}">
      
        <div class="col">
          <div class="card shadow-sm">
          
          <a href="hview?hno=${w.hno}">
            <img src="<c:url value='/resources/images/${w.img1}'/>" href="hview?hno=${w.hno}" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
			</a>
            <div class="card-body">
              <p class="card-text">${w.name}</p><small class="text-muted">반나절투어</small>
              
              <div class="d-flex justify-content-between align-items-center">
              <form name="deletewish" action="deletewish" onsubmit="errCodeCheck()">
              
                <div class="btn-group">
                                  <input type="hidden" id="wno" name="wno" value="${w.wno}" />
                                 
                
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">             
                  <button type="submit" class="btn btn-outline-light" id="liveToastBtn"  value="${w.wno}">
                  <a href="#" onclick="moveAction(4)">
    				<i class="bi bi-heart-fill"> </i>
		    				<script>
							    var i = 0;
							    $('.bi-heart-fill').hover(function(){
							        if(i==0){
							            $(this).removeClass('bi-heart-fill');
							            $(this).addClass('bi-heart');
							            i++;
							        }else if(i==1){
							            $(this).removeClass('bi-heart');
							            $(this).addClass('bi-heart-fill');
							            i--;
							        }
							        
							    });
							
							</script>	
    				</a>			
    				 </button>
    				 </div>
    				 
                </div>
                 </form>
                 
                <small class="text-muted">${w.price}</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
        <c:forEach var="ow" items="${owList}">
      
        <div class="col">
          <div class="card shadow-sm">
          
          <a href="oview?ono=${ow.ono}">
            <img src="${ow.img1}" href="oview?ono=${ow.ono}" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
			</a>
            <div class="card-body">
              <p class="card-text">${ow.name}</p><small class="text-muted">하루투어</small>
              
              <div class="d-flex justify-content-between align-items-center">
              <form name="odeletewish" action="odeletewish" onsubmit="errCodeCheck()">
              
                <div class="btn-group">
                                  <input type="hidden" id="owno" name="owno" value="${ow.owno}" />
                                 
                
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">             
                  <button type="submit" class="btn btn-outline-light" id="liveToastBtn"  value="${ow.owno}">
                  <a href="#" onclick="moveAction(4)">
    				<i class="bi bi-heart-fill"> </i>
		    				<script>
							    var i = 0;
							    $('.bi-heart-fill').hover(function(){
							        if(i==0){
							            $(this).removeClass('bi-heart-fill');
							            $(this).addClass('bi-heart');
							            i++;
							        }else if(i==1){
							            $(this).removeClass('bi-heart');
							            $(this).addClass('bi-heart-fill');
							            i--;
							        }
							        
							    });
							
							</script>	
    				</a>			
    				 </button>
    				 </div>
    				 
                </div>
                 </form>
                 
                <small class="text-muted">${ow.price}</small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
        
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
