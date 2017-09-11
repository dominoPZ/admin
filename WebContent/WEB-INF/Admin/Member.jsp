<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>

<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.firstTbody {cursor: pointer;}
.ui-dialog {
	width: 400px !important;
	height: 100px !important;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function(){
	//UI-회원리스트 배경처리용
 	$("tr:gt(1)").each(function(idx) {
			//원래 배경색 가져오기
			var color = $(this).css("background-color");
			$(this).hover(function() {//마우스 오버
				$(this).css("backgroundColor", "#ffd0be");
			}, function() {//마우스 아웃
				//원래 배경색으로 변경]
				$(this).css("backgroundColor", color);
			});
		});
 	//탈퇴 처리용
	$("button").filter("#levbtn").click(function() {
			if ($(":checked").length == 0) {
				$(this).attr("type", "button");
				alert("탈퇴시킬 회원을 체크해주세요.");
				location.href = '<c:url value="/Member.do"/>';
			} else {
				if (confirm("선택하신 회원을 탈퇴시키겠습니까?\r\n※탈퇴시킨 회원은 영구삭제됩니다.")) {
					$("#frm").attr("method", "post");
					$(":hidden").val("DEL");
				} else {
					$(this).attr("type", "button");
					location.href = '<c:url value="/Member.do"/>';
				}
			}
		});
	//탈퇴 처리용-체크박스 부분
		$(":checkbox").click(function() {
							if ($(this).val() == "all") { //전체 선택 클릭시			
								if ($(this).filter(":checked").length == 1) {
									$(":checkbox").each(function() {
										$(this).get(0).checked = "checked";
									});
								} else {
									$(":checkbox").each(function() {
										$(this).get(0).checked = "";
									});
								}
							} else {
								if ($(this).filter(":checked").length == 1) {
									if ($(":checkbox:checked").length == $(":checkbox:gt(0)").length) {
										$(":checkbox:first").get(0).checked = "checked";
									}
								} else {
									$(":checkbox:first").val([ "" ]);
								}
							}
						});
	//구매내역페이지로 이동
 		$(".firstTbodyTr").find($("td")).not($(".checkcheck")).click(function() {
					var id = $(this).parents().attr("id");
					location.href = '<c:url value="/SalesList.do?salesList='+ id + '"/>';
		});
	
	//정렬 순서 처리용]
	$(":radio").change(function(){
		value = $(this).val();
		location.href = '<c:url value="/Member.do?radioV='+ value + '"/>&searchColumn=${searchColumn}&searchWord=${searchWord}';
	});
	switch ("${radioCheck}") {
		case "name": $(":radio:eq(1)").attr("checked","checked"); break;
		case "birth": $(":radio:eq(2)").attr("checked","checked"); break;
		case "email": $(":radio:eq(3)").attr("checked","checked"); break;
		case "rating": $(":radio:eq(4)").attr("checked","checked"); break;
		default: $(":radio:eq(0)").attr("checked","checked");
	}

	//전체 회원목록 보기 처리용]
	$("#allMember").click(function() {
		location.href = '<c:url value="/Member.do"/>';
	});	
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
	<div class="container theme-showcase" role="main" style='width:1500px'>
		<div class="jumbotron" style="height: 50px; background: white;">
			<div>
				<h3>회원 관리 페이지 입니다.</h3>
			</div>


		</div>
		<!--  실제 내용의 제목 표시 -->

	
<!-- ------기능 테이블 시작------ -->

<div style="margin-left: 50px">
				<span style="font-weight: bold;font-size: 1.5em">정렬 순서</span>
				&nbsp;&nbsp;
				<input type="radio" value="id" name="order" />ID 순&nbsp;
				<input type="radio" value="name" name="order" />이름 순&nbsp;
				<input type="radio" value="birth" name="order" />생년월일 순&nbsp;
				<input type="radio" value="email" name="order" />이메일 순&nbsp;
				<input type="radio" value="rating" name="order" />등급 순&nbsp;
				
			
		<form id="searchFrm" action="<c:url value='/Member.do' />">
			<table class="tg">
				<tr>
					<td><span style="font-weight: bold;font-size: 1.5em">검색&nbsp;&nbsp;</span></td>
					
					<th class="tg-031e">
						<select name="searchColumn">
							<option value="id">ID</option>
							<option value="name">이름</option>
							<option value="email">이메일</option>
						</select> 
						<input type="text" name="searchWord" placeholder="검색어를 입력하세요"/> 
						<input type="submit" value="검색" />
					</th>
				</tr>
			</table>

		</form>
</div>
		<!-- ------기능 테이블 끝------ -->	




			<!--  실제 내용 표시  -->
			<form id="frm" action="<c:url value='/Member.do' />">
							<div align="right">

				<button id="allMember" class="btn btn-sm btn-info" >전체 회원목록 보기</button>
				</div>
				<div class="page-header" align="right" style="margin-top: 0px;margin-bottom: 0px">
					<h2>회원목록</h2>
				</div>
				<button id="levbtn" type="submit" class="btn btn-sm btn-info" style="margin-bottom: 5px;margin-top: 5px">탈퇴</button>


				<div class="col-md-14" style='width: 1470px'>
					<!-- style='width:1200px'속성 추가 -->

					<table class="table table-striped">



						<thead style="background:#ff8f64;font-weight: bold;font-size: 15px">
							<tr>
								<th><input type="checkbox" value="all" name="allCheck" /></th>
								<th>ID</th>
								<th>Password</th>
								<th>이름</th>
								<th>성별</th>
								<th>생년월일</th>
								<th>우편번호</th>
								<th colspan="2">기본주소</th>
								<th colspan="2">상세주소</th>
								<th>이메일</th>
								<th>연락처</th>
								<th>등급</th>
								<th>회원정보 수정</th>
							</tr>
						</thead>

						<tbody class="firstTbody">
							<c:choose>
								<c:when test="${empty list }">
									<tr align="center">
										<td colspan="15">등록된 회원이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${list}">
										<tr class="firstTbodyTr" id="${item.id}" title="클릭하시면 '${item.id}'회원의 구매내역 페이지로 이동합니다.">
											<td class="checkcheck"><input type="checkbox" value="${item.id}" name="leave" /></td>
											<td class="customerId">${item.id}</td>
											<td>${item.pass}</td>
											<td>${item.name}</td>
											<td>${item.gender}</td>
											<td>${item.birth}</td>
											<td>${item.post}</td>
											<c:forEach var="addr" items="${fn:split(item.addr, '%&@#*^$@!') }"> 
												<td colspan="2">${addr }</td>
											</c:forEach>
											<td>${item.email}</td>
											<td>${item.tel}</td>
											<td>${item.r_name}</td>
											<td class="edit" align="center" title="'${item.id}'회원의 정보를 수정합니다.">
												<a href="<c:url value='/MemberEdit.do?id=${item.id}'/>">
													<input type="button" id="editBtn" value="수정"/>
												</a>
											</td>
										</tr>
										
										
										
										<input type="hidden" name="mode" />
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</form>
		</div>
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