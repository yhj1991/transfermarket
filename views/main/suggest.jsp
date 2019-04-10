<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<jsp:include page="../header.jsp"></jsp:include>

<style>
#playerlist_tbody td {
	font-size:small;
}
</style>

<div class="container">
	<div class="form-inline" align="center">
		<a href="${pageContext.request.contextPath}/suggest.do?type=player"><span>선수</span></a>
		<div style="width:100px"></div>
		<a href="${pageContext.request.contextPath}/suggest.do?type=club"><span>클럽</span></a>
	</div>
</div>
<c:if test="${param.type eq 'player'}">
<jsp:include page="suggest_player.jsp"></jsp:include>
</c:if>
<c:if test="${param.type eq 'club'}">
<jsp:include page="suggest_club.jsp"></jsp:include>
</c:if>
<jsp:include page="../footer.jsp"></jsp:include>