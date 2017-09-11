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
          <a id="home" class="navbar-brand" href="<c:url value='/login.pz"' />">도미노피자</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="<c:url value='/Member.do' />" id="member">회원 정보 관리</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" id="event" data-toggle="dropdown" role="button" aria-expanded="false">이벤트/공지사항 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<c:url value='/Eventlist.do'/>">이벤트</a></li>
                <li><a href="<c:url value='/Noticelist.do'/>">공지사항</a></li>
    
              </ul>
              
            </li>
            
            <li class="dropdown">
              <a href="#" id="menu" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">피자메뉴 관리 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<c:url value='/PizzaMenu.do' />">피자 메뉴 추가</a></li>
                <li><a href="<c:url value='/SideMenu.do'/>">사이드 메뉴 추가</a></li>
                <li><a href="<c:url value='/DrinkMenu.do'/>">음료 추가</a></li>
                <li><a href="<c:url value='/ToppingMenu.do'/>">토핑 추가</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">피자 메뉴 정보 수정</a></li>
                <li><a href="#">사이드 메뉴 정보 수정</a></li>
                <li><a href="#">음료 정보 수정</a></li>
                <li><a href="#">토핑 정보 수정</a></li>
              </ul>
            </li>
            
            
            <li class="dropdown">
              <a href="#" id="store" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">매장 관리 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<c:url value='/StoreInsert.do' />">매장 추가</a></li>
                <li><a href="<c:url value='/StoreSer.pz' />">매장 정보 수정</a></li>
              </ul>
            </li>
              <li class="dropdown">
              <a href="#" id="rating" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> 등급 및 쿠폰 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<c:url value='/Rating.pz' />">등급 관리</a></li>
                <li><a href="<c:url value='/Saile.pz' />">할인 쿠폰 관리</a></li>
         <!-- 
                <li><a href="<c:url value='/StoreInsert.do' />">기프티콘 관리</a></li>
          --> 
              </ul>
            </li>
          </ul>
          
          
          
        </div><!--/.nav-collapse -->
      </div>
    </nav> <!-- 고정바 끝 -->