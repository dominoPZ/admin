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

<title>상품메뉴 관리</title>

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
         <h1>사이드 메뉴 수정</h1>
      </div>

      <!--  실제 내용의 제목 표시 -->
      <div class="page-header">
         <h1>사이드 메뉴</h1>
      </div>

      <div align="right">
         <!--  실재 내용 표시  -->
         <button type="button" class="btn btn-sm btn-info"
            onclick="location='AddEvent.do'">이벤트 추가</button>
         <div class="col-md-6" style="width: 100%">
            <table class="table table-striped">
               <thead>
                  <tr>
                     <th align="center" style="width: 10%">번호</th>
                     <th style="width: 70%">사이드 메뉴 명</th>
                     <th align="center" style="width: 10%">사이드 메뉴 가격</th>
                     


                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="item" items="${SideMenuList}" varStatus="loop">
                     <tr>
                        <td align="left"><a href='<c:url value="/EventView.do?no=${item.s_no }"/>'>${item.s_no}</a></td>
                        <td ><a href='<c:url value="/EventView.do?no=${item.s_name}"/>'>${item.s_name}</a></td>
                        <td align="center"><a href='<c:url value="/EventView.do?no=${item.s_price}"/>'>${item.s_price}</a></td>
                     </tr>
                  </c:forEach>
               </tbody>
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
