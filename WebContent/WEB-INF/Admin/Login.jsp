<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title> 관리자 계정 </title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/BootStrap/css/bootstrap.min2.css' />" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="<c:url value='/BootStrap/css/signin.css' />" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="<c:url value='/BootStrap/js/ie-emulation-modes-warning.js' />" ></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
	
	
	
	<script>
			var id = document.getElementById("inputEmail");
			var pass = document.getElementById("inputPassword");
		function admin(){
			if(fr.id.value == "" || fr.pass.value == ""  ){
				alert("입력되지 않았습니다.");
			}
			else{
			var hid = document.getElementById("hid");
			hid.value="admin"
			fr.submit();
			}
		}
	
		function mgr(){
			var hid = document.getElementById("hid");
			hid.value="mgr"
			fr.submit();
		}
	
	
	</script>
	
		
    <div class="container">

      <form method="post" class="form-signin" id="fr" action="<c:url value='/login.pz' />" >
      
        <h2 class="form-signin-heading"> 관리자용 로그인 페이지 입니다. </h2>
        <label for="inputEmail" class="sr-only">Email address1234</label>
        <input type="text" name = "id" id="inputEmail" class="form-control" placeholder="아이디" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name = "pass" id="inputPassword" class="form-control" placeholder="비밀번호" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <input type="hidden" id="hid" name="hid" value="" > 
        <button class="btn btn-lg btn-primary btn-block" onclick="admin();" >페이지 관리자 로그인</button>
           <button class="btn btn-lg btn-primary btn-block" onclick="mgr();">매장 관리자 로그인</button>
      </form>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<c:url value='/BootStrap/js/ie10-viewport-bug-workaround.js' />"></script>
  </body>
</html>
