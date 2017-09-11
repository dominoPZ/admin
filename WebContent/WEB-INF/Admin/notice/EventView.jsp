<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<title>이벤트 & 공지사항</title>

<!-- Bootstrap core CSS -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
<!-- Bootstrap theme -->
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />


</head>

<body role="document">

	<div>
		<!--  top  -->
		<jsp:include page="/temp/top.jsp" />
	</div>

	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>이벤트/공지사항</h1>
		</div>

		<!--  실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1>이벤트</h1>
		</div>

		<div align="right">
			<!--  실제 내용 표시  -->
			<div class="col-md-6" >
				<table class="table table-striped" style="width: 100%">
					<tr bgcolor="white">
						<td width="20%" align="center">글 번호</td>
						<td width="100%" align="center">${event.e_no }</td>
					</tr>
					<tr bgcolor="white">
						<td width="*" align="center">제목</td>
						<td width="100%" align="center">${event.e_title }</td>
					</tr>
					<tr bgcolor="white">
						<td width="*" align="center">시작일</td>
						<td width="100%" align="center">${event.e_sdate }</td>
					</tr>
					<tr bgcolor="white">
						<td width="*" align="center">종료일</td>
						<td width="100%" align="center">${event.e_edate }</td>
					</tr>
					<tr bgcolor="white" >
						<td width="*" align="center" colspan="2">타이틀 이미지</td>
					</tr>
					<tr bgcolor="white">
						<td width="100%" align="center" colspan="2"><img alt="d" src="<c:url value='/EventImage/${event.e_timg }'/>"></td>
					</tr>
					<tr bgcolor="white">
						<td width="*" align="center" colspan="2">내용 이미지</td>
					</tr>

					<tr bgcolor="white">
						<td width="100%" align="center" colspan="2"><img alt="d" src="<c:url value='/EventImage/${event.e_cimg }'/>"></td>
					</tr>
					<tr bgcolor="white" align="center">
						<td colspan="2"><a href="<c:url value='/EditEvent.do?no=${event.e_no }'/>">수정</a> | 
						<a href="<c:url value='/DeleteEvent.do?no=${event.e_no }'/>">삭제</a> |
						<a href="<c:url value='/Eventlist.do'/>">목록</a></td>
					</tr>
				</table>

			</div>
		</div>
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

