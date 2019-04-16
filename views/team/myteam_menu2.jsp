<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>


<jsp:include page="team_header.jsp"></jsp:include>

<div style="height:30px"></div>

<div class="container">
	<table class="table table-dark table-bordered table-sm" style="margin-top:10px">
		<tr>
			<td style="width:150px; text-align:center;">
				<img src="${pageContext.request.contextPath}/img/team_img.do?no=${team.team_no}" id="team_img" alt="${team.team_no}" style="width:92px; height:120px"/>
			</td>
			<td style="vertical-align:bottom;">
				<h1>${team.team_name}</h1>
			</td>
		</tr>
		<tr>
			<td>소속리그</td>
			<td>
				<c:if test="${team.team_league eq null}">소속된 리그가 없습니다.</c:if>
				<c:if test="${team.team_league ne null}">${team.team_league}</c:if>
			</td>
		</tr>
		<tr>
			<td>지역</td>
			<td>${team.team_addr}</td>
		</tr>
		<tr>
			<td>팀 관리자 연락처</td>
			<td>${team.team_phone}</td>
		</tr>
		<tr>
			<td>주 활동 경기장</td>
			<td>${team.team_stadium}</td>
		</tr>
		<tr>
			<td>팀 생성일</td>
			<td>${team.team_date}</td>
		</tr>
	</table>
</div>

<script>
$(function(){
			
});
</script>

<jsp:include page="../footer.jsp"></jsp:include>
