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


<title>이벤트추가</title>

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
			<h1>이벤트 추가</h1>
		</div>

		<div align="right">
			<!--  실재 내용 표시  -->

			<div class="col-md-6" style="width: 100%">
				<form action="<c:url value='/AddEvent.do'/>"
					method="post" enctype="multipart/form-data">
					<table class="table table-striped">
						<tr bgcolor="white">
							<td width="30%" align="center">이벤트 명</td>
							<td><input type="text" name="title" style="width: 98%"
								value="${e_title }" /></td>
						</tr>
						<tr bgcolor="white">
							<td align="center">시작일</td>
							<td><input type="date" name="sdate" style="width: 50%"
								value="${e_sdate }" /></td>
							<!-- 날짜 -->
						</tr>
						<tr bgcolor="white">
							<td align="center">종료일</td>
							<td><input type="date" name="edate" style="width: 50%"
								value="${e_edate }" /></td>
							<!-- 날짜 -->
						</tr>
						<tr bgcolor="white">
							<td align="center">타이틀 이미지</td>
							<td><input type="file" name="timg" size="30"
								value="${e_timg }" /></td>
						</tr>
						<tr bgcolor="white">
							<td align="center">내용 이미지</td>
							<td><input type="file" name="cimg" size="30"
								value="${e_cimg }" /></td>
						</tr>

					</table>
					<!-- <button type="button" onclick="location='AddEvent.do'">등록</button>  -->

					<input type="submit" value="등록" />
				</form>
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

