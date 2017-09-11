<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<script >
function isValidate(formObject) {
    
    if(formObject.t_name.value.length == 0){
       alert("토핑명 을 입력 하세요");
       formObject.t_name.focus();
       return false;
    }//if
    
    if(formObject.t_img.value == 0){
        alert("이미지 파일을 선택해 주세요");
        formObject.t_img.focus();
        return false;
     }//else if
     
    if(formObject.t_kind.value == 0){
        alert("분류 를 선택 하세요");
        formObject.t_kind.focus();
        return false;
     }//else if
     
    if(formObject.t_size.value == 0){
        alert("토핑 사이즈 를 선택 하세요");
        formObject.t_size.focus();
        return false;
     }//else if
     
     if(formObject.t_price.value == 0){
       alert("토핑 가격을 입력 하세요");
       formObject.t_price.focus();
       return false;
    }//else if
        
     if(formObject.t_gram.value == 0){
         alert("토핑 용량을 입력 하세요");
         formObject.t_gram.focus();
         return false;
      }//else if
    
      }

</script>
	<!-- Bootstrap core CSS --> <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap.min.css' />">
    <!-- Bootstrap theme --> <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="<c:url value='/BootStrap/css/bootstrap-theme.min.css' />" />
    
    <title>토핑 추가</title>    
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
                       <legend style="font-weight: bold; font-size: 2em;" align="top">토핑 등록</legend>
                       <span style="color:red; font-size:1.5em; ">${errorMessage }</span>
                        <form onsubmit="return isValidate(this);" action="${pageContext.request.contextPath}/InsertTopping.do" method="post" enctype="multipart/form-data">
                           <table style="line-height: 2.3em" >
                                                
                              <tr bgcolor="white">
                                 <td width="30%" align="center">토핑 명</td>
                                 <td >
                                 <input type="text" size="20" name="t_name" value="${t_name == null ? '' : t_name}" />
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">토핑 이미지파일</td>
                                 <td >
                                 ${t_img == null ? '' : t_img }
                                 <input type="file" name="t_img" style="width:98%" id=t_img/>
                                 
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">분류</td>
                                 <td >
                                 <div class="form-group">
												<select name="t_kind" style="height:30%">
													<option value="0">분류</option>
													<option value="메인">메인</option>
													<option value="치즈">치즈</option>
													<option value="애프터">애프터</option>
												</select>
											</div>
										</td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">토핑 사이즈</td>
                                 <td >
                                 <div class="form-group">
												<select name="t_size" style="height:30%">
													<option value="0">사이즈 선택</option>
													<option value="S">S</option>
													<option value="M">M</option>
													<option value="L">L</option>
												</select>
											</div>
										</td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">토핑 가격</td>
                                 <td >
                                 <input type="text"  size="7" name="t_price"  value="${t_price == null ? '' : t_price}" />
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">토핑 용량</td>
                                 <td >
                                 <input type="text" size="7" maxlength="5" name="t_gram"  value="${t_gram == null ? '' : t_gram}" />
                                 
                                 </td>       
                              </tr>

                              <tr bgcolor="white" align="center">
                                 <td colspan="2">
                                 <input type="submit" class="btn btn-sm btn-info" value="토핑 등록"/>
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