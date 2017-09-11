<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- Deprecated된 함수 사용시 아래 라이브러리 임베드 -->
<!-- 
<script src="<c:url value='/JS/jquery-migrate-1.4.1.min.js'/>" type="text/javascript"></script>
-->

<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>

<script>


$(function(){
	
	
	<c:if test="${!empty page}" var="te" >
	$("#${page}").css("backgroundColor","black");
	$("#${page}").css("color","white");
	</c:if>
	
	<c:if test="${!te}">
	$("#home").css("backgroundColor","black");
	$("#home").css("color","white");
	</c:if>
	
});

</script>

</head>
	
	
    <!-- Fixed navbar --> <!--  고정 상단메뉴 시작 -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">도미노피자</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="MgrPage" ><a href="<c:url value='/MgrPageView.pz' />" id="home"  >주문</a></li>
            <li class="" ><a href="<c:url value='/SalList.pz' />" id="SalList">판매 내역</a></li>
			<li class="" ><a href="<c:url value='/StoreUpdate.pz' />?in=in" id="StoreUpdate">매장 정보 관리</a></li>


<!--             <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">매장 정보 관리<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">이벤트</a></li>
                <li><a href="#">공지사항</a></li>
    
              </ul>
            </li> -->
     

          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav> <!-- 고정바 끝 -->