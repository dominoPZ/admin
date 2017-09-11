<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	 <!-- CSS 파일 불러오기 -->
    <link rel="stylesheet" href="<c:url value='/Styles/JoinForm.css'/>">
    <link rel="stylesheet" href="<c:url value='/Styles/JoinForm_Size.css'/>">
	<!-- 2] CDN(Content Deliver Network)주소 사용-->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- Deprecated 된 함수사용 -->
<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	$("#send").css("background","pink")
		</script>



    <title>회원 정보 수정 페이지</title>

    <!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />
 

	<script type="text/javascript">

		
		
	var a,b,c,d,e;
	
	function CheckPwd(){
		
		
		var pwd = $("#password").val();
		var cpwd = $("#cpassword").val();
		
		if(pwd != cpwd){
			$("#CheckPwd").get(0).innerHTML = "비밀번호가 일치하지 않습니다.";
			a=0;
		}
		else{
			$("#CheckPwd").get(0).innerHTML = "비밀번호가 일치 합니다.";
			a=1;
		}
	}
	

	
	function CheckEmail(){
		var email = $("#email").val();
		if(email.length == 0){
			$("#Checkemail").get(0).innerHTML = "이메일을 입력 하세요.";
			c=0;
		}
		else if(email.length > 50){
			$("#Checkemail").get(0).innerHTML = "이메일 은 50자 이내로 입력 하세요.";
			c=0;
		}
		else if(email.indexOf('@') == -1){
			$("#Checkemail").get(0).innerHTML = "@ 를 포함해서 입력해 주세요.";
			c=0;
		}
		else{
			$("#Checkemail").get(0).innerHTML = "";
			c=1;
			
		}
	}
	
	function CheckName(){
		var name = $("#name").val();
		if(name.length == 0){
			$("#CheckName").get(0).innerHTML = "이름을 입력 하세요.";
			d=0;
		}
		else if(name.length > 20){
			$("#CheckName").get(0).innerHTML = "이름 은 20자 이내로 입력 하세요.";
			d=0;
		}
		else{
			$("#CheckName").get(0).innerHTML = "";
			
			d=1;
		}
	}
	
	function CheckTel(){
		var tel = $("#tel").val();
		if(tel.length == 0){
			$("#CheckTel").get(0).innerHTML = "번호를 입력해 주세요.";
			e=0;
		}
		else if(tel.indexOf('-') == -1){
			$("#CheckTel").get(0).innerHTML = "- 를 포함해서 입력해 주세요.";
			e=0;
		}
		else{
			$("#CheckTel").get(0).innerHTML = "";
			
			e=1;
		}
	}
	function clicks(){

		if(a+c+d+e===4){
			signup.submit();
		}
		else{
			alert("수정하실 회원 정보를 형식에 맞게 모두 입력해주세요.");
		}
	}
	
	
	function Cancel(){
		if (confirm("회원정보 수정을 취소하시겠습니까?\r\n※수정 중인 정보들은 저장되지 않습니다.")) 
			location.href = '<c:url value="/Member.do"/>';
	}

	</script>
	
	<!-- Naver Anlytics 공통-->
	<script>
	var WCSLOG_URL = location.protocol == "https:" ? "https://wcs.naver.net/wcslog.js" : "http://wcs.naver.net/wcslog.js";
	document.write(unescape("%3Cscript type='text/javascript' src='" + WCSLOG_URL +"' %3E%3C/script%3E"));
	</script>
	<!-- // Naver Anlytics 공통-->

	<!-- 카이젠 공통-->
<!-- 	<script data-kz-key="7944084e2b522564"
	data-kz-namespace="kzs"
	src="//cdn.kaizenplatform.net/s/79/44084e2b522564.js" charset="utf-8">
	</script>  -->
	<!-- 카이젠 공통-->


	
  </head>

  <body role="document">

	

 <div>
	<!--  top  --> 
	<jsp:include page="/temp/top.jsp" />
 </div>
    
	
    <div class="container theme-showcase" role="main">
			
	      <!-- Main jumbotron for a primary marketing message or call to action -->
	      <div class="jumbotron" style="background-color: #ffd0be">
	        <h3>회원 정보 수정페이지 입니다.</h3>
	      </div>
	

	      <div>

		<!-- top_event_bnr -->
<!-- 		<div class="top_bnr top_event" id="lineBanner">
			<div class="top_event_wrap">
				<a href="javascript:;" class="btn_ico btn_event_close" onclick="lineBannerClose(); return false;">close</a>
			</div>
		</div>

		 -->
<div class="container">
	<div class="row">
    <div class="col-md-14">
    
    
    
    
    
    <div class="editform">    
      
<!--         <h1 class="entry-title"><span>회원가입 <small style="font-weight: bold;">(Register)</small></span> </h1>
        <hr> -->
            <form class="form-horizontal" method="post" name="signup" id="signup" action="<c:url value='/MemberEdit.do'/>" > 
            
            <!-- 아이디 -->     
              
        <div class="form-group" align="center">
            <h3><span style="color: blue;">${id}</span>님의 회원정보를 수정합니다.</h3>
        </div>
        <input type="hidden" name="id" value="${id}">
        
         <!-- 이름 -->    
         <div class="form-group">
          <label class="control-label col-sm-3">이름<span class="text-danger">*</span></label>
          <div class="col-md-3 col-sm-9">
            <input type="text" class="form-control" name="name" id="name" placeholder="이름 입력" onkeyup="javascript:CheckName()" value="${dto.name}"/>
            <span id="CheckName" style="color: red; font-weight: 600;"></span>
          </div>
        </div>
        
        
        <!-- 비밀번호 -->    
       <div class="form-group">
          <label class="control-label col-sm-3">비밀번호<span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
             
              <input type="password" class="form-control" name="pwd" id="password" placeholder="비밀번호 입력 (5~15자)" value="${dto.pass}">
           </div>   
          </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 확인<span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
             
              <input type="password" class="form-control" name="cpassword" id="cpassword" placeholder="비밀번호 확인" onkeyup="javascript:CheckPwd()" value="${dto.pass}">
              <span id="CheckPwd" style="color: red; font-weight: 600;"></span>
            </div>  
          </div>
        </div>
        
        
        
                
  <!-- 연락처 -->
        <div class="form-group">
          <label class="control-label col-sm-3">연락처<span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
          	<div class="input-group">
             
            <input type="text" class="form-control" name="tel" id="tel" placeholder="연락처 입력" onkeyup="javascript:CheckTel()" value="${dto.tel}"/>
            <span id="CheckTel" style="color: red; font-weight: 600;"></span>
            </div>
          </div>
        </div>
              
    
    <!-- 성별 -->
          <div class="form-group">
          <label class="control-label col-sm-3">성별<span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <label>
            <input name="gender" type="radio" value="M" checked>
            남성 </label>
               
            <label>
            <input name="gender" type="radio" value="W" >
            여성 </label>
          </div>
        </div>
          
    
    
    <!-- 생년월일 -->
						<div class="form-group">
							 <label class="control-label col-sm-3">생년월일<span
								class="text-danger">*</span></label>
							<div class="col-xs-8">
								<div class="form-inline">
									<div class="form-group">
										<select style="margin-left: 15px" name="yyyy" class="form-control">
											<option value="0">년도</option>
											<c:forEach begin="1920" end="2017" var="i">
												<option value="${i}" selected="selected">${i}</option>
											</c:forEach>
											</select>
											년
									</div>
									<div class="form-group">
										<select style="margin-left:35px" name="mm" class="form-control">
											<option value="">월</option>
											<c:forEach begin="1" end="12" var="i">
												<option value="${i}" selected="selected">${i}</option>
											</c:forEach>
											</select>
											월
									</div>
									<div class="form-group">
										<select style="margin-left:35px" name="dd" class="form-control">
											<option value="">일</option>
											<c:forEach begin="1" end="31" var="i">
												<option value="${i}" selected="selected">${i}</option>
											</c:forEach>
											</select>
											일
									</div>
								</div>
							</div>
						</div>

						<!-- 우편번호 -->
         <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">우편 번호</label>

        <div class="col-sm-6">
        
        								
        
        <input id="post1" class="poststyle" readonly="" size="5" name="post1" value="${fn:substringBefore(dto.post,'-')}">&nbsp;-&nbsp;<input id="post2" class="poststyle"  readonly="" size="5" name="post2" value="${fn:substringAfter(dto.post,'-')}">
      <input onclick="openDaumPostcode()" type="button" class="btn btn-sm btn-info"  value="우편번호찾기"><br>
      <span id="CheckPost" style="color: red; font-weight: 600;"></span>
        </div>
        </div>
        
                						
        
        <!-- 기본 주소 -->
         <div class="form-group">
         <label class="col-sm-3 control-label" for="inputEmail">기본 주소</label>

        <div class="col-sm-6">
      <input id="addr1" class="poststyle2" readonly="" size="40" name="addr1" placeholder="도로명주소" value="${fn:substringBefore(dto.addr,'%&@#*^$@!')}">

        </div>
        </div>

        <!-- 상세 주소 -->
         <div class="form-group">
         <label class="col-sm-3 control-label" for="inputEmail">상세 주소</label>

        <div class="col-sm-6">
      <input id="addr2" class="poststyle2" size="40" name="addr2" placeholder="상세 주소" value="${fn:substringAfter(dto.addr,'%&@#*^$@!')}">
        </div>
        </div> 
        
    
        <div class="form-group">
          <label class="control-label col-sm-3">이메일<span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
              <div class="input-group">
              <input type="email" class="form-control" name="email" id="email" placeholder="이메일 아이디 입력" onkeyup="javascript:CheckEmail()" value="${dto.email}">
               <span id="Checkemail" style="color: red; font-weight: 600;"></span>
            </div>
            </div>
        </div>




	<div class="form-group">
							 <label class="control-label col-sm-3">등급<span
								class="text-danger">*</span></label>
							<div class="col-xs-8">
								<div class="form-inline">
									<div class="form-group">
										<select style="margin-left: 15px" name="rating" class="form-control">
											<option value="0">등급을 선택해주세요.</option>
											<option value="REGULAR" selected="selected">REGULAR</option>
											<option value="PREMIUM">PREMIUM</option>
											<option value="VIP">VIP</option>
											<option value="ROYAL">ROYAL</option>

										</select>
									</div>


								</div>
							</div>
						</div>



							<div class="form-group">
          <div class="col-xs-offset-3 col-md-8 col-sm-9"><span class="text-muted"><span class="label label-danger"></span>수정 버튼을 누르시면 수정이 완료됩니다.</span> </div>
        </div>
        
        
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input name="Submit" type="button" onclick="clicks();" value="수정" class="btn btn-primary">
          </div>
        </div>
      </form>
    </div>
    
    <button id="cancel" title="회원 정보 수정을 취소합니다." class="btn btn-sm btn-info" style="margin-bottom: 5px;margin-top: 5px" onclick="Cancel();">취소</button>
    

    
    </div>
</div>
</div>






      
	      </div>
	








    </div> <!-- 내용 끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>
    
    

<br><br><br>


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
   
   
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

    
  </body>
</html>
    
    