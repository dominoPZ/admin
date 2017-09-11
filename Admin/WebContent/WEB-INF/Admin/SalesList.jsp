<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
.ui-dialog {
	width: 400px !important;
	height: 100px !important;
}

.popupLayer {
	position: absolute;
	display: none;
	width: 50px;
	height: 50px;
	padding: 10px;
}

.popupLayer div {
	position: absolute;
	top: 5px;
	right: 5px
}

.prd_img_view {
	position: center;
	overflow : hidden;
	 border-radius: 100px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		
		//'돌아가기'버튼
		$("#back").click(function() {
			location.href = '<c:url value="/Member.do"/>';
		});
	
		//피자 이미지 띄우기
		/* 마우스 오버시 근처에 레이어가 나타난다. */
		$('.pizzaName').hover(function(e) {
			console.log("this1:"+$(this).attr("name"));
			console.log("this2:"+$(this).parents().find("img").attr("src"));
			
			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;
			var oWidth = $('.popupLayer').width();
			var oHeight = $('.popupLayer').height();
			// 레이어가 나타날 위치를 셋팅한다.
			var divLeft = e.clientX + 10;
			var divTop = e.clientY + 5;
			// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
			if (divLeft + oWidth > sWidth) divLeft -= oWidth;
			if (divTop + oHeight > sHeight) divTop -= oHeight;
			// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
			if (divLeft < 0) divLeft = 0;
			if (divTop < 0) divTop = 0;
			
			
			$("."+$(this).attr("name")).find('.popupLayer').css({
				"top" : divTop,
				"left" : divLeft,
				"position" : "absolute"
			}).show();
		}, function() {$(".prd_img_view").parent().hide();});
		
		
	});
</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!--
    <link rel="icon" href="../../favicon.ico">
   -->
<title>회원 관리 페이지</title>
<!-- Bootstrap core CSS -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
<!-- Bootstrap theme -->
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />
</head>
<body role="document">
	<div>
		<!--  top  -->
		<jsp:include page="/temp/top.jsp" />
	</div>
	<div class="container theme-showcase" role="main" style='width: 1500px'>
		<div class="jumbotron" style="height: 50px; background: white;">
			<div>
				<h3>
					<span style="color: blue">${id}</span>님의 구매내역 페이지 입니다.
				</h3>
			</div>
		</div>
		<!--  실제 내용의 제목 표시 -->
		<div>
			<!--  실제 내용 표시  -->
			<form id="frm" action="<c:url value='/Member.do' />">
				<div class="page-header" align="right" style="margin-top: 0px; margin-bottom: 0px">
					<h2>구매내역</h2>
				</div>
				<button id="back" title="이전페이지로 이동합니다." class="btn btn-sm btn-info" style="margin-bottom: 5px;margin-top: 5px">돌아가기</button>
				<div class="col-md-14" style='width: 1470px'>
					<!-- style='width:1200px'속성 추가 -->
					<table class="table table-striped">
						<thead style="background: pink;font-weight: bold;font-size: 15px">
							<tr class="secondTbodyTr">
								<td>판매일</td>
								<td>구매번호</td>
								<td title="매장 지점">매장 일련번호</td>
								<td>일련번호</td>
								<td>구매한 메뉴&nbsp;/&nbsp;수량&nbsp;/&nbsp;사이즈</td>
								<td>메뉴 가격</td>
								<td>총 금액</td>
								<td colspan="5">주문한 주소</td>
								<td>주문 상태</td>
							</tr>
						</thead>
						<tbody class="SecondTbody">
							<c:choose>
								<c:when test="${total eq 0}">
									<tr align="center">
										<td colspan="13">구매내역이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${list}">
										<tr id="${item.menu_name}">
											<td>${item.sa_date}</td>
											<td>${item.sa_no}</td>
											<td title="${item.st_name}">${item.st_no}</td>
											<td>${item.sm_no}</td>
											<td class="pizzaName" name="${fn:replace(item.menu_name,' ', '')}">
												${item.menu_name}&nbsp;/&nbsp;${item.menu_qty}
												<c:if test="${!empty item.menu_size}">
													&nbsp;/&nbsp;${item.menu_size}
												</c:if>
											</td>
											<td>${item.menu_price}</td>
											<td>${item.menu_price * item.menu_qty}</td>
											<td colspan="5">
												<c:forEach var="addr" items="${fn:split(item.sa_addr, '%&@#*^$@!') }"> 
													${addr }
												</c:forEach>	
											</td>										
											<td>
												<c:choose>
													<c:when test="${item.sa_pro.contains('미승인')}">
														<span style="color: red;font-weight: bold">${item.sa_pro}</span>
													</c:when>
													<c:otherwise>
														<span style="color: blue;font-weight: bold">${item.sa_pro}</span>
													</c:otherwise>
												</c:choose>
											</td>
											
											<!-- 피자 이미지 폼 레이어  -->
											<div class="${fn:replace(item.menu_name,' ', '')}">
											<div class="popupLayer">
												<div class="prd_img_view">
													<img style="height: 200px" src="<c:url value='/Image/'/>${fn:replace(item.menu_name,' ', '')}.jpg"/>
												</div>
											</div>											
											</div>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</form>
		</div>
		<h4 align="right" style="margin-right: 10px">'${id}'회원의 구매내역 총 합계 금액 : <span style="font-weight: bold;"><fmt:formatNumber value="${total}" />원</em></span></h4> 
	</div>
	</div>
	
	
	
	<!-- 내용 끝 -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="<c:url value='/BootStrap/js/bootstrap.min.js' />"></script>
</body>
</html>