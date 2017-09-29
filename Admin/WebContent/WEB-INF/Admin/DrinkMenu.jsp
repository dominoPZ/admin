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

    <title>상품메뉴 관리</title>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>

    <!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />

	<link rel="stylesheet" type="text/css" href="<c:url value='/cmn/main.css'/>">
	<script src="<c:url value='/cmn/app.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/cmn/check.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/cmn/check2.css'/>">

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
    color: #ffffff ; /* #102b6b; */
    text-transform: uppercase;
    vertical-align: middle;
    /* position: relative; */
    letter-spacing: 2px;
    font-size: 22px;
    font-weight: bold;
    text-shadow: 0 0 2px white, 0 1px 2px rgba(0, 0, 0, 0.9);
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

.CircleEvent {
 cursor: default;
}




/* Red */
*, *:before, *:after {
  box-sizing: border-box;
}

/* 
body {
  background: #e0e0e0;
  font-family: 'Open Sans', sans-serif;
  -webkit-font-smoothing: antialiased;
  font-weight: 400;
  font-size: 16px;
  color: #555;
  letter-spacing: 0.02em;
  text-transform: uppercase;
} */

.row {
  background: #fff;
  padding: 20px;
  position: relative;
  margin: 0 0 1px 0;
}
.row:hover {
  cursor: pointer;
}
.row.selected {
  background: #f3f3f3;
}

label {
  cursor: pointer;
}
label:before {
  display: inline-block;
  content: "+";
  margin: 0 10px 0 0;
  width: 35px;
  height: 35px;
  border: 3px solid #f95e5e;
  border-radius: 100%;
  vertical-align: middle;
  color: #f95e5e;
  font-size: 30px;
  text-align: center;
  font-weight: 700;
  line-height: 0.9em;
  transition: transform 0.2s ease-in-out;
}

input[type=checkbox]:checked + label:before {
  background: #f95e5e;
  color: #fff;
  transform: rotate(135deg);
  transform-origin: center center;
}

input[type=checkbox] {
  visibility: hidden;
}


.jumbotron {
    margin-left: 70px;
    background-image: url(/Admin/Image/backend_beverage.png);
    background-color: white;
    width: 1000px;
    height: 241px;
}





</style>


<script>
var add=true;
var edit=true;
var editcount = 0;
var flagedit = true;
var id;

	//등록, 수정 중인지 체크
	var check = function(checkVal){
		if(!checkVal){			
			alert("음료 등록중입니다.\r\n음료 등록을 끝낸 후 실행해주세요.");
			$("#checkbox2").get(0).checked = "";
			return false;
		}
		else{
			return true;
		}
	}
	
    //음료 추가
	 var addDrink = function(){
    	if(!($(":checked").val() == 'on')) {
    		addDrinkCancel();
    		return;
    	}
    	if(!flagedit){
			alert("음료 수정중입니다.\r\n음료 수정모드 버튼을 클릭하여 모드를 변경 후 실행해주세요.");
			$("#checkbox").get(0).checked = "";
			return;
    	}
    	edit=true;
    	add = false;
		 $("#addDrink").css("display","");
		 $("#focus").focus();
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
		     if(!$.isNumeric(formObject.d_price.value)){
			       alert("음료 가격은 숫자만 입력가능 합니다.");
			       formObject.d_price.focus();
			       return false;
			    }
		     if(formObject.d_img.value == 0){
		         alert("이미지 파일을 선택해 주세요");
		         formObject.d_img.focus();
		         return false;
		      }
		      
				$("#addDrink").css("display","none");
				$("#editDrink").css("display","none");
				add = true;
				edit= true;
				$("#checkbox").get(0).checked = "";
				$("#checkbox2").get(0).checked = "";
		 }
		
		 var addDrinkCancel = function(){
			 	if(confirm("작성중인 값은 저장 되지 않습니다.\r\n등록을 취소하시겠습니까?")){
			 		$("#addDrink").css("display","none");
			 		add=true;
			 		$("#checkbox").get(0).checked = "";
			 	}
		 }
		 
		 var editDrinkCancel = function(){
			if(confirm("작성중인 값은 저장 되지 않습니다.\r\n수정을 취소하시겠습니까?")){
			 		$("."+id).hide();
			 		$("#"+id).show();
			 		edit = false;
		 		
			}
		 }
		 var deleteDrink = function(no){
			if(confirm("선택하신 음료정보를 삭제하시겠습니까?\r\n음료의 정보는 영구적으로 삭제됩니다.")){
			 	location.href="<c:url value='/DrinkEdit.do?delete=DEL&no="+no+"'/>";
			 	edit = false;
			}
		 }
		 
		 //음료 수정
		 var editDrink = function(){
			if(check(add)){
			 edit = false;
			 flagedit = false;
				if($(":checked").length == 1){
			 
			 $("#message").html("<span style='font-size:18px;color: blue;margin-top: 40px;margin-bottom: 40px'>수정 모드입니다. 아래 원모양 이미지를 클릭하시거나 하단의 음료리스트의 행을 클릭하시면 수정폼으로 변경됩니다.</span>");
 			 	$("tr:gt(0)").each(function() {
			 		$(this).css("cursor","pointer");
				}); 
 			 	
 			 		
 				$(".addLi").click(function() {
					if(edit == false){
						$("#h_"+this.id).hide();
						id = "h_"+this.id;
				 		$("."+id).show();
				 		$("."+id).find(":text:eq(0)").focus();
				 		edit = true;
					}
					else if(edit == true && flagedit == false){
						alert("수정은 여러행을 동시에 진행할 수 없습니다.");
						return;
					}
					else if(editcount == 1){
						return;
					}

 				});
 				 
			 		$(".tbodyClass .data").click(function() {
							if(edit == false){
								 $(this).hide();
								id = this.id;
						 		$("."+id).show();
						 		$("."+id).find(":text:eq(0)").focus();
						 		edit = true;
							}
							else if(edit == true && flagedit == false){
								alert("수정은 여러행을 동시에 진행할 수 없습니다.");
								return;
							}
							else if(editcount == 1){
								return;
							}

			 		}); 
			 }
			
			else{
				$("#checkbox2").get(0).checked = "";
				$("#message").html("");
 			 	$("tr:gt(0)").each(function() {
			 		$(this).css("cursor","");
				}); 
 			 	editDrinkCancel();
 			 	add=true;
 			 	edit=true;
 			 	editcount = 0;
 			 	flagedit = true;
 			 	return;
				}
			}
		 }
		 
		// IE9+
		 $('.row').on('click', function() {
		   
		    // Clicking on the parent row will toggle the child check box
		    $('input[type=checkbox]', this).prop('checked', function(i, checked){
		       return !checked
		    })

		   // Add selected class when box is checked
		   if($('input[type=checkbox]', this).prop('checked'))
		     $(this).addClass('selected');
		   else
		     $(this).removeClass('selected');
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
		
<%-- 		<div style="background-image: url('<c:url value="/Image/backend_beverage.png"/>');width:1000px:height:241px">
			<img src="<c:url value='/Image/backend_beverage.png'/>" alt="">
			<h2>음료 관리(등록/수정/삭제) 페이지 입니다.</h2>
		</div>
 --%>
		 
	      <div class="jumbotron">
<!-- 	        <h2>음료 관리(등록/수정/삭제) 페이지 입니다.</h2> -->
	      </div> 
	       
	       <div style="width: 100%;text-align:center;" id="message"></div>
	       
	      <div class="page-header">
	        <span style="font-size: 20px">음료 목록</span>
	        <!-- <input type=checkbox id="checkbox" value="음료 수정" class="btn btn-sm btn-info" OnClick="javascript:editDrink()" style="float:right;margin-left: 8px"> -->
<!-- 	        <input type=button value="음료 추가" class="btn btn-sm btn-info" OnClick="javascript:addDrink()" style="float:right"> -->
 	        

	<span style="float:right">
	    <input type="checkbox" name="checkbox" id="checkbox2" OnClick="javascript:editDrink()"/>
	    <label for="checkbox2">수정&삭제</label>
	</span>
	<span style="float:right">
	    <input type="checkbox" name="checkbox" id="checkbox" OnClick="javascript:addDrink()"/>
	    <label for="checkbox">음료 추가</label>
	</span>
	        
	      </div>

       	  <div><!-- class="col-md-6" 간격조정 때문에 삭제 -->
<div class="CircleEvent" style="width:1200px;">
<ul>
	<c:forEach items="${drinkList}" var="list">
	<li class="addLi" id="${list.dr_no}">
			<div class="row"  style="padding: 15px">
				<div class="col-sm-6">
					<!-- colored -->
					<div class="ih-item circle colored effect10 bottom_to_top">
						<a>
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
            
            <!-- 데이터 -->
              <tr class="data" id="h_${list.dr_no}" title="'${list.d_name}'">
                <%-- <td>${list.dr_no}</td> --%>
                <td class="firstTd">${loop.count}</td>
                <td>${list.d_name}</td>
                <td><fmt:formatNumber value="${list.d_price}"/></td>
                <td>${fn:replace(list.d_img,' ', '')}</td>
                <td>
                	<img style="height:80px;border-radius: 60px;" alt="${fn:replace(list.d_img,' ', '')}" 
                		src="<c:url value='/Image/sidedish/beverage/'/>${fn:replace(list.d_img,' ', '')}">
                </td>
                <c:set var="loopCount" value="${loop.count}"/>
              </tr>
              
              <!-- 수정 폼 -->
              <form onsubmit="return isValidate(this);" action="<c:url value='/DrinkEdit.do'/>" method="post" enctype="multipart/form-data">
              <tr class="h_${list.dr_no}" style="display: none;" id="${list.dr_no}" title="'${list.d_name}'">
                <%-- <td>${list.dr_no}</td> --%>
                <td class="firstTd">${loop.count}</td>
                <input type="hidden" value="${list.dr_no}" name="edit_no"/>
                <input type="hidden" value="${fn:replace(list.d_img,' ', '')}" name="original_img"/>
                <td><input type="text" placeholder="수정하실 음료명을 입력해주세요." value="${list.d_name == null ? '' : list.d_name}" name="d_name"/></td>
                <td><input type="text" placeholder="가격을 입력해주세요." value="${list.d_price == null ? '' : list.d_price}" name="d_price"/></td>
                <td><input type="file" name="d_img" style="width:98%;padding-left:30px" id="edit_img"></input>원본 파일명 : ${fn:replace(list.d_img,' ', '')}</td>
                <td>
                	<input type="submit" id="editOk" style="margin-right:5px" name="submit" size="30" class="btn btn-sm btn-info" value="수정" /> 
                	<input type="button" value="취소" class="btn btn-sm btn-info" OnClick="javascript:editDrinkCancel()" />
                	<input type="button" value="삭제" class="btn btn-sm btn-info" OnClick="javascript:deleteDrink(${list.dr_no})" style="background-color: #ef041c" />
                </td>
                <c:set var="loopCount" value="${loop.count}"/>
              </tr>
              </form>
            </c:forEach>
            
	         <!-- 등록 폼 -->
	         <form name="form" onsubmit="return isValidate(this);" action="<c:url value='/InsertDrink.do'/>" method="post" enctype="multipart/form-data">
		               <tr id="addDrink" style="display:none;">
		               	<td>${loopCount+1}</td>
		                <td><input type="text" id="focus" size="30" placeholder="등록하실 음료명을 입력해주세요." name="d_name" value="${d_name == null ? '' : d_name}"/></td>
		                <td><input type="text" size="15" placeholder="가격을 입력해주세요." name="d_price"  value="${d_price == null ? '' : d_price}"/></td>
		                <td> 
		                	${d_img == null ? '' : d_img }
	                        <input type="file" name="d_img" style="width:98%;padding-left:30px" id=d_img/>
						</td>
						<td>
							<input type="submit" id="addOk" name="submit" size="30" class="btn btn-sm btn-info" value="등록" />
							<input type=button value="취소" class="btn btn-sm btn-info" OnClick="javascript:addDrinkCancel()" />
						</td>
		              </tr>             	
	              </form>
            </tbody>
          </table>
        </div>
      </div>      
	      </div>
	


    <!-- 내용 끝 -->
<script>
$(function(){
	var flag=1;
	$(".dropdown").click(function(){
		if(flag==1){
			$(this).addClass("open");
			flag = 0;
		}
		else{
			$(this).removeClass("open");
			flag = 1;
		}
	});

});
</script>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>
  </body>
</html>
    
    