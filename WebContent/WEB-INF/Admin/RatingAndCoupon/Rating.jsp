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
   	<!--  제이쿼리   -->
   <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
   

    <title>회원 관리 페이지</title>

    <!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />


  </head>

  <body role="document">
	
	<script>
	
	function del(dat){
		if (confirm("정말 삭제하시겠습니까??") == true){
			location.href="<c:url value='/RatingDelete.pz' />?rno="+dat;
		}
		else alert("취소 되었습니다.");
	}
	
	</script>
	


  <div>
	<!--  top  --> 
	<jsp:include page="/temp/top.jsp" />
 </div>
	
    <div class="container theme-showcase" role="main">
			
			
			
			
	      <!-- Main jumbotron for a primary marketing message or call to action -->
	      <div class="jumbotron">
	     
	     
	      </div>
	
			<!--  실제 내용의 제목 표시 -->
	      <div class="page-header">
	        <h1>등급 관리</h1>
	      </div>
	      <div>
	      <!--  실재 내용 표시  -->
	             	
       	  <div class="col-md-12">
       	  
       	  <div class="clickdiv">
       	  
       	  
       	  
       	  
       	  </div>
   
       	  
          <table class="table table-striped">
            <thead>
              <tr>
              
                <th style="width: 9%; min-width:90px ">등급번호</th>
                <th style="width: 12%; min-width:90px " >등급명</th>
                <th style="width: 60%; min-width:90px " >등급 혜택</th>
                <th style="width: 10%;min-width:90px ">등급 기준치</th>
                <th>
                 <form method="post" id="frs" name="frs" action="<c:url value='/RatingInsert.pz' />?rno=${map.rno}" >
               <button class="btn btn-xs btn-success" type="button" onclick="submit()"   >추가</button>
               </form>
                </th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${list }" var="map"  >
              <tr>
                <td>${map.rno }</td>
                <td>${map.rname }</td>
                <td>
               
                <c:forEach items="${map.clist }" var="clist"  >
                | ${clist.cname }
                </c:forEach>
               	
                </td>
                <td>${map.rtar }</td>
                <td>
                <form method="post" id="frs" name="frs" action="<c:url value='/Rating.pz' />?rno=${map.rno}" >
               <button class="btn btn-xs btn-primary" type="button" onclick="submit()"   >수정</button>
              <button class="btn btn-xs btn-danger" onclick="del(${map.rno});" type="button" >삭제</button></a>
                </form>
                </td>
              </tr>
            </c:forEach>
  
            </tbody>
          </table>
        </div>
      </div>      
	      </div>
	


    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>
  </body>
</html>
    
    