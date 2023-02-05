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
    <title>JeJu Login</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sign-in/">
	<script type="text/javascript">

function Check_Pass()
{
   if(updatePassForm.passwd.value.length < 1){
      alert("패스워드를 입력하세요.");
      updatePassForm.passwd.focus();
      return false;
   }
   if(updatePassForm.passwd2.value.length < 1){
      alert("패스워드 확인을 입력하세요.");
      updatePassForm.passwd2.focus();
      return false;
      }
   if(updatePassForm.passwd.value != updatePassForm.passwd2.value){
      alert("패스워드가 일치하지 않습니다.");
      updatePassForm.passwd.value="";
      updatePassForm.passwd2.value="";
      updatePassForm.passwd.focus();
      return false;
      }
   return true;
}
function Cancel_btn(){
	findIdForm.passwd.value="";
	findIdForm.passwd2.value="";
	findIdForm.userId.focus();
}
</script>
	
    

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
      html,
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="text"] {
  margin-bottom: 10px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: -1px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
      
    </style>

    
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
 <div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      
      <div class="col-12 text-center">
        <a class="blog-header-logo text-dark" href="/cap/board/main">하루살이</a>
      </div>
      
    </div>
  </header>
<main class="form-signin" span style="font-family: 'Gowun Dodum' !important;">

  <form:form modelAttribute="userVO" class="login-form" name="updatePassForm" method="post" action="updatePass" onsubmit='return Check_Pass()'>

    
    <h1 class="h3 mb-3 fw-normal">비밀번호 변경</h1>

    <div class="form-floating">
   	  
      <input name='userId' type="text" class="form-control" id="floatingInput"  value="${userVO.userId}" readonly>
      <label for="floatingInput">User ID</label>
    </div>
    <div class="form-floating">
      
      <input name='passwd' type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
      <label for="floatingPassword">New Password</label>
    </div>
    <div class="form-floating">
      
      <input name='passwd2' type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
      <label for="floatingPassword">New Password Check</label>
    </div>
    
    <div class="d-grid gap-2 d-mx-auto">
    	<button type="submit" class="w-100 btn btn-lg btn-primary">확인</button>
    			<button type="button" class="btn btn-outline-dark" onclick='Cancel_btn()'>취소</button>
    	
	</div>
	
  </form:form>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>    
  </body>
</html>
