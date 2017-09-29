<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   	
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

    <title>상품메뉴 관리</title>

    <!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />
    
    <link rel="stylesheet" href="<c:url value='/Style/common.css' />" />
    <link rel="stylesheet" href="<c:url value='/Style/font.css' />" />
	<link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css?v1.0">

    <!--  피자 메뉴리스트 출력용 -->
    	<script type="text/javascript" src="<c:url value='/Pizza/js/d2CommonUtil.js' />"></script>
    	
<style>

body {
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color: #fff;
}

.jumbotron {
    margin-left: 70px;
    background-image: url(/Admin/Image/피자베너.png);
    background-color: white;
    width: 1000px;
    height: 241px;
}



</style>


  </head>

  <body role="document">

  <div>
	<!--  top  --> 
	<jsp:include page="/temp/top.jsp" />
 </div>
	
    <div class="container theme-showcase" role="main">
			
	      <!-- Main jumbotron for a primary marketing message or call to action -->
	      <div class="jumbotron">
	        <h1></h1>
	      </div>
	
			<!--  실제 내용의 제목 표시 -->
	      <div class="page-header">
	        <h1>피자</h1>
	      </div>
	
	      
	      <div>
	      <div style="width: 100%" >
	      <div class="ser"   style="margin: auto; text-align:center;" >
	      <span></span>
	      </div>
	      <div class="btndiv"   style="margin: auto; text-align: right;" >
	       <input  type=button value="메뉴 추가" class="btn btn-sm btn-info" OnClick="location.href='<c:url value="/Write.do"/>'">
	      </div>
	      </div>

	      <!--  실재 내용 표시  -->
       	  	<div class="col-md-11" style="width: 1200px" >
       	  	
       	  	<div class="tab_content active" style="width:100%" >


       	  			<div class="lst_prd_type ">

						<ul>
						
						<c:forEach var="dtos" items="${dto }" varStatus="loop"  >
					<%-- 	<c:if test="${(loop.count-1) % 4==0 }" var="pif" > --%>
						<c:set value="prd_list_rgt" var="pclass" />
						<%-- </c:if> --%>
						<c:if test="${!pif }">
						<c:set value=" " var="pclass" />
						</c:if>
						&nbsp;<li class="${pclass}">
							<a href="<c:url value='/PizzaEdit.pz' />?p_no=${dtos.p_no}">
								<div class="prd_img">
										<div class="prd_tag">
										
										</div>

										<div class="prd_img_view"><img src="<c:url value='/Image'/>/${fn:replace(dtos.p_img,' ','')}" alt="꽃게 온더 피자 곡물도우"></div>
									</div>
									<div class="prd_info">
										<div class="prd_title">${dtos.p_name }${namegok }</div>
									</div>
							</a>
							<div class="prd_price">
							<p class="price_large"><span class="ico ico_s_large"></span>${dtos.p_lprice }<em>원</em></p>
									<p class="price_medium"><span class="ico ico_s_medium"></span>${dtos.p_sprice }<em>원</em></p>
								</div>
							</li>
						</c:forEach>

		</ul>
		</div>
		</div>

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
    
    