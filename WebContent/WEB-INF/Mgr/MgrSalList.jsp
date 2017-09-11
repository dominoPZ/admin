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
 
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/jquery-ui.js"></script>

	

	<script>
	
	(function() {
		$( "#datepicker" ).datepicker(
		{
		        dateFormat:'yymmdd'
		}
		 
		);
		});
	
	</script>

	
  </head>

  <body role="document">

       	  
	

 <div>
	<!--  top  --> 
	<jsp:include page="/temp/Mgrtop.jsp" />
 </div>
    
	
    <div class="container theme-showcase" role="main">
			
	      <!-- Main jumbotron for a primary marketing message or call to action -->
	      <div class="jumbotron">
	      
	      
	  				<h1>${Sname}</h1>
	  				
	  				
	      </div>
	      
	      
			 <script>
			 var cssz;
	 	$(function(){
	 		
	 		
	 		
	 	$(".ck").click(function(){
	 		var id = $(this).attr('id');
	 		var popUrl = '<c:url value="/SalList.pz?pop='+id+'" />';	//팝업창에 출력될 페이지 URL
	 		var popOption = "width=330, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

	 			window.open(popUrl,"",popOption);
	 	});
	 		
		$(".ck").hover(function(){
			cssz = $(this).css("backgroundColor");
			$(this).css("backgroundColor","yellow");
		},function(){
			$(this).css("backgroundColor",cssz);
		});
	 
		
		$("#clicks").click(function(){
			var date1 = document.getElementById("date1");
			var date2 = document.getElementById("date2");
			fr.submit();
		});
	 	
		
	 	});
	 	
	 	
	 	
	 	
	 </script>
		
		
			<!--  실제 내용의 제목 표시 -->
	      <div class="page-header">
	        <h1><span class="label label-primary">판매 내역</span></h1>
	      </div>
	      <div>
	      	<form action="<c:url value='/SalList.pz' />" id="fr" >
	      	<span style="font-weight: bold;">일자 선택 : </span><input style="height: 25px" type="date" id="date1" name="date1" value="${date1 }" >-<input style="height: 25px" type="date" name="date2" id="date2" value="${date2 }" >
	      	<br/><br/>

	      	<span style="font-weight: bold;">조건 선택 : </span>
	      	<select  class="form-control" style="width: 15%; height: 25px" name="col">	
	     	<option value="MENU_NAME LIKE">메뉴명</option>
	      	<option value="MENU_PRICE >= ">가격 ~ 이상</option>
	      	<option value="MENU_PRICE <= ">가격 ~ 이하</option>
	     </select>
	     	<input type="text" name="ser" style="width: 15%;" >
	      	<input  type="button" id="clicks" class="btn btn-sm btn-primary" value="검색" />

	      	</form>
	           <div class="col-md-10">
          <table class="table">
            <thead style="vertical-align: middle;" >
              <tr>
                <th>No</th>
                <th style="width: 15%">일자</th>
                <th style="width: 60%">메뉴</th>
                <th style="width: 20%">가격</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${menu }" var="dto" varStatus="loop" >
              <tr class="ck" id="${dto.no }" onclick="ck();" >
                <td>${loop.count }</td>
                <td>
                ${dto.date}
                </td>
                <td>${dto.menu}</td>
                <td>${dto.sum}</td>
              </tr>
              
              
              
            </c:forEach>
            </tbody>
          </table>
          <div style="text-align: right; margin-right:120px; "><span style=" font-weight: bold;">Total : ${only }</span></div>
        </div>
	     
	     
        	
        </div>
        
      </div>  
      
	      </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>
   

    
  </body>
</html>
    
    