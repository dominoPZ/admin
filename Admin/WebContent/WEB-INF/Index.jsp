<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <title>도미노 피자 관리자 메인 페이지</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        
		<link rel='stylesheet' href='http://fonts.googleapis.com/earlyaccess/hanna.css'>
        <link rel="stylesheet" type="text/css" href="<c:url value='/cmn/swatchbook/css/demo.css'/>" />
        <link rel="stylesheet" type="text/css" href="<c:url value='/cmn/swatchbook/css/style3.css'/>" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700,300,300italic' rel='stylesheet' type='text/css'>
		
		<script type="text/javascript" src="<c:url value='/cmn/swatchbook/js/modernizr.custom.79639.js'/>"></script> 
		<!--[if lte IE 8]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
<style type="text/css">
body {font-family: 'Hanna', serif;}
/* .footer {
position:absolute;
left:10;
top:10;
} */
</style>
    </head>
    <body>
        <div class="container">
			<header>
	            <div class="headerLogo" style="margin-top:-20px;float:left;position:absolute">
	                <img alt="smalllogo" style="" src="<c:url value='/cmn/swatchbook/images/dominologo/logo2(small).png'/>"/>
	            </div>
				<h1 style="margin-top:10px"><span>Domino Pizza</span> 관리자 페이지 입니다 :)</h1>
				<h2 style="font-family: 'Hanna', serif">원하시는 라벨을 클릭하여 관리페이지로 이동하세요 :)</h2>
				<!-- 	/* 버튼 */
			
				<nav class="codrops-demos">
					<a href="index.html">Demo 1</a>
					<a href="index2.html">Demo 2</a>
					<a class="current-demo" href="index3.html">Demo 3</a>
					<a href="index4.html">Demo 4</a>
					<a href="index5.html">Demo 5</a>
				</nav>
				 -->
				<div class="support-note"><!-- let's check browser support with modernizr -->
					<!--span class="no-cssanimations">CSS animations are not supported in your browser</span-->
					<span class="no-csstransforms">CSS transforms are not supported in your browser</span>
					<!--span class="no-csstransforms3d">CSS 3D transforms are not supported in your browser</span-->
					<span class="no-csstransitions">CSS transitions are not supported in your browser</span>
					<span class="note-ie">Sorry, only modern browsers.</span>
				</div>
			</header>
			
			<section class="main" style="height:800px">
			
				<div id="sb-container" class="sb-container">
					<div>
						<!-- <span class="sb-icon icon-mobile"> -->
						<span class="sb-icon"><img alt="icon" src="<c:url value='/cmn/swatchbook/images/index_icon/graph.png'/>"></span>
						<h4><span>매출 확인</span></h4>											
					</div>
					<div>
						<span class="sb-icon"><img alt="icon" src="<c:url value='/cmn/swatchbook/images/index_icon/coupon.png'/>"></span>
						<h4><span>할인 쿠폰 관리</span></h4>											
					</div>
					<div>
						<span class="sb-icon"><img alt="icon" src="<c:url value='/cmn/swatchbook/images/index_icon/rating.png'/>"></span>
						<h4><span>등급 관리</span></h4>
					</div>
					<div>
						<span class="sb-icon"><img alt="icon" src="<c:url value='/cmn/swatchbook/images/index_icon/store.png'/>"></span>
						<h4><span>매장 정보 수정</span></h4>
					</div>	
					<div>
						<span class="sb-icon"><img alt="icon" src="<c:url value='/cmn/swatchbook/images/index_icon/store.png'/>"></span>
						<h4><span>매장 추가</span></h4>
					</div>	
					<div>
						<span class="sb-icon"><img alt="icon" src="<c:url value='/cmn/swatchbook/images/index_icon/menu_sauce.png'/>"></span>
						<h4><span>피클&소스 메뉴 관리</span></h4>
					</div>	
					<div>
						<span class="sb-icon"><img alt="icon" src="<c:url value='/cmn/swatchbook/images/index_icon/menu_beverage.png'/>"></span>
						<h4><span>음료 메뉴 관리</span></h4>
					</div>	
					<div>
						<span class="sb-icon"><img alt="icon" src="<c:url value='/cmn/swatchbook/images/index_icon/menu_topping.png'/>"></span>
						<h4><span>토핑 추가</span></h4>
					</div>	
					<div>
						<span class="sb-icon"><img alt="icon" src="<c:url value='/cmn/swatchbook/images/index_icon/menu_sidedish.png'/>"></span>
						<h4><span>사이드 메뉴 추가</span></h4>											
					</div>	
					<div>
						<span class="sb-icon"><img alt="icon" src="<c:url value='/cmn/swatchbook/images/index_icon/menu_pizza.png'/>"></span>
						<h4><span>피자 메뉴 추가</span></h4>											
					</div>	
					<div>
						<span class="sb-icon"><img alt="icon" src="<c:url value='/cmn/swatchbook/images/index_icon/event.png'/>"></span>
						<h4><span>공지사항</span></h4>											
					</div>	
					<div>
						<span class="sb-icon"><img alt="icon" src="<c:url value='/cmn/swatchbook/images/index_icon/event.png'/>"></span>
						<h4><span>이벤트</span></h4>											
					</div>
					<div>
						<span class="sb-icon"><img alt="icon" src="<c:url value='/cmn/swatchbook/images/index_icon/member.png'/>"></span>
						<h4><span>회원 정보 관리</span></h4>											
					</div>
					<div>
						<h4><span>Profile</span></h4>
						<span class="sb-toggle">Click to open/close</span>
						<h5><span style="font-size:.8em;color: #c31d00;margin:-10px">We &hearts; Domino</span></h5>											
					</div>
					
				</div><!-- sb-container -->
				
        
			</section>
            <div class="footerLogo" style="margin-top:-150px;margin-left:1600px">
                <img alt="biglogo" style="width:150px" src="<c:url value='/cmn/swatchbook/images/dominologo/logo1(big).png'/>"/>
            </div>
			
        </div>

        
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
		<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>        
        <script type="text/javascript" src="<c:url value='/cmn/swatchbook/js/jquery.swatchbook.js'/>"></script> 
		<script type="text/javascript">
			$(function() {
				$( '#sb-container' ).swatchbook( {
					// number of degrees that is between each item
					angleInc : 15,
					neighbor : 15,
					// if it should be closed by default
					initclosed : true,
					// index of the element that when clicked, triggers the open/close function
					// by default there is no such element
					closeIdx : 13 //총 컨텐츠 수
				} );
					$("#sb-container div").click(function(){
						if($(this).attr("class") == "ff-active")
							$(this).click(function(){
								//alert("성공"+" / "+$(this).index()); //0~12
								switch ($(this).index()) {
								case 0 : location.href="<c:url value='/SalesGraph.do'/>"; return;// 매출 확인
								case 1 : location.href="<c:url value='/Saile.pz'/>"; return; // 할인 쿠폰 관리		 - 등급 및 쿠폰
								case 2 : location.href="<c:url value='/Rating.pz'/>"; return; // 등급 관리		 - 등급 및 쿠폰
								case 3 : location.href="<c:url value='/StoreSer.pz'/>"; return; // 매장 정보 수정		 - 매장 관리
								case 4 : location.href="<c:url value='/StoreInsert.do'/>"; return; // 매장 추가		 - 매장 관리
								case 5 : location.href="<c:url value='/PickleSauceList.do'/>"; return; // 피클&소스 메뉴 관리	 - 상품메뉴 관리
								case 6 : location.href="<c:url value='/DrinkList.do'/>"; return; // 음료 메뉴 관리	     - 상품메뉴 관리
								case 7 : location.href="<c:url value='/ToppingMenu.do'/>"; return; // 토핑 추가		 - 상품메뉴 관리
								case 8 : location.href="<c:url value='/SideMenu.do'/>"; return; // 사이드 메뉴 추가	 - 상품메뉴 관리
								case 9 : location.href="<c:url value='/PizzaList.pz'/>"; return; // 피자 메뉴 추가		 - 상품메뉴 관리
								case 10 : location.href="<c:url value='/Noticelist.do'/>"; return; // 공지사항		 - 이벤트/공지사항
								case 11 : location.href="<c:url value='/Eventlist.do'/>"; return; // 이벤트			 - 이벤트/공지사항
								case 12 : location.href="<c:url value='/Member.do'/>"; return; //회원 정보관리
								default: alert("오류 발생!! 페이지를 새로고침하여 다시 시도해주세요! :("); return;
								}
							});
					});
				});
		</script>
    </body>
</html></html>