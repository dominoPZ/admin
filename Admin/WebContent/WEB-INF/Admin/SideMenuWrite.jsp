<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />
    
    
    
    
    <title>사이드 메뉴 추가</title>    
   <meta charset="utf-8" />
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Styles/divLayout.css"/>   

</head>
<body >


<script>

function isValidate(formObject) {
    
    if(formObject.s_name.value.length == 0){
       alert("사이드 메뉴명 을 입력 하세요");
       formObject.s_name.focus();
       return false;
    }//if
     if(formObject.s_price.value == 0){
       alert("사이드 메뉴 가격을 입력 하세요");
       formObject.s_price.focus();
       return false;
    }//else if
    
     if(formObject.s_img.value == 0){
         alert("이미지 파일을 선택해 주세요");
         formObject.s_img.focus();
         return false;
      }//else if
     
     if(formObject.s_origin.value == 0){
         alert("원산지 를 입력 하세요");
         formObject.s_origin.focus();
         return false;
      }//else if
      
     if(formObject.s_detail.value == 0){
         alert("상세정보를 입력 하세요");
         formObject.s_detail.focus();
         return false;
      }//else if
    
      }

</script>



    <div class="allWrap">
        <div class="partWrap">
            
            <div class="header">                
                <jsp:include page="/temp/top.jsp" />
            </div>
            
            <div class="section">              
                <div class="body">
                    <div class="content">
                       <fieldset style="padding:20px 0 50px 20px">
                       <legend>사이드 메뉴 등록</legend>
                       <legend style="font-weight: bold; font-size: 2em;" align="top">사이드 메뉴 등록</legend>
                       <span style="color:red; font-size:1.5em; ">${errorMessage }</span>
                        <form onsubmit="return isValidate(this);" action="${pageContext.request.contextPath}/InsertSideMenu.do" method="post" enctype="multipart/form-data">
                           <table style="line-height: 2.3em" >
                                                
                              <tr bgcolor="white">
                                 <td width="30%" align="center">사이드 메뉴 명</td>
                                 <td >
                                 <input type="text" size="20" name="s_name" value="${s_name == null ? '' : s_name}" />
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">사이드 메뉴 가격</td>
                                 <td >
                                 <input type="text"  size="20" name="s_price"  value="${s_price == null ? '' : s_price}" />
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="50%" align="center">사이드 메뉴 이미지파일</td>
                                 <td >
                                 ${s_img == null ? '' : s_img }
                                 <input type="file" name="s_img" style="width:98%" id=t_img/>
                       
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">원산지</td>
                                 <td >
                                 <input type="text"  size="20" name="s_origin"  value="${s_origin == null ? '' : s_origin}" />
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td align="center">사이드 메뉴 상세정보</td>
                                 <td>
                                 <textarea rows="10" style="width:98%" name="s_detail">${s_detail == null ? '' : s_detail}</textarea>
                                 </td>
                              </tr>
               
                              <tr bgcolor="white" align="center">
                                 <td colspan="2">
                                 <input type="submit" class="btn btn-sm btn-info" value="사이드 메뉴 등록"/>
                                 </td>
                              </tr>                     
                           </table> 
                        </form>
                    </fieldset>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>
    
</body>
</html>