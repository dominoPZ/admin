<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	<c:choose>
		<c:when test="${affected gt 0 }">
			alert("${message}");
			location.href = '<c:url value="/Member.do"/>';
		</c:when>
		<c:when test="${affected eq 0 }">
			alert("회원 탈퇴에 실패하였습니다.");
			history.back();
		</c:when>
	</c:choose>
</script>



