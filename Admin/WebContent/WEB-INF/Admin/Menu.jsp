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

    <title>회원 관리 페이지</title>

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
/* 
.lst_prd_type ul li.prd_list_rgt {
    margin-left: 0;
}
.lst_prd_type ul li {
    float: left;
    position: relative;
    width: 235px;
    margin: 35px 0 0 20px;
    box-shadow: 1px 1px 4px rgba(0,0,0,0.34);
}
dl, ul, ol, menu, li {
    list-style: none;
}
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, textarea, p, blockquote, th, td, input, select, textarea, button {
    margin: 0;
    padding: 0;
}
*, *:before, *:after {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
user agent stylesheet
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
common.css:9
dl, ul, ol, menu, li {
    list-style: none;
}
ul, menu, dir {
    display: block;
    list-style-type: disc;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    -webkit-padding-start: 40px;
}
body {
    background: #fff;
    -webkit-text-size-adjust: none;
}
*, *:before, *:after {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
*, *:before, *:after {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
::-webkit-scrollbar {
    width: 7px;
    height: 7px;
    border: 3px solid #fff;
}
::-webkit-scrollbar-thumb {
    height: 50px;
    width: 50px;
    background: #cdcccb;
    border-radius: 8px;
}
::-webkit-scrollbar-track {
    background: #eeece9;
    border-radius: 0;
}

ul, menu, dir {
    display: block;
    list-style-type: disc;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    -webkit-padding-start: 40px;
}
 */
 

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
	      <span>어떻게 나오나요</span>
	      </div>
	      <div class="btndiv"   style="margin: auto; text-align: right;" >
	       <input  type=button value="메뉴 추가" class="btn btn-sm btn-info" OnClick="location.href='<c:url value="/Write.do"/>'">
	      </div>
	      </div>

	      <!--  실재 내용 표시  -->
       	  	<div class="col-md-12" style="width: 1500px" >
       	  	<div class="tab_content active" style="width:100%" >


       	  			<div class="lst_prd_type ">

						<ul>
						
						<c:forEach var="dtos" items="${dto }" varStatus="loop"  >
						<c:if test="${(loop.count-1) % 5==0 }" var="pif" >
						<c:set value="prd_list_rgt" var="pclass" />
						</c:if>
						<c:if test="${!pif }">
						<c:set value=" " var="pclass" />
						</c:if>
						<li class="${pclass}">
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
    
    