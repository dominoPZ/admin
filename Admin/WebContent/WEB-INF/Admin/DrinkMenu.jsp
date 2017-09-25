<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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

    <title>음료 추가</title>

    <!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />

	<link rel="stylesheet" type="text/css" href="<c:url value='/cmn/main.css'/>">
	<script src="<c:url value='/cmn/app.js'/>"></script>


<style>
.ih-item.circle.effect10.colored .info {
    background: #c3dbd4;
}
.addLi {
    float: left;
    list-style: none;
}
.ih-item.circle.effect10 .info p {
    color: #126b53;
    font-style: italic;
    font-size: 16px;
    border-top: 1px solid rgba(255, 255, 255, 0.5);
}
.ih-item.circle.effect10 .info h3 {
    color: #102b6b;
    text-transform: uppercase;
    vertical-align: middle;
    /* position: relative; */
    letter-spacing: 2px;
    font-size: 22px;
    font-weight: bold;
    text-shadow: 0 0 2px white, 0 1px 2px rgba(0, 0, 0, 0.3);
}

thead {
    display: table-header-group;
    text-align : center;
    vertical-align: middle;
    border-color: inherit;
}

#addDrinkDisplayList {
	display : none;
}

</style>


<script>
var add=false;


var tagStr1 = '';
var tagStr2 = '';
var tagStr3 = '';
var tagStr4 = ''; 		
var tag1 = '';
var tag2 = '';
var tag3 = '';
var tag4 = ''; 		
var id;
var name;
var price;
var img;

	//등록, 수정, 삭제 중인지 체크
	var check = function(checkVal){
		if(checkVal){			
			alert("등록을 끝낸 후 실행해주세요.");
			return;
		}
	}

    //음료 추가
	 var addDrink = function(){
    	add = true;
		 $("#addDrink").css("display","");
		 $(":text:first").focus()
	 }
	 
		function isValidate(formObject) {
		    if(formObject.d_name.value.length == 0){
		       alert("음료명을 입력 하세요");
		       formObject.d_name.focus();
		       return false;
		    }
		     if(formObject.d_price.value == 0){
		       alert("음료 가격을 입력 하세요");
		       formObject.d_price.focus();
		       return false;
		    }
		     if(formObject.d_price.value < 0){
			       alert("음료 가격은 숫자만 입력가능 합니다.");
			       formObject.d_price.focus();
			       return false;
			    }
		     if(formObject.d_img.value == 0){
		         alert("이미지 파일을 선택해 주세요");
		         formObject.d_img.focus();
		         return false;
		      }
		      
		     if(validate()){
				$("#addDrink").css("display","none");
				$("#editDrink").css("display","none");
				add = false;
		     }
		 }
		
		//선택한 파일이 이미지 파일인지 체크
		function validate() {
	    	 var extensions = new Array("jpg","jpeg","gif","png","bmp");  //이곳에 업로드 가능한 확장자 기재
	    	 var d_img = document.form.d_img.value;
	    	 var image_length = document.form.d_img.value.length;
	    	 var pos = d_img.lastIndexOf('.') + 1;
	    	 var ext = d_img.substring(pos, image_length);
	    	 var final_ext = ext.toLowerCase();
	    	 for (i = 0; i < extensions.length; i++){
	    	 	if(extensions[i] == final_ext){
	    	 	return true;
	    	 	}
	    	 }
	    	 	alert(extensions.join(', ') +"파일만 등록 가능합니다.");
	    	 return false;
	    	 }
				
		 var addDrinkCancel = function(){
			 	if(confirm("작성중인 값은 저장 되지 않습니다.\r\n등록을 취소하시겠습니까?"))
			 		$("#addDrink").css("display","none");
		 }
		 
		 var editDrinkCancel = function(){
			if(confirm("작성중인 값은 저장 되지 않습니다.\r\n수정을 취소하시겠습니까?")){
				//location.href="<c:url value='DrinkList.do'/>";
				$("#"+id).children("td:eq(1)").html(tag1);
				$("#"+id).children("td:eq(2)").html(tag2);
				$("#"+id).children("td:eq(3)").html(tag3);
				$("#"+id).children("td:eq(4)").html(tag4);
				//$(".data").find($("td")).not($(".firstTd")).parents().children("td").html(tag1);
/* 				$(".data").find($("td")).not($(".firstTd")).parents().children("td:eq(2)").html(tag2);
				$(".data").find($("td")).not($(".firstTd")).parents().children("td:eq(3)").html(tag3);
				$(".data").find($("td")).not($(".firstTd")).parents().children("td:eq(4)").html(tag4); */
			}
				 
			
		 }
		 
		 
		 //음료 수정
		 var editDrink = function(){
			 check(add);
			 $("#message").html("<span style='font-size:18px;color: blue;margin-top: 40px;margin-bottom: 40px'>수정 모드입니다. 상단의 원모양 이미지를 클릭하시거나 아래 음료리스트의 행을 클릭하시면 수정모드로 변환합니다.</span>");
 			 	$("tr:gt(0)").each(function() {
			 		$(this).css("cursor","pointer");
					//원래 배경색 가져오기
					var color = $(this).css("background-color");
					$(this).hover(function() {//마우스 오버
						$(this).css("background-color", "#ffd0be");
					}, function() {//마우스 아웃
						//원래 배경색으로 변경]
						$(this).css("backgroundColor", color);
					});
				}); 
			 	
 					var tagStr1 = '';
 					var tagStr2 = '';
 					var tagStr3 = '';
 					var tagStr4 = ''; 			
		 				

		 		$(".data").find($("td")).not($(".firstTd")).click(function() {
		 			if(tagStr1.length == 0){

		 				
		 				tag1 = $(this).parents().children("td:eq(1)").html();
		 				tag2 = $(this).parents().children("td:eq(2)").html();
		 				tag3 = $(this).parents().children("td:eq(3)").html();
		 				tag4 = $(this).parents().children("td:eq(4)").html();
		
						id = $(this).parents().attr("id");
	 					name = $(this).parents().children("td:eq(1)").text();
						price = $(this).parents().children("td:eq(2)").text();
						img = $(this).parents().children("td:eq(3)").html();
	 					tagStr1 = '<input type="text" size="30" placeholder="등록하실 음료명을 입력해주세요." name="d_name" value="'+name+'"/>';				
	 					tagStr2 = '<input type="text" size="15" placeholder="가격을 입력해주세요." name="edit_price" value="'+price+'"/>';
	 					tagStr3 = '<input type="file" name="d_img" style="width:98%;padding-left:30px" id=edit_img/>';
	 					tagStr4 = '<input type="submit" id="editOk" style="margin-right:5px" name="submit" size="30" class="btn btn-sm btn-info" value="수정" />'
								+ '<input type="button" value="취소" class="btn btn-sm btn-info" OnClick="javascript:editDrinkCancel()" />';

						$(this).parents().children("td:eq(1)").html(tagStr1);
						$(this).parents().children("td:eq(2)").html(tagStr2);
						$(this).parents().children("td:eq(3)").html(tagStr3);
						$(this).parents().children("td:eq(4)").html(tagStr4);
						 
						//location.href = '<c:url value="/SalesList.do?salesList='+ id + '"/>';
		 			}
				});
		 }
		 
	 $(function(){
	 
	 });
</script>



  </head>




  <body role="document">

  <div>
	<!--  top  --> 
	<jsp:include page="/temp/top.jsp" />
 </div>
	
    <div class="container theme-showcase" role="main">
		<!-- Main jumbotron for a primary marketing message or call to action -->
	      <div class="jumbotron">
	        <h2>음료 관리(등록/수정/삭제) 페이지 입니다.</h2>
	      </div>
	      
	      <div class="page-header">
	        <span style="font-size: 20px">음료 목록</span>
	        <input type=checkbox value="음료 수정" class="btn btn-sm btn-info" OnClick="javascript:editDrink()" style="float:right;margin-left: 8px">
	        <input type=button value="음료 추가" class="btn btn-sm btn-info" OnClick="javascript:addDrink()" style="float:right">
	      </div>

 <%-- 	<input type=button value="음료 추가" class="btn btn-sm btn-info" OnClick="location.href='<c:url value="/InsertDrink.do"/>'"> --%>

 	
 		
 		
 		

       	  <div><!-- class="col-md-6" 간격조정 때문에 삭제 -->
       	  
       	  
       	  
       	  
       	  
<div class="CircleEvent" style="float:right;margin-left:50px">
<ul>
	<c:forEach items="${drinkList}" var="list">
	<li class="addLi">
			<div class="row"  style="padding: 15px">
				<div class="col-sm-6">
					<!-- colored -->
					<div class="ih-item circle colored effect10 bottom_to_top">
						<a href="#">
							<div class="img">
								<img alt="${list.d_img}" src="<c:url value='/Image/sidedish/beverage/'/>${fn:replace(list.d_img,' ', '')}">
							</div>
							<div class="info">
								<h3 style="font-family:맑은 고딕;font-size:15px;line-height:1.4em;vertical-align: middle;">${list.d_name}</h3>
								<p>
									<fmt:formatNumber value="${list.d_price}" /> 원
								</p>
							</div>
						</a>
					</div>
					<!-- end colored -->
				</div>
				</div>
	</li>
		</c:forEach>
</ul>
</div>       	  
        
	 <div style="width: 100%;text-align:center;" id="message"></div>
	 
          <table class="table table-striped" style="margin-bottom:150px;text-align:center;vertical-align: middle;">
            <thead >
              <tr>
                <th style="width:110px">일련번호</th>
                <th style="width:600px">음료</th>
                <th style="width:150px">가격</th>
                <th style="width:400px">이미지파일</th>
                <th style="width:200px">이미지</th>
              </tr>
            </thead>
            <tbody class="tbodyClass"> 
            <c:forEach items="${drinkList}" var="list" varStatus="loop">
              <tr class="data" id="${list.dr_no}" title="클릭하시면 '${list.d_name}'를 수정합니다.">
                <%-- <td>${list.dr_no}</td> --%>
                <td class="firstTd">${loop.count}</td>
                <td>${list.d_name}</td>
                <td><fmt:formatNumber value="${list.d_price}"/></td>
                <td>${list.d_img}</td>
                <td>
                	<img style="height:80px;border-radius: 60px;" alt="${list.d_img}" 
                		src="<c:url value='/Image/sidedish/beverage/'/>${fn:replace(list.d_img,' ', '')}">
                </td>
                <c:set var="loopCount" value="${loop.count}"/>
              </tr>

              
            </c:forEach>
            
            
            <form name="form" onsubmit="return isValidate(this);" action="<c:url value='/EditDrink.do'/>" method="post" enctype="multipart/form-data" >
   	 				<input type="hidden" size="30" placeholder="등록하실 음료명을 입력해주세요." name="d_name" value=" "/>		
	 				<input type="hidden" size="15" placeholder="가격을 입력해주세요." name="edit_price" value="<fmt:formatNumber value=' '/>"/>
	 				<input type="file" name="d_img" style="display:none;width:98%;padding-left:30px" id=edit_img/>
	 				<input type="hidden" id="editOk" style="margin-right:5px" name="submit" size="30" class="btn btn-sm btn-info" value=" " />
					<input type="hidden" value="취소" class="btn btn-sm btn-info" OnClick="javascript:editDrinkCancel()" />
            
              </form>
            
        
	              <form name="form" onsubmit="return isValidate(this);" action="<c:url value='/InsertDrink.do'/>" method="post" enctype="multipart/form-data">
		               <tr id="addDrink" style="display:none">
		               	<td>${loopCount+1}</td>
		                <td><input type="text" size="30" placeholder="등록하실 음료명을 입력해주세요." name="d_name" value="${d_name == null ? '' : d_name}"/></td>
		                <td><input type="text" size="15" placeholder="가격을 입력해주세요." name="d_price"  value="${d_price == null ? '' : d_price}"/></td>
		                <td> 
		                	${d_img == null ? '' : d_img }
	                        <input type="file" name="d_img" style="width:98%;padding-left:30px" id=t_img/>
						</td>
						<td colspan="2">
							<input type="submit" id="addOk" name="submit" size="30" class="btn btn-sm btn-info" value="등록" />
							<input type=button value="취소" class="btn btn-sm btn-info" OnClick="javascript:addDrinkCancel()" />
						<td>
		              </tr>             	
	              </form>
  
              	
              	
            </tbody>
          </table>
        </div>
      </div>      
	      </div>
	


    <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>
  </body>
</html>
    
    