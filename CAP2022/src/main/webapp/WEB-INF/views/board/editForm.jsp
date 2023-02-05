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
    <title>회원정보 수정</title>
	
	
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


<script type="text/javascript">
function checkMsg(){
var msgCode = "${msgCode}";
if(msgCode != ""){
alert(msgCode);
}
}
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
		
		function DaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					var addr = '';
					var extraAddr = '';
					if (data.userSelectedType === 'R') { 
						addr = data.roadAddress;
						} else {
						addr = data.jibunAddress;
						}
					if(data.userSelectedType === 'R'){
						if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							extraAddr += data.bname;
							}
						if(data.buildingName !== '' && data.apartment === 'Y'){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							}
						if(extraAddr !== ''){
							extraAddr = ' (' + extraAddr + ')';
							}
						document.getElementById("addr2").value = extraAddr;
						} else {
							document.getElementById("addr2").value = '';
							}
					document.getElementById("zip").value = data.zonecode;
					document.getElementById("addr1").value = addr;
					document.getElementById("addr2").focus();
					}
			}).open();
			}
		
		function idCheck(){
			
			if (join.userId.value.length < 1){
					alert("아이디를 입력하세요.");
					join.userId.focus();
					return false;
			}
			
			var id = $("#userId").val();
			var access = $("#message");
			$.ajax({
				url:"/cap/board/idCheck?userId=" + id,
				type: 'get',
				dataType: 'json',
				success:function(result){
					if (result.msg=="true"){
						access.html("<font color='green' size='2px;'><i class='fa fa-check'>&nbsp;사용 가능한 아이디입니다.</i></font>");
						$("#flag").val("true");
		       	 	}
					else{
						access.html("<font color='red' size='2px;'><i class='fa fa-times'>&nbsp;이미 사용중인 아이디입니다.</i></font>");
						$("#flag").val("false");
					}
				}
			});
		}
		function Check_Form() 
		{
			if (editForm.passwd.value != editForm.passwd_re.value){
				alert("패스워드가 일치하지 않습니다.");
				editForm.passwd.focus();
				return false;
			}
		
			return true;
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
  
  
  
<div class="container">

  <main span style="font-family: 'Gowun Dodum' !important;">
  <div class="py-5 text-center">
      <h2>내 정보</h2>
    </div>
  <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="/cap/board/editUser">회원정보 수정</a>
  </li>
  <li class="nav-item">
    <form action="res" modelAttribute="searchVO" method="get">
	
	<!--  <input type="hidden" id="type" name="type" value="userid" />
	
	<input type="hidden" id="keyword" name="keyword" value="${userId}" />-->
	<input type="submit" class="nav-link " aria-current="page" id="search" onclick="tmpConsole()" value="예약정보" />
	
	</form>
  </li>
  
</ul>
    
   

  
    <div class="col-12">
      
      
        
   <form modelAttribute="userVO" name="editForm" method='post'  Action='editUser' onsubmit='return Check_Form()' >
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="firstName" class="form-label">아이디</label>
              <input type="text" class="form-control" id='userId' name="userId" placeholder="ID" required readonly value="${userVO.userId}">
              <span id="message"></span>
            </div>

            

            <div class="col-12">
              <label for="pwd" class="form-label">비밀번호</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" name="passwd" placeholder="PassWord" required value="">
             
              </div>
            </div>
             <div class="col-12">
              <label for="pwdcheck" class="form-label">비밀번호 확인</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" name="passwd_re" placeholder="PassWord Check" required value="">
             
              </div>
            </div>
            
			<div class="col-sm-6">
              <label for="name" class="form-label">이름</label>
              <input type="text" class="form-control" name="name" placeholder="Name" required value="${userVO.name}" readonly>  
              <span class="fieldError"><form:errors path="name"/></span>
                
            </div>
            
            <div class="col-12">
              <label for="email" class="form-label">Email</label>
              <input type="text" class="form-control" name="email" placeholder="you@example.com" required value="${userVO.email}">
              <span class="fieldError"><form:errors path="email"/></span>

            </div>
            
			<div class="col-12">
			 <label for="birth" class="form-label">생일</label>
				<div class="input-group date">
              
              <input type=text class="form-control" id='birth' name='birthday' required numeric value="${userVO.birthday}" readonly>
              <span class="fieldError"><form:errors path="birthday"/></span>
              
              <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
				
				</div>
              
            </div>
            
            <div class="col-sm-6">
              <label for="phone" class="form-label">전화번호</label>
              <input type="text" class="form-control" name="phone" placeholder="Phone Number" required value="${userVO.phone}">    
              <span class="fieldError"><form:errors path="phone"/></span>
          
            </div>
            
            <div class="col-12">
              <label for="address" class="form-label">주소</label>
              <a class="btn btn-sm btn-outline-secondary" Onclick='DaumPostcode()'>주소검색</a>
              <input type="text" class="form-control" id="zip" name="zip"   required value="${userVO.zip}">
              <input type="text" class="form-control" id="addr1" name="addr1" required value="${userVO.addr1}">   
              <input type="text" class="form-control" id='addr2' name='addr2' required value="${userVO.addr2}">   
              <span class="fieldError"></span>
              
            </div>

            

            

          


          

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">정보수정</button>
          
        </form>
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
