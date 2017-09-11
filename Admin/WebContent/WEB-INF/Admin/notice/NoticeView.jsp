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
			<h1>공지사항</h1>
			
		</div>

		<div align="right">
			<!--  실재 내용 표시  -->
			<div class="col-md-6" >
				<table class="table table-striped" style="width: 100%">
					<tr bgcolor="white">
						<td width="20%" align="center">글 번호</td>
						<td width="100%" align="center">${notice.n_no }</td>
					</tr>			
					<tr bgcolor="white">
						<td width="*" align="center">제목</td>
						<td width="100%" align="center">${notice.n_title }</td>
					</tr>
					<tr bgcolor="white">
						<td width="*" align="center">작성일</td>
						<td width="100%" align="center">${notice.n_date }</td>
					</tr>
					<tr bgcolor="white">
						<td width="*" align="center">공지 분류</td>
						<c:if test="${notice.n_type==1 }" var="i">
						<td style="display: none" width="100%" align="center" >${notice.n_type }</td>
						<td width="100%" align="center">도미노뉴스</td>
						</c:if>
						<c:if test="${!i}" >
						<td style="display: none" width="100%" align="center">${notice.n_type }</td>
						<td width="100%" align="center">PRESS</td>
						</c:if>
					</tr>
					<tr bgcolor="white">
						<td width="*" align="center" colspan="2">이미지파일</td>
					</tr>
					<tr bgcolor="white">
						<td width="100%" align="center" colspan="2"><img alt="첨부사진없음" src="<c:url value='/NoticeImage/${notice.n_img }'/>"></td>
					</tr>
					<tr bgcolor="white">
						<td width="*" align="center" colspan="2">내용</td>
					</tr>
					<tr bgcolor="white">
						<td width="100%" colspan="2">${notice.n_content }</td>
					</tr>

					<tr bgcolor="white" align="center">
						<td colspan="2">
							<a href="<c:url value='/EditNotice.do?no=${notice.n_no }'/>">수정</a> | 
							<a href="<c:url value='/DeleteNotice.do?no=${notice.n_no }'/>">삭제</a> |
							<a href="<c:url value='/Noticelist.do'/>">목록</a></td>
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

