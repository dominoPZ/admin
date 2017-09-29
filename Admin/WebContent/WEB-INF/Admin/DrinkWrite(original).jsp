<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<script>

function isValidate(formObject) {
    
    if(formObject.d_name.value.length == 0){
       alert("음료명을 입력 하세요");
       formObject.d_name.focus();
       return false;
    }//if
     if(formObject.d_price.value == 0){
       alert("음료 가격을 입력 하세요");
       formObject.d_price.focus();
       return false;
    }//else if
    
     if(formObject.d_img.value == 0){
         alert("이미지 파일을 선택해 주세요");
         formObject.d_img.focus();
         return false;
      }//else if
      
    
      }

</script>

	<!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />
    
    <title>음료 추가</title>    
   <meta charset="utf-8" />
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Styles/divLayout.css"/>   

</head>
<body >
    <div class="allWrap">
        <div class="partWrap">
            
            <div class="header">                
                <jsp:include page="/temp/top.jsp" />
            </div>
            
            <div class="section">              
                <div class="body">
                    <div class="content">
                       <fieldset style="padding:20px 0 50px 20px">
                       <legend>토핑 등록</legend>
                       <legend style="font-weight: bold; font-size: 2em;" align="top">음료 등록</legend>
                       <span style="color:red; font-size:1.5em; ">${errorMessage }</span>
                        <form onsubmit="return isValidate(this);" action="${pageContext.request.contextPath}/InsertDrink.do" method="post" enctype="multipart/form-data">
                           <table style="line-height: 2.3em" >
                                                
                              <tr bgcolor="white">
                                 <td width="30%" align="center">음료 명</td>
                                 <td >
                                 <input type="text" size="20" name="d_name" value="${d_name == null ? '' : d_name}" />
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">음료 가격</td>
                                 <td >
                                 <input type="text"  size="20" name="d_price"  value="${d_price == null ? '' : d_price}" />
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">음료 이미지파일</td>
                                 <td >
                                 ${d_img == null ? '' : d_img }
                                 <input type="file" name="d_img" style="width:98%" id=t_img/>
                                 
                                 </td>
                              </tr>
                              
                              
                             

                              <tr bgcolor="white" align="center">
                                 <td colspan="2">
                                 <input type="submit" class="btn btn-sm btn-info" value="음료 등록"/>
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