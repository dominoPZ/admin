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
<style>
	.ui-dialog{
		width: 400px !important;
		height: 100px !important;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
$(function(){
/*  	
 	$("tr:gt(0)").each(function(idx) {
			//원래 배경색 가져오기
			var color = $(this).css("background-color");
			$(this).hover(function() {//마우스 오버
				$(this).css("backgroundColor", "#99d9f0");
			}, function() {//마우스 아웃
				//원래 배경색으로 변경]
				$(this).css("backgroundColor", color);
			});
		});
	  
	 */
 //	 $(".content").hide();
/*
	 $(".title").on("click",function(){
			$(this).slideDown(300,function(){
			});			
		}); */
		
/* 		
 		
		 var title;
		$("tr:gt(0)").click(function(){

			console.log("네번째:"+title);
			console.log("다섯번째:"+this.title);
			
			//기존에 펼처진 게 있다면 숨기기
			$(".content").slideUp(300);
			//다른 제목 클릭시
			if(title != this.title){
				//해당 클릭한 제목의 내용 보이기
				$(this).next().slideDown(300);
				//title을 클릭한 제목으로 다시 설정
				title = this.title;
			}
			else{//title과 같은 제목 클릭시 다시 초기화함.
				title="";//클릭하지 않은 상태로..
			}
		});		
		 
		
		
		 */
		 
		 

		 
		 //$(".SecondTbody tr").hide();
		 //$(".SecondTbody tr").css("backgroundColor","yellow");
//html에서 for문 돌릴 때 클래스명에 count주고 jquery에서 그 클래스명 얻어와서 걔를 열리게
/* 			var title;
			$(".firstTbodyTr").click(function(){
				
 				 var index = $("tr").index(this);
				   $("li:eq(" + index + ")").attr("data-val", "hello");
				 
				console.log("1번째:");
				console.log("2번째:"+$(this).filter("tr").attr("id"));
				console.log("3번째:"+$(this).attr("class"));
				
				//.slideDown(300))
				$(".secondTbodyTr:eq(1)").slideUp(300);
				 //class="secondTbodyTr"
				//$("tr:eq(" + $(this).filter("tr").attr("id") + ")").attr("data-val", "hello");
			$(".secondTbody").filter($("#2")).slideUp(300);
			
	
				});
				
				 */
				
				
				
/* 				//다른 제목 클릭시
				if(title != this.title){
					
					//해당 클릭한 제목의 내용 보이기
					$(this).next().slideDown(300);
					//title을 클릭한 제목으로 다시 설정
					title = this.title;
				}
				else{//title과 같은 제목 클릭시 다시 초기화함.
					title="";//클릭하지 않은 상태로..
				} */
		//	});		
		 
		 

		 
/* 	  
	$("tr:gt(0)").click(function(){
		$(this).css("backgroundColor","#0e9ed2").css("border", "3px solid #016488");
	});
	
	 */
/* 	//구매내역 출력용.
	 $("tr:gt(0)").click(function(){
		 	<c:set var="salesList" value="salesList" scope="request"/>
		 	location.href = '<c:url value="/Member.do"/>';
		});
	 
	 
 	 */
		$(":checkbox")
				.click(
						function() {
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
		$("button").filter("#levbtn").click(function() {
			if ($(":checked").length == 0) {
				$(this).attr("type","button");
				alert("탈퇴시킬 회원을 체크해주세요.");
				location.href = '<c:url value="/Member.do"/>';
			} else {
				if (confirm("선택하신 회원을 탈퇴시키겠습니까?\r\n※탈퇴시킨 회원은 영구삭제됩니다.")){
					$("#frm").attr("method", "post");
					$(":hidden").val("DEL");
				}
				else{
					$(this).attr("type","button");
					location.href = '<c:url value="/Member.do"/>';
				}
			}
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

		<div>


			<!--  실제 내용 표시  -->
			<form id="frm" action="<c:url value='/Member.do' />">
				
				<div class="page-header" align="right" style="margin-top: 0px;margin-bottom: 0px">
					<h2>회원목록</h2>
					
				</div>
<button id="levbtn" type="submit" class="btn btn-sm btn-info" style="margin-bottom: 5px;margin-top: 5px">탈퇴</button>


				<div class="col-md-14" style='width: 1470px'>
					<!-- style='width:1200px'속성 추가 -->

					<table class="table table-striped">



						<thead style="background: pink">
							<tr>
								<th><input type="checkbox" value="all" name="check" /></th>
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
							</tr>
						</thead>




						<tbody class="firstTbody">
							<c:choose>
								<c:when test="${empty list }">
									<tr align="center">
										<td colspan="12">등록된 회원이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${list}">
										<tr class="firstTbodyTr">
											<td><input type="checkbox" value="${item.id}" name="leave" /></td>
											<td>${item.id}</td>
											<td>${item.pass}</td>
											<td>${item.name}</td>
											<td>${item.gender}</td>
											<td>${item.birth}</td>
											<td>${item.post}</td>
											<c:forEach var="addr" items="${fn:split(item.addr, '@#$') }">
												<td colspan="2">${addr }</td>
											</c:forEach>
											<td>${item.email}</td>
											<td>${item.tel}</td>
											<td>${item.r_name}</td>
										</tr>
										<!-- 									
									<tr align="center">
										<td colspan="12">구매내역입니다.</td>
									</tr>
									 -->


										<tbody class="SecondTbody">
											<tr class="secondTbodyTr">
												<td colspan="2" align="right">판매일</td>
												<td title="매장 지점">구매번호</td>
												<td>매장 일련번호</td>
												<td>일련번호</td>
												<td>구매한 메뉴명</td>
												<td>주문 수량</td>
												<td>주문 사이즈</td>
												<td>메뉴 가격</td>
												<td>총 금액</td>
												<td colspan="3">주문한 주소</td>
												<td>주문 상태</td>
											</tr>
											<c:choose>
												<c:when test="${empty list }">
													<tr align="center">
														<td colspan="12">등록된 구매내역이 없습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach var="item" items="${list}"  varStatus="loop">
														<tr id="${loop.count}">
															<td colspan="2" align="right">${item.id}</td>
															<td>${item.pass}</td>
															<td>${item.gender}</td>
															<td>${item.birth}</td>
															<td>${item.pass}</td>
															<td>${item.name}</td>
															<td>${item.gender}</td>
															<td>${item.birth}</td>
															<td colspan="4">${item.post}</td>
															<td>${item.birth}</td>
														</tr>
													</c:forEach>
												</c:otherwise>

											</c:choose>
										</tbody>
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
<!-- 			<div>
			<h2>제목3</h2>
		</div>
		<div class="content">
			내용입니다3<br /> 
			내용입니다3<br /> 
			내용입니다3<br />
		</div> -->
	<!-- 내용 끝 -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="<c:url value='/BootStrap/js/bootstrap.min.js' />"></script>
</body>
</html>