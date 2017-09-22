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
    
    <title>메뉴 등록</title>    
   <meta charset="utf-8" />
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Styles/divLayout.css"/>   
<script>
   function isValidate(formObject) {
       
      if(formObject.p_name.value.length == 0){
         alert("피자명을 입력 하세요");
         formObject.p_name.focus();
         return false;
      }//if
       if(formObject.p_kind.value == 0){
         alert("분류를 선택 하세요");
         formObject.p_kind.focus();
         return false;
      }//else if
      
        
       if(formObject.p_sprice.length == 0){
           alert("S 사이즈 가격을 입력해 주세요");
           formObject.p_sprice.focus();
           return false;
        }//else if
        
       if(formObject.p_lprice.length == 0){
           alert("L 사이즈 가격을 입력해 주세요");
           formObject.p_lprice.focus();
           return false;
        }//else if
        /* 
       if(formObject.dough_name.value == 0){
    	   alert(formObject.dough_name.value)
           alert("도우를 선택해 주세요");
           
           return false;
        }// if
         */
      
       
      
        
        
       /*  
       if(formObject.attachedfile.value.length != 0){
         //파일 사이즈:파일객체.files[0].size
         //파일 명:파일객체.files[0].name
         //파일 컨텐츠 타입:파일객체.files[0].type
         if(Math.ceil(formObject.attachedfile.files[0].size / 1024) > 500){
            alert("파일크기는 최대 500KB여야 합니다");
            var size = Math.ceil(formObject.attachedfile.files[0].size / 1024)
            var name = formObject.attachedfile.files[0].name;
            var type = formObject.attachedfile.files[0].type;
            
            return false;
         }//if
      }//else if
       */
      
   }//isValidate()
   
 
   
</script>
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
                       <legend>메뉴 등록</legend>
                       <legend style="font-weight: bold; font-size: 2em;" align="top">메뉴 등록</legend>
                       <span style="color:red; font-size:1.5em; ">${errorMessage }</span>
                        <form onsubmit="return isValidate(this);" action="${pageContext.request.contextPath}/PizzaEdit.pz" method="post" enctype="multipart/form-data">
                           <table style="line-height: 2.3em" >

                                                
                                                
                              <tr bgcolor="white">
                                 <td width="30%" align="center">피자 명</td>
                                 <td >
                                 <input type="text" size="20" name="p_name" value="${dtos.p_name == null ? '' : dtos.p_name}" />
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">분류</td>
                                 <td >
                                 <div class="form-group">
												<select name="p_kind" style="height:30%">
													<option value="0">분류</option>
													<option value="프리미엄">프리미엄</option>
													<option value="클래식">클래식</option>
												</select>
											</div>
										</td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">기본 토핑</td>
                                 <td >
                                 <input type="text"  name="p_topping" style="width:98%" value="${dtos.p_topping}" />
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">피자 S 가격</td>
                                 <td >
                                 <input type="text"  size="7" name="p_sprice"  value="${dtos.p_sprice}" />
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">피자 L 가격</td>
                                 <td >
                                 <input type="text" size="7" maxlength="5" name="p_lprice"  value="${dtos.p_lprice}" />
                                 
                                 </td>       
                              </tr>
                              
                              <tr>
                              <td width="30%" align="center">도우</td>
                              
                              <td>
                                    <c:if test="${!empty list }">
                            	<c:forEach items="${list}" var="dog"  >
                            	
                              	<input type="checkbox" name="dough_name" checked="checked" value="${dog.dough_no}">${dog.dough_name}
                                     </c:forEach> 
                                    </c:if>
                              </td>
                              </tr>
                              
                              
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">원산지</td>
                                 <td >
                                 <input type="text"  name="p_origin" style="width:98%" value="${dtos.p_origin == null ? '' : dtos.p_origin}" />
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">피자 이미지파일</td>
                                 <td >
                                 <input type="file" name="p_img" style="width:98%" id="pimg"/>
                                 <span style="font-size: 0.8em">
                                 ${dtos.p_img}
                                 </span>
                                 
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">하프앤하프 이미지 파일</td>
                                 <td >
                                 <input type="file" name="p_himg" style="width:98%" id="phimg"/>
                                  <span style="font-size: 0.8em">
                                 ${dtos.p_himg}
                                 </span>
                                 
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td width="30%" align="center">피자 상세정보 이미지 파일</td>
                                 <td >
                                 <input type="file" name="p_dimg" style="width:98%" id="pdimg"/>
                                  <span style="font-size: 0.8em">
                                 ${dtos.p_dimg}
                                 </span>
                                 </td>
                              </tr>
                              <tr bgcolor="white" >
                                 <td align="center">피자 상세정보</td>
                                 <td>
                                 <textarea rows="10" style="width:98%" name="p_detail">${dtos.p_detail == null ? '' : dtos.p_detail}</textarea>
                                 </td>
                              </tr>
                              <input type="hidden" name="p_no" value="${dtos.p_no}" />
                            	<input type="hidden" name="fileOrgName" value=" ${dtos.p_img == null ? '' : dtos.p_img}" >
                            	<input type="hidden" name="dfileOrgName" value=" ${dtos.p_dimg == null ? '' : dtos.p_dimg}" >
                            	<input type="hidden" name="hfileOrgName" value=" ${dtos.p_himg == null ? '' : dtos.p_himg}" >
                              <tr bgcolor="white" align="center">
                                 <td colspan="2">
                                 <input type="submit" class="btn btn-sm btn-info" value="메뉴 등록"/>
                                 </td>
                              </tr>                     
                           </table> 
                           <h1>&nbsp;</h1>
                           <h1>&nbsp;</h1>
                           
                           
                        <table class="table table-striped" style="width: 80%" >
						<thead style="background:#ff1230;font-weight: bold;font-size: 15px; color: white;">
							<tr>
								<th style="width: 15%" >도우명(사이즈)</th>
								<th>총 중량</th>
								<th>1회 제공량</th>
								<th>1회 기준 중량</th>
								<th>열량(KCAL)</th>
								<th>단백질(g)</th>
								<th>포화지방(g)</th>
								<th>나트륨(mg)</th>
								<th>당류(g)</th>
							</tr>
						</thead>
						
						<tbody class="firstTbody" id="tbody" >
							<c:forEach items="${list }" var="dto" varStatus="loop" >
								<c:set value="0" var="nont" />
								<c:forEach items="${dtos.list }" var="dto2" varStatus="loop2" >
									<c:if test="${dto2.dough_no==dto.dough_no && dto2.n_size=='L' }">
							<tr class="tp${ dto.dough_no}" >
									<td>${dto.dough_name }(L)</td>
									<c:set value="1" var="nont" />
									<td><input style="width: 80%" type="text" value="${dto2.n_gram }" name="n_gramL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_stan }" name="n_stanL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_stangram }" name="n_stangramL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_kcal }" name="n_kcalL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_protein }" name="n_proteinL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_sfat }" name="n_sfatL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_natrium }" name="n_natriumL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_sugar }" name="n_sugarL${dto.dough_no}" /></td>
							</tr>
									</c:if>
									<c:if test="${dto2.dough_no==dto.dough_no && dto2.n_size=='M' }">
							<tr class="tp${ dto.dough_no}">
									<td>${dto.dough_name }(M)</td>
									<td><input style="width: 80%" type="text" value="${dto2.n_gram }" name="n_gramM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_stan }" name="n_stanM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_stangram }" name="n_stangramM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_kcal }" name="n_kcalM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_protein }" name="n_proteinM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_sfat }" name="n_sfatM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_natrium }" name="n_natriumM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" value="${dto2.n_sugar }" name="n_sugarM${dto.dough_no}" /></td>
							</tr>
									</c:if>
									</c:forEach>
									
								<c:if test="${nont==0 }">
								!!!
								<tr class="tp${ dto.dough_no}"  >
									<td>${dto.dough_name }(L)</td>
									<td><input style="width: 80%" type="text" name="n_gramL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_stanL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_stangramL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_kcalL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_proteinL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_sfatL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_natriumL${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_sugarL${dto.dough_no}" /></td>
							</tr>
									<tr class="tp${ dto.dough_no}" >
									<td>${dto.dough_name }(M)</td>
									
									<td><input style="width: 80%" type="text" name="n_gramM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_stanM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_stangramM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_kcalM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_proteinM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_sfatM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_natriumM${dto.dough_no}" /></td>
									<td><input style="width: 80%" type="text" name="n_sugarM${dto.dough_no}" /></td>
							</tr>
								
								
								</c:if>
									
									
									
							</c:forEach>
						</tbody>
						</table>
                        </form>
                    </fieldset>                        
                    </div>
                </div>
            </div>

            
        </div>
    </div>

    <script>
    $(function(){
	
 	 
 	   $("select option[value='${dtos.p_kind}']").attr('selected','selected');

 	   
    	
		$(":checkbox").click(function(){
			if($(":checkbox:checked").length==0){
				alert("한 개 이상 선택해주세요.");
				 this.checked = true;
			}
			
		$("#tbody tr td").hide();
    	for(var i=0;i < $(":checkbox:checked").length;i++ ){
			var no =$(":checkbox:checked").get(i).value;
			$(".tp"+no+" td").show();			
		}

		});
    });
    
    </script>
    
    	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>
    
</body>
</html>