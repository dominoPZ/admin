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

    <title>음료 추가</title>

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
	        <h1>음료 추가 </h1>
	        <h3>음료 추가 페이지 입니다.</h3>
	      </div>
	
			<!--  실제 내용의 제목 표시 -->
	      <div class="page-header">
	        <h1>회원목록</h1>
	      </div>
	      <div>
	      <!--  실재 내용 표시  -->
	              
       	  <div class="col-md-6">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>번호</th>
                <th>이름</th>
                <th>주소</th>
                <th>아이디</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>Mark</td>
                <td>soule</td>
                <td>erjlj</td>
              </tr>
              <tr>
                <td>2</td>
                <td>Mark</td>
                <td>soule</td>
                <td>erjlj</td>
              </tr>
              <tr>
                <td>3</td>
                <td>Mark</td>
                <td>soule</td>
                <td>erjlj</td>        
              </tr>
            </tbody>
          </table>
          <input type=button value="음료 추가하기" class="btn btn-sm btn-info" OnClick="location.href='<c:url value="/InsertDrink.do"/>'">
        </div>
      </div>      
	      </div>
	


    <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>
  </body>
</html>
    
    