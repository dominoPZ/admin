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
    <title>판매량 확인</title>
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
   
   
<script src="<c:url value='/cmn/pieGraph/highcharts.js'/>"></script>
<script src="<c:url value='/cmn/pieGraph/highcharts-3d.js'/>"></script>
<script src="<c:url value='/cmn/pieGraph/exporting.js'/>"></script>
<%-- <script type="<c:url value='/cmn/pieGraph/jquerymin.js'/>"></script> --%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<style type="text/css">

</style>
</head>
<body role="document">

   <div>
      <!--  top  -->
      <jsp:include page="/temp/top.jsp" />
   </div>


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
	    	<c:if test="${!empty emp}" var="emps">
	          <c:if test="${!empty price}">
	          <c:if test="${!empty time}" var="times">
		    	text: '피자 판매량 추이[시간별]'
		    	</c:if>
	          <c:if test="${!times}">
		        text: '피자 판매량 추이'
		        </c:if>
	           </c:if>
	            <c:if test="${empty price}">
	          //수량으로 볼 경우
	                text: '피자 별 판매 수량'
	           </c:if>
	           </c:if>
	          <c:if test="${!emps}">
	          text: '<span style="font-size:1.3em; font-weight:bold"><h1>판매된 피자가 없습니다.</h1><span>'
	          </c:if>
	    	
	    	
	    	},
	    subtitle: {
	        text: '판매액이 높은 순으로 영역을 차지 합니다.'
	    },
	    plotOptions: {
	        pie: {
	            innerSize: 220,
	            depth: 60
	        }
	    },
	    series: [{
	    	// 매출액
	    	<c:if test="${!empty price}">
	        name: '매출 액',
	        </c:if>
	    	
	    	//수량으로 볼 경우
            <c:if test="${empty price}">
            	name: '수량 ',
	        </c:if>
	    	
	        data: [
	            <c:forEach items='${sales}' var='dto' varStatus='loop' >
	            /// 가격으로 볼 경우
	            <c:if test="${!empty price}">
	            ['${dto.name}',${dto.price}]
	            </c:if>
	            //수량으로 볼 경우
	            <c:if test="${empty price}">
		        ['<h2>${dto.name}</h2>',${dto.count}]
		        </c:if>
	            
	            <c:if test='${!loop.last}'>
	            ,
	            </c:if>
	            </c:forEach>
	        ]
	    }]
	});///////////////////////////////////////그래프
		$('select option[value=${st_no}]').attr("selected","selected");
//	   	alert('${radios}');
//		$('.radios').val('${radios}').prop("checked",true);
//		$('input:radio[name="radios"][value="${radios}"]').prop('checked', true);

//		$('.radios').val('${radios}').prop("checked", true)
	
/* 
	   $('.radios').prop("checked", "false");
	   $('.radios').val('${radios}').attr("checked", "checked");
	   alert("??"); */
});



</script>


<div class="container theme-showcase" role="main">
   <!-- Main jumbotron for a primary marketing message or call to action -->

   <%--       <div style="background-image: url('<c:url value="/Image/backend_beverage.png"/>');width:1000px:height:241px">
      <img src="<c:url value='/Image/backend_beverage.png'/>" alt="">
      <h2>음료 관리(등록/수정/삭제) 페이지 입니다.</h2>
   </div>
--%>

   <div class="jumbotron">
      <!--            <h2>음료 관리(등록/수정/삭제) 페이지 입니다.</h2> -->
   </div>

   <div style="width: 100%; text-align: center;" id="message"></div>

  <form action="<c:url value='/SalesGraph.do' />" method="get" id="frm">
   <div class="page-header">

      <div style="text-align: center;" >
      <c:if test="${!empty st_name }" var="noname" >
      <span style="font-size: 1.5em"> 매장명 : ${st_name } </span>
      </c:if>
      <c:if test="${!noname }">
      <span style="font-size: 1.5em"> 전체 매장 </span>
      </c:if>
      </div>
      <!-- <input type=checkbox id="checkbox" value="음료 수정" class="btn btn-sm btn-info" OnClick="javascript:editDrink()" style="float:right;margin-left: 8px"> -->
      <!-- <input type=button value="음료 추가" class="btn btn-sm btn-info" OnClick="javascript:addDrink()" style="float:right"> -->
   </div>

<!-- 컨텐츠 시작============================================================ -->

       <span style="font-size: 20px">판매량</span>
      <input class="radios" type="radio" name="radios" value="price" >가격
      <input class="radios" type="radio" name="radios" value="qty" >수량
      <input class="radios" type="radio" name="radios" value="time" >시간<br/>
 <span style="font-size: 20px"> 기간 선택 : </span><input type="date" name="date1" value="${date1 }" /> ~ <input type="date" value="${date2 }" name="date2" />
      <input type="submit" style="margin-left:10px" class="btn btn-sm btn-info" value="확인"/>
     <select id="selectStore" name="stores" style="float:right">
        <option value="">전체 매장</option>
        <c:forEach items="${stores }" var="store" >
         <option value="${store.st_no }">${store.st_name }</option>
        </c:forEach>
   </select>
  <label style="float:right">매장 선택 :&nbsp;</label>
  </form>

      <!-- 파이 그래프 -->
    <fieldset style="margin-top:20px">
      <div id="container" style="height: 600px; font-size: 20px"></div>
    </fieldset>

<!-- 컨텐츠 끝============================================================ -->
   </div>
   </div>
	
	



<script>
$(function(){
   /* $(".radio[value:${radio}]").attr("checked","checked"); 
/*    
   $(".radio").change(function(){
      $(":submit").trigger("click");
   });
*/
/* 	$(".radios").change(function(){
      $(":submit").trigger("click");
   });  */
   
   $("#selectStore").change(function(){
      $(":submit").trigger("click");
   });
   var flag=1;
   $(".dropdown").click(function(){
      if(flag==1){
         $(this).addClass("open");
         flag = 0;
      }
      else{
         $(this).removeClass("open");
         flag = 1;
      }
   });
});
</script>



   <!-- 내용 끝 -->


   <!-- Bootstrap core JavaScript
    ================================================== -->
   <!-- Placed at the end of the document so the pages load faster -->
   <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"
      type="text/javascript"></script>
   <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />"></script>
</body>
</html>