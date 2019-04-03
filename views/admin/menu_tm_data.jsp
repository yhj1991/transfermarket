<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<c:if test="${param.detail == 1}">
	<jsp:include page="tm_data_club.jsp"></jsp:include>
</c:if>
<c:if test="${param.detail == 2}">
	<jsp:include page="tm_data_league.jsp"></jsp:include>
</c:if>
<c:if test="${param.detail == 3}">
	<jsp:include page="tm_data_country.jsp"></jsp:include>
</c:if>