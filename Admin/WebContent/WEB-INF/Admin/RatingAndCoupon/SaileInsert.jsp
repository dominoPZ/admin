<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>bootstrap template</title>

	
    <!-- Bootstrap -->
    <link href="<c:url value='/BootStrap/css/bootstrap_edt.css' />" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/font-awesome.min.css' />" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/style.css' />" media="screen" title="no title" charset="utf-8">

    <!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />




    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    
  </head>
  <body role="document">
<script>

function check() {
  if(fr.name.value == "" || fr.con.value == ""|| fr.saile.value == ""){
    alert("입력하지 않은 칸이 있습니다.");
    fr.inputName.focus();
    return false;
  }
  else {
	  fr.submit();
  }
}



</script>




<c:set value="store" var="page" />
	
	

	



  <div>
	<!--  top  --> 
	<jsp:include page="/temp/top.jsp" />
 </div>
	
	  <div class="container theme-showcase" role="main">
			
	      <!-- Main jumbotron for a primary marketing message or call to action -->
	      <div class="jumbotron">
	      </div>
	

	      <div>
	      <!--  실재 내용 표시  -->
	       <div class="col-md-6">  
	      
      <article class="container">
     

        <div class="col-md-12">
        <div class="page-header">
    	    <h1> 할인쿠폰 추가 ${mes } <small>SaileCoupon </small></h1>
        </div>
        
        <form class="form-horizontal" method="post"  name="fr" id="fr"  action="<c:url value='/SaileInsert.pz' />" >
        		<input type="hidden" name="rno" value="${no }" >
                <div class="form-group">
            <label class="col-sm-3 control-label"  for="inputName">쿠폰명</label>
          <div class="col-sm-6">
            <input class="form-control" name="name" id="name" type="text" value="${map.name }" placeholder="쿠폰명">
          </div>
        </div>
        
        
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">할인율</label>
          <div class="col-sm-6">
            <input class="form-control" name="saile" value="${map.saile }" id="saile" type="text" placeholder="할인율">
          </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">사용조건</label>
          <div class="col-sm-6">
          <select  class="form-control" style="width: 15%" name="con">	
	     	<option value="0">모두</option>
	      	<option value="1">포장</option>
	      	<option value="2">배달</option>
	      	<option value="3">생일</option>
	     </select>
          </div>
        </div>
        
        
        	<!--  이용약관 -->
<!--           <div class="form-group">
              <label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
            <div class="col-sm-6" data-toggle="buttons">
              <label class="btn btn-warning active">
                <input id="agree" type="checkbox" autocomplete="off" chacked>
                  <span class="fa fa-check"></span>
              </label>
              <a href="#">이용약관</a> 에 동의 합니다.
            </div>
          </div> -->
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="button" onclick="check();" >추가<i class="fa fa-check spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
      </article>
	      
	      
	      
	      
<!-- 주소 입력받기 원본  아껴두자
 	<form action="#">
	
	<input id="post1" readonly="" size="5" name="post1"> - <input id="post2" readonly="" size="5" name="post2">
	<input onclick="openDaumPostcode()" type="button" class="btn btn-sm btn-info"  value="우편번호찾기"><br>
	<span style="LINE-HEIGHT: 10%"><br></span>
	<input id="addr1" readonly="" size="40" name="addr1" placeholder="도로명주소"><br>
	<span style="LINE-HEIGHT: 10%"><br></span>
	<input id="addr2" size="40" name="addr2" placeholder="상세주소">
	</form> -->
  
  
  
	   </div>
	   
	   
	   
	   
      </div>      
	      </div>
	
	
	


    <!-- 내용 끝 -->
  
	<!--  주소 입력받기 위한 js  -->  
	
	  
	
	
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  
  
  	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>



  </body>
  
</html>
