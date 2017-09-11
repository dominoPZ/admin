<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>bootstrap template</title>

	
    <!-- Bootstrap -->
    <link href="<c:url value='/BootStrap/css/bootstrap_edt.css' />" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/font-awesome.min.css' />" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/style.css' />" media="screen" title="no title" charset="utf-8">

    <!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />




    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script>
function openDaumPostcode() {
    var width = 500; //팝업창이 실행될때 위치지정
    var height = 600; //팝업창이 실행될때 위치지정
    new daum.Postcode({
        width : width, //팝업창이 실행될때 위치지정
        height : height, //팝업창이 실행될때 위치지정
        oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
            // 법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
             
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("post1").value = data.postcode1;
            document.getElementById("post2").value = data.postcode2;
            document.getElementById("addr1").value = fullRoadAddr;
            document.getElementById("addr2").value = data.jibunAddress;
 
            document.getElementById('addr2').focus();
        }
    }).open({
        left : (window.screen.width / 2 ) - ( width / 2), //팝업창이 실행될때 위치지정
        top : (window.screen.height / 2 ) - ( height / 2) //팝업창이 실행될때 위치지정
    });
}
</script>


    
  </head>

  <body role="document">
<script>

function check() {
  if(fr.st_name.value == "" || fr.st_id.value == "" || fr.addr2.value=="" || fr.st_pass.value == "" || fr.st_parkin.value == "" ) {
    alert("입력하지 않은 칸이 있습니다.");
    fr.inputName.focus();
    return false;
  }else if(fr.inputName.value.length > 50) {
	    alert("매장명 길이는 50글자 이하로 해주세요.");
	    fr.inputName.focus();
	    return false;
	  }
  else if(fr.st_id.value.length > 15) {
    alert("아이디는 15글자 이하로 해주세요");
    fr.st_id.focus();
    return false;
  }
  else if(fr.st_pass.value.length > 15) {
	    alert("비밀번호는 15글자 이하로 해주세요");
	    fr.st_pass.focus();
	    return false;
	  }
  else {
	  fr.submit();
	  
  }
} 


 function serc() {
	 if(frs.sertxt.value == ""){
		 alert("입력되지 않았습니다.");
		    frs.sertxt.focus();
		    return false;
	 }else
		frs.submit();
 }

 	function deletes(dat){
 		if(confirm("정말 삭제하시겠습니까?")){
 			location.href="<c:url value='StoreDelete.pz' />?s_no="+dat;
 		}
 	}
 

</script>



	
<c:set value="store" var="page" />
	
	

	



  <div>
	<!--  top  --> 
	<jsp:include page="/temp/top.jsp" />
 </div>
	
	  <div class="container theme-showcase" role="main">
			
	      <!-- Main jumbotron for a primary marketing message or call to action -->
	      <div class="jumbotron">
	      </div>
	

	      <div>
	      <!--  실재 내용 표시  -->
	       <div class="col-md-6">  
	      
      <article class="container">
     

        <div class="col-md-12">
        <div class="page-header">
    	    <h1> 매장 수정,삭제 ${mes } <small>Store </small></h1>
        </div>
        	<div>
        	<form class="form-horizontal" method="get"  name="frs" id="frs"  action="<c:url value='/StoreSer.pz' />" >
        	 <div class="form-group">
        		<label class="col-sm-3 control-label"  for="inputName"> 검색 </label>
      	  <select  class="form-control" style="width: 15%" name="ser">
	     	 <option value="ST_NO">매장 일련번호</option>
	     	 <option value="ST_NAME">매장명</option>
	     </select>
	     <input name="st_name" style="width: 23%" class="form-control"  id="sertxt" type="text" placeholder="검색">
	     <button class="btn btn-primary" type="button" onclick="serc();" > 검색</button>
	     
	      </div>
        	</form>
        	</div>
        	<br/><br/>
        	
            <c:if test="${!empty dtos}" >
        	     <div class="row">
        <div class="col-md-9">
          <table class="table">
            <thead>
              <tr>
                <th>no</th>
                <th>매장명</th>
                <th>매니저 아이디</th>
                <th>매장 번호</th>
                <th>주차장</th>
                <th>영업시간</th>
                <th>---</th>
              </tr>
            </thead>
            <tbody>
          	<c:forEach items="${dtos }" var="dto" >
              <tr>
                <td>${dto.st_no }</td>
                <td>${dto.st_name }</td>
                <td>${dto.st_id }</td>
                <td>${dto.st_tel }</td>
                <td>${dto.st_parkin }</td>
                <td>${dto.st_time }</td>
                <td><a href="<c:url value='StoreEDT.pz?no=${dto.st_no }' />"> <span class="label label-info">수정</span></a>
                	<a  href="#"> <span class="label label-danger" onclick="deletes(${dto.st_no});" >삭제</span></a>
                </td>
              </tr>
          	</c:forEach>
            
            </tbody>
        	</table>
        	</div>
            </c:if>
        	
       
        	
          <hr>
        </div>
      </article>
	      
	      
	      
  
	   </div>
	   
	   
	   
	   
      </div>      
	      </div>
	
	
	


    <!-- 내용 끝 -->
  
	<!--  주소 입력받기 위한 js  -->  
	
	   <script>
function openDaumPostcode() {
    var width = 500; //팝업창이 실행될때 위치지정
    var height = 600; //팝업창이 실행될때 위치지정
    new daum.Postcode({
        width : width, //팝업창이 실행될때 위치지정
        height : height, //팝업창이 실행될때 위치지정
        oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
            // 법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
             
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("post1").value = data.postcode1;
            document.getElementById("post2").value = data.postcode2;
            document.getElementById("addr1").value = fullRoadAddr;
            document.getElementById("addr2").value = data.jibunAddress;
 
            document.getElementById('addr2').focus();
        }
    }).open({
        left : (window.screen.width / 2) - (width / 2), //팝업창이 실행될때 위치지정
        top : (window.screen.height / 2) - (height / 2) //팝업창이 실행될때 위치지정
    });
}
</script>
	
	
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  
  
  	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>



  </body>
  
</html>
