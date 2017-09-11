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

<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
    <title>Pijava</title>

    <!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />
 




	
  </head>

  <body role="document">

       	  
	

 <div>

 </div>
    
	
    <div class="container theme-showcase" role="main">
			
	      <!-- Main jumbotron for a primary marketing message or call to action -->
	   
	   
	   
	      <div>
	     
	           <div class="col-md-10">
	           <fieldset>
	           <legend> 상세 내역 </legend>
	           <p style="font-size:1.2em">주문자 정보</p>
	           <ul>
         		<li>주 문 자 :${dtomap.name }</li>
         		 <li>연 락 처 :${dtomap.tel }</li>
         		 <li>배 송 지 :${dtomap.addr }</li>
         		 <li>총 가 격 :${dtomap.sum }</li>
	           </ul>
	           <hr>
	            <p style="font-size:1.2em">주문 정보</p>
	           	<c:forEach var="dtos" items="${menu}" >
	           	<c:forEach var="dto" items="${dtos.sdto}" >	
	           		<span>${dto.menu_name} ${dto.dname } ${dto.size } (${dto.orgp})
	           		<c:if test="${!empty dto.qty }">
	           		[* ${dto.qty }]
	           		</c:if>
				</span>
				
	           	<ul>
         		 <li>추가 :<br/>
         		 <c:forEach var="top" items="${dto.topping}" >	
         		  ${top.tname } ${top.tsize }(${top.tprice }) <br/>
         		 </c:forEach>
         		 <c:if var="tes" test='${dto.ttprice!="0"}'>
         		  - Total ${dto.ttprice}
         		 </c:if>
         		 <c:if test="${!tes }">
         		   * 
         		 </c:if>
         		 </li>
         		 <li>
         		  도합 - ${dto.price }
         		 </li>
	           </ul>
	           </c:forEach>
	           	</c:forEach>
	           
	           </fieldset>
        </div>
	     
        	
        </div>
        
      </div>  
	
          
	      </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>
    
   

    
  </body>
</html>
    
    