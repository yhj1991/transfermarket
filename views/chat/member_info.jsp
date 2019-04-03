<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 조회</title>
	<link href="${pageContext.request.contextPath}/resources/bootstrap-4.3.1/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

<div class="container" style="width:400px; height:400px">
<table class="table table-hover table-sm table-dark" style="width:97%; height:97%; margin-top:10px">
	<c:if test="${empty member}">
	<tr>
		<td colspan="2">회원정보가 없습니다.</td>
	</tr>
	</c:if>
	<c:if test="${!empty member}">
	<tr>
		<td>아이디</td>
		<td>${member.mem_id}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${member.mem_name}</td>
	</tr>
	<tr>
		<td>전화</td>
		<td>${member.mem_tel}</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${member.mem_email}</td>
	</tr>
	<tr>
		<td>회원등급</td>
		<td>
		<c:if test="${member.authority eq 'ROLE_USER'}">일반회원</c:if>
		<c:if test="${member.authority eq 'ROLE_COACH'}">감독회원</c:if>
		<c:if test="${member.authority eq 'ROLE_CLUB'}">구단회원</c:if>
		<c:if test="${member.authority eq 'ROLE_ADMIN'}">관리자</c:if>
		</td>
	</tr>
	</c:if>
</table>
</div>

</body>
</html>