<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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

	<link rel="stylesheet" type="text/css" href="<c:url value='/test/main.css'/>">
	<script src="<c:url value='/test/app.js'/>"></script>

  </head>

<style>
.ih-item.circle.effect10.colored .info {
    background: #c3dbd4;
}
.addLi {
    float: left;
    list-style: none;
}
.ih-item.circle.effect10 .info p {
    color: #126b53;
    font-style: italic;
    font-size: 16px;
    border-top: 1px solid rgba(255, 255, 255, 0.5);
}
.ih-item.circle.effect10 .info h3 {
    color: #102b6b;
    text-transform: uppercase;
    vertical-align: middle;
    /* position: relative; */
    letter-spacing: 2px;
    font-size: 22px;
    font-weight: bold;
    text-shadow: 0 0 2px white, 0 1px 2px rgba(0, 0, 0, 0.3);
}
</style>



  <body role="document">

  <div>
	<!--  top  --> 
	<jsp:include page="/temp/top.jsp" />
 </div>
	
    <div class="container theme-showcase" role="main">
		<!-- Main jumbotron for a primary marketing message or call to action -->
	      <div class="jumbotron">
	        <h2>음료 관리(등록/수정/삭제) 페이지 입니다.</h2>
	      </div>
	      
	      <div class="page-header">
	        <h1>음료 목록</h1>
	      </div>
	      
<div class="CircleEvent">
<ul>
	<c:forEach items="${drinkList}" var="list">
	<li class="addLi">
			<div class="row"  style="padding: 15px">
				<div class="col-sm-6">
					<!-- colored -->
					<div class="ih-item circle colored effect10 bottom_to_top">
						<a href="#">
							<div class="img">
								<img alt="${list.d_img}" src="<c:url value='/Image/sidedish/beverage/'/>${fn:replace(list.d_img,' ', '')}">
							</div>
							<div class="info">
								<h3 style="font-family:맑은 고딕;font-size:15px;line-height:1.4em;vertical-align: middle;">${list.d_name}</h3>
								<p>
									<fmt:formatNumber value="${list.d_price}" /> 원
								</p>
							</div>
						</a>
					</div>
					<!-- end colored -->
				</div>
				</div>
	</li>
		</c:forEach>
</ul>
</div>

		<input type=button value="음료 추가하기" class="btn btn-sm btn-info" OnClick="location.href='<c:url value="/InsertDrink.do"/>'">
	
			<!--  실제 내용의 제목 표시 -->

	 
	      
	      <!--  실재 내용 표시  -->
	              
	              
	              
       	  <div><!-- class="col-md-6" 간격조정 때문에 삭제 -->
          <table class="table table-striped" style="text-align:center;vertical-align: middle;">
            <thead >
              <tr>
                <th style="width:110px">일련번호</th>
                <th style="width:600px">음료</th>
                <th style="width:150px">가격</th>
                <th style="width:600px">이미지파일</th>
                <th style="width:100px">이미지</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${drinkList}" var="list">
              <tr>
                <td>${list.dr_no}</td>
                <td>${list.d_name}</td>
                <td><fmt:formatNumber value="${list.d_price}"/></td>
                <td>${list.d_img}</td>
                <td><img style="height:80px;border-radius: 60px;" alt="${list.d_img}" src="<c:url value='/Image/sidedish/beverage/'/>${fn:replace(list.d_img,' ', '')}"></td>
              </tr>
            </c:forEach>
              	
              	
              	
            </tbody>
          </table>
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
    
    