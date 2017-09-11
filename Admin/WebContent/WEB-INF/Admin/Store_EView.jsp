
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
  if(fr.st_name.value == "" || fr.st_id.value == "" ||  fr.st_pass.value == "" || fr.st_parkin.value == "" ) {
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
    	    <h1> 매장 수정 ${mes } <small>Store </small></h1>
        </div>
        	

        	<br/><br/>
        	
            
        	
        	
        	
        	<c:if test="${! empty dto}">
        	<hr/>
        <form class="form-horizontal" method="post"  name="fr" id="fr"  action="<c:url value='/StoreEdit.pz' />" >
        
                <div class="form-group">
            <label class="col-sm-3 control-label"  for="inputName"> 매장명	</label>
          <div class="col-sm-6">
            <input name="st_name" class="form-control" name="p_name" value="${dto.st_name }" id="st_name" type="text" placeholder="매장명">
          </div>
        </div>
        
        
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">매니저 아이디</label>
          <div class="col-sm-6">
            <input class="form-control" name="st_id" id="st_id" value="${dto.st_id }" type="text" placeholder="매니저 아이디">
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" name="st_pass" id="st_pass" type="password" placeholder="비밀번호">
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인">
                <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
             </div>
          </div>

        
               
       <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">매장 전화번호</label>
          <div class="col-sm-6">
            <input class="form-control" id="tel" value="${dto.st_tel }" type="text" name="st_tel" placeholder="매장 전화번호">
          </div>
        </div>
        
       
        	
       <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">주차장 </label>
          <div class="col-sm-6">
            <input class="form-control" id="st_parkin" value="${dto.st_parkin }" type="text" name="st_parkin" placeholder="주차장 여부">
          </div>
        </div>

       <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">영업 시간 </label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" value="${dto.st_time }" name="st_time" placeholder="00:00 - 00:00">
          </div>
        </div>        	
        
		
        <div class="form-group">
          <div class="col-sm-12 text-center">
          	<input type="hidden" value="${dto.st_no }" name="st_no" >
            <button class="btn btn-primary" type="button" onclick="check();" >매장 정보 수정<i class="fa fa-check spaceLeft"></i></button>
          </div>
        </div>
        </form>
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
