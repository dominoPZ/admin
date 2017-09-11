<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- jQuery UI용 CSS -->
<!-- <link rel="stylesheet" href="<c:url value='/Styles/jquery-ui.min.css'/>"> -->
<!-- UI용 CSS CDN -->
<link rel="stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/themes/dot-luv/jquery-ui.css">
<!-- 달력 디자인 참고 사이트 : 
	 https://docs.microsoft.com/en-us/aspnet/ajax/cdn/jquery-ui/cdnjqueryui1121
 -->
<!-- jQuery사용을 위한 라이브러리 임베딩 -->
<!-- jQuery Core -->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- jQuery UI -->
<%-- <script src="<c:url value='/JS/jquery-ui.min.js'/>" type="text/javascript"></script> --%>
<!-- UI CDN -->
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/jquery-ui.min.js"></script>
<script>
/* 
	$(function() {
		$("#datepicker").datepicker(); //datepicker()함수의 인자에 "hide"(초기화?)를 주면 처음에 바로 뜨지 않음.
		//하지만 css를 임베딩하면 알아서 처음에 뜨지 않도록 구현되어있기 때문에 "hide"인자를 넣지 않아도 됨.
		$("#datepicker").datepicker( "option", "dateFormat", "yy-mm-dd" );
		$("button").click(function(){
			$("#datepicker").datepicker("show");
		});
		 
		//JSON데이터 형식
		$("#datepicker").datepicker({
			  dateFormat: "yy-mm-dd"
		});
		
		//setter형식
		//$("#datepicker").datepicker( "option", "dateFormat", "yy-mm-dd" );
	});
	 */
//↓이 방법 권장.
	$(function() {
		$("#datepicker").datepicker({
			dateFormat: "yy-mm-dd",
			showOn : "button", //"버튼을 눌렀을 때 show하겠다."
			buttonImage: "<c:url value='/Images/calendar.png'/>",
			buttonImageOnly : true,
			buttonText : "달력"
		});
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>DatePicker.jsp</title>
</head>
<body>
	<fieldset>
		<legend>데이트 피커</legend>
		날짜 <input type="text" id="datepicker" size="30">
			<!-- <button>달력</button> -->
	</fieldset>
</body>
</html>