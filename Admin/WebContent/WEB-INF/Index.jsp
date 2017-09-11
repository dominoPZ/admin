<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
 <!--
    <link rel="icon" href="../../favicon.ico">
   -->

    <title>Pijava</title>

    <!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />
 



	
  </head>

  <body role="document">

	

 <div>
	<!--  top  --> 
	<jsp:include page="/temp/top.jsp" />
 </div>
    
	
    <div class="container theme-showcase" role="main">
			
	      <!-- Main jumbotron for a primary marketing message or call to action -->
	      <div class="jumbotron">
	        <h1>D O M I N O _ P I Z Z A</h1>
	        <h3>도미노 피자 관리자페이지 입니다.</h3>
	      </div>
			<!--  실제 내용의 제목 표시 -->
	      <div class="page-header">
	        <h1></h1>
	      </div>
	      <div>
	      <!--  실재 내용 표시  -->
	      <h2></h2>      
	      </div>
		





    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>
    
    

    
  </body>
</html>
    
    