<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 어느 컨트롤러에서 왔는지에 따라 분기 -->
<c:choose>	
	<c:when test="${WHERE eq 'INS' }">
		<c:set var="SUC_MSG" value="정상적으로 입력되었습니다."/>
		<c:set var="FAIL_MSG" value="입력 실패!!"/>
		<c:set var="SUC_URL" value="/StoreInsert.do"/>
	</c:when>
	<c:when test="${WHERE eq 'EDT' }">
		<c:set var="SUC_MSG" value="정상적으로 수정되었습니다."/>
		<c:set var="FAIL_MSG" value="수정 실패!!"/>
		<c:set var="SUC_URL" value="/StoreSer.pz"/>
	</c:when>
	<c:when test="${WHERE eq 'DEL' }">
		<c:set var="SUC_MSG" value="정상적으로 삭제되었습니다."/>
		<c:set var="FAIL_MSG" value="삭제 실패!!"/>
		<c:set var="SUC_URL" value="/StoreSer.pz"/>
	</c:when>
	<c:when test="${WHERE eq 'REDT' }">
		<c:set var="SUC_MSG" value="정상적으로 수정되었습니다."/>
		<c:set var="FAIL_MSG" value="수정 실패!!"/>
		<c:set var="SUC_URL" value="/Rating.pz"/>
	</c:when>	
		<c:when test="${WHERE eq 'RDEL' }">
		<c:set var="SUC_MSG" value="정상적으로 삭제되었습니다."/>
		<c:set var="FAIL_MSG" value="삭제 실패!!"/>
		<c:set var="SUC_URL" value="/Rating.pz"/>	
	</c:when>	
		<c:when test="${WHERE eq 'RINS' }">
		<c:set var="SUC_MSG" value="정상적으로 추가되었습니다."/>
		<c:set var="FAIL_MSG" value="추가 실패!!"/>
		<c:set var="SUC_URL" value="/Rating.pz"/>
	</c:when>
	<c:when test="${WHERE eq 'CDEL' }">
		<c:set var="SUC_MSG" value="정상적으로 삭제되었습니다."/>
		<c:set var="FAIL_MSG" value="삭제 실패!!"/>
		<c:set var="SUC_URL" value="/Saile.pz"/>
	</c:when>	
	
	<c:when test="${WHERE eq 'CEDT' }">
		<c:set var="SUC_MSG" value="정상적으로 수정되었습니다."/>
		<c:set var="FAIL_MSG" value="수정 실패!!"/>
		<c:set var="SUC_URL" value="/Saile.pz"/>
	</c:when>	
	<c:when test="${WHERE eq 'CINS' }">
		<c:set var="SUC_MSG" value="정상적으로 추가되었습니다."/>
		<c:set var="FAIL_MSG" value="추가 실패!!"/>
		<c:set var="SUC_URL" value="/Saile.pz"/>
	</c:when>	
	
	
	
	<c:when test="${WHERE eq 'MINS' }">
		<c:set var="SUC_MSG" value="입력하신 음료가 등록되었습니다."/>
		<c:set var="FAIL_MSG" value="음료정보 등록에 실패하였습니다."/>
		<c:set var="SUC_URL" value="/DrinkList.do"/>
	</c:when>		
	<c:when test="${WHERE eq 'DRINKEDIT' }">
		<c:set var="SUC_MSG" value="음료정보가 수정되었습니다."/>
		<c:set var="FAIL_MSG" value="수정을 실패하였습니다."/>
		<c:set var="SUC_URL" value="/DrinkList.do"/>
	</c:when>	
	<c:when test="${WHERE eq 'DRINKDEL' }">
		<c:set var="SUC_MSG" value="선택하신 음료가 삭제되었습니다."/>
		<c:set var="FAIL_MSG" value="음료 삭제를 실패하였습니다."/>
		<c:set var="SUC_URL" value="/DrinkList.do"/>
	</c:when>		
	

	<c:when test="${WHERE eq 'PICKLESAUCEWRITE' }">
		<c:set var="SUC_MSG" value="입력하신 상품이 등록되었습니다."/>
		<c:set var="FAIL_MSG" value="상품 등록에 실패하였습니다."/>
		<c:set var="SUC_URL" value="/PickleSauceList.do"/>
	</c:when>		
	<c:when test="${WHERE eq 'PICKLESAUCEEDIT' }">
		<c:set var="SUC_MSG" value="등록된 상품이 수정되었습니다."/>
		<c:set var="FAIL_MSG" value="수정을 실패하였습니다."/>
		<c:set var="SUC_URL" value="/PickleSauceList.do"/>
	</c:when>	
	<c:when test="${WHERE eq 'PICKLESAUCEDEL' }">
		<c:set var="SUC_MSG" value="선택하신 상품이 삭제되었습니다."/>
		<c:set var="FAIL_MSG" value="상품 삭제를 실패하였습니다."/>
		<c:set var="SUC_URL" value="/PickleSauceList.do"/>
	</c:when>	


	
		
	<c:when test="${WHERE eq 'SINS' }">
		<c:set var="SUC_MSG" value="정상적으로 입력되었습니다."/>
		<c:set var="FAIL_MSG" value="입력 실패!!"/>
		<c:set var="SUC_URL" value="/SideMenu.do"/>
	</c:when>		
	
	<c:when test="${WHERE eq 'UPD'}">
		<c:set var="SUC_MSG" value="정상적으로 수정되었습니다."/>
		<c:set var="FAIL_MSG" value="수정 실패!!"/>
		<c:set var="SUC_URL" value="/StoreUpdate.pz?in=in"/>
	</c:when>
	
	<c:otherwise>
		<c:set var="SUC_MSG" value="삭제 성공"/>
		<c:set var="FAIL_MSG" value="삭제 실패"/>
		<c:set var="SUC_URL" value="/login.pz"/>
	</c:otherwise>
	
	
</c:choose>


<script>
	<c:choose>
		<c:when test="${SUC_FAIL ==1}">
			alert("${SUC_MSG}");
			location.href='<c:url value="${SUC_URL}"/>';
		</c:when>
		<c:when test="${SUC_FAIL ==0}">
			alert("${FAIL_MSG}");
			history.back();
		</c:when>		
	</c:choose>
</script>