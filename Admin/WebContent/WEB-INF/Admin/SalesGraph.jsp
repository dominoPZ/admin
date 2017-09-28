<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>판매량 확인 페이지</title>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>

    <!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />

	<link rel="stylesheet" type="text/css" href="<c:url value='/cmn/main.css'/>">
	<script src="<c:url value='/cmn/app.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/cmn/check.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/cmn/check2.css'/>">
	
	
<title>Insert title here</title>
<script src="<c:url value='/cmn/pieGraph/highcharts.js'/>"></script>
<script src="<c:url value='/cmn/pieGraph/highcharts-3d.js'/>"></script>
<script src="<c:url value='/cmn/pieGraph/exporting.js'/>"></script>
<%-- <script type="<c:url value='/cmn/pieGraph/jquerymin.js'/>"></script> --%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<style type="text/css">
${demo.css}
</style>
<script>
$(function () {
	//그래프
	Highcharts.chart('container', {
	    chart: {
	        type: 'pie',
	        options3d: {
	            enabled: true,
	            alpha: 45 //기울기
	        }
	    },
	    title: {
	        text: '피자 판매량 추이'
	    },
	    subtitle: {
	        text: '판매량이 높은 순으로 영역을 차지 합니다.'
	    },
	    plotOptions: {
	        pie: {
	            innerSize: 220,
	            depth: 60
	        }
	    },
	    series: [{
	        name: '판매 량 ',
	        data: [
	            ['꽃게 온더 피자', 8],
	            ['불고기 피자', 3],
	            ['페퍼로니 피자', 1],
	            ['피자1', 6],
	            ['피자2', 8],
	            ['피자3', 4],
	            ['피자4', 4],
	            ['피자5', 1],
	            ['피자6', 1]
	        ]
	    }]
	});///////////////////////////////////////그래프
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});

</script>
</head>
<body role="document">

	<div>
		<!--  top  -->
		<jsp:include page="/temp/top.jsp" />
	</div>

	<div class="container theme-showcase" role="main">
		<!-- Main jumbotron for a primary marketing message or call to action -->

		<%-- 		<div style="background-image: url('<c:url value="/Image/backend_beverage.png"/>');width:1000px:height:241px">
			<img src="<c:url value='/Image/backend_beverage.png'/>" alt="">
			<h2>음료 관리(등록/수정/삭제) 페이지 입니다.</h2>
		</div>
 --%>

		<div class="jumbotron">
			<!-- 	        <h2>음료 관리(등록/수정/삭제) 페이지 입니다.</h2> -->
		</div>

		<div style="width: 100%; text-align: center;" id="message"></div>

		<div class="page-header">
			<span style="font-size: 20px">판매량</span>
			<!-- <input type=checkbox id="checkbox" value="음료 수정" class="btn btn-sm btn-info" OnClick="javascript:editDrink()" style="float:right;margin-left: 8px"> -->
			<!-- 	        <input type=button value="음료 추가" class="btn btn-sm btn-info" OnClick="javascript:addDrink()" style="float:right"> -->
		</div>

		<!--    셀렉트 박스 : 매장 출력 (매장 별 판매량 보기)
				기간별 판매량 : form date type, 검색		 -->
				
<!-- 컨텐츠 시작============================================================ -->


  <form action="#" method="post" id="frm">
  기간 선택 : <input type="date" name="date" /> ~ <input type="date" name="date" />
		<input type="submit" class="btn btn-sm btn-info" value="확인"/>
  	<select style="float:right">
		<option value="">선택</option>
<%-- 		
		<c:forEach var="" items="">
			<option value="${#}">${#}</option>
		</c:forEach>
		 --%>
	</select>
  <label style="float:right">매장 선택 :&nbsp;</label>
  </form>

		<!-- 파이 그래프 -->
    <fieldset>
		<div id="container" style="height: 600px; font-size: 20px"></div>
    </fieldset>

<!-- 컨텐츠 끝============================================================ -->
	</div>
	</div>



	<!-- 내용 끝 -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"
		type="text/javascript"></script>
	<script src="<c:url value='/BootStrap/js/bootstrap.min.js' />"></script>
</body>
</html>