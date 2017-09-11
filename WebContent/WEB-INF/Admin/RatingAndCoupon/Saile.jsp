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
   

    <title>할인 쿠폰 관리 페이지</title>

    <!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />


  </head>

  <body role="document">
	
	<script>
	
	function del(dat){
		if (confirm("정말 삭제하시겠습니까??") == true){
			location.href="<c:url value='/SaileED.pz' />?no="+dat+"&del=1";
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
	        <h1>할인 쿠폰 관리</h1>
	      </div>
	      <div>
	      <!--  실재 내용 표시  -->
       	  <div class="col-md-12">
       	  <div class="clickdiv">
       	  <form class="form-horizontal" method="get"  name="frs" id="frs"  action="<c:url value='Saile.pz'/>" >
        	 <div class="form-group">
        		<label class="col-sm-3 control-label"  for="inputName"> 검색 </label>
        		<select  style="width: 10%; height: 30px;" name="col">
	      <option value="c_no">번호</option>
	      <option value="c_name">쿠폰명</option> 
	      <option value="c_saile">할인율</option> 
	      <option value="c_con">사용조건</option> 
	     </select>
	     <input name="ser" style="width: 23%; height: 30px;"   id="ser" type="text" placeholder="검색">
	     <button class="btn btn-sm btn-primary" type="button" onclick="submit();" >검색</button>
	     </form>
       	  
       	  </div>

	      </div>
      	  
          <table class="table table-striped">
            <thead>
              <tr>
                 <form method="get" id="frs" name="frs" action="<c:url value='/SaileInsert.pz' />?rno=${map.rno}" >
                <th style="width: 9%; min-width:90px ">번호</th>
                <th style="width: 60%; min-width:90px " >쿠폰명</th>
                <th style="width: 10%;min-width:90px ">할인율</th>
              	<th style="width: 10%;min-width:90px ">사용조건</th>
                <th>
               <button class="btn btn-xs btn-success" type="button" onclick="submit()">추가</button>
               </form>
                </th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${list }" var="map"  >
              <tr>
              <form action="<c:url value='/SaileED.pz' /> ">
                <td><input  type="hidden" name="no" value="${map.no}" >${map.no }</td>
                <td><input style="width: 90%; border: none; border-bottom: solid 1px;  background-color: rgba( 255, 255, 255, 0.1 );" type="text" value="${map.name }" name="name" ></td>
                <td><input style="width: 90%; border: none; border-bottom: solid 1px;  background-color: rgba( 255, 255, 255, 0.1 );" type="text" value="${map.saile }" name="saile" > </td>
                <td>
                <!--  
                <input style="width: 90%; border: none; border-bottom: solid 1px;  background-color: rgba( 255, 255, 255, 0.1 );" type="text" value="${map.con }" name="con" >
                -->
                
            	<input style="width: 90%; border: none; border-bottom: solid 1px;  background-color: rgba( 255, 255, 255, 0.1 );" type="text" value="${map.con }" name="con" >
                </td>
                <td>
               <button class="btn btn-xs btn-primary" type="button" onclick="submit();"   >수정</button>
              <button class="btn btn-xs btn-danger" onclick="del(${map.no});" type="button" >삭제</button></a>
              
                </td>
              </form>
              </tr>
              </c:forEach>
              </tbody>
          </table>
        </div>
        	 <div style="text-align: right; margin-right:120px; "><span style=" font-weight: bold;">
0 = 모두 
1 = 포장 
2 = 배달 
3 = 생일 </span></div>
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
    
    