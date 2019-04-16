<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<jsp:include page="team_header.jsp"></jsp:include>

<div class="container" style="padding:0px">
	<table class="table table-dark">
		<tr>
			<th colspan="6" style="text-align:center; font-size:x-large;">팀 목록</th>
		</tr>
		<tr>
			<th style="width:10%; text-align:center;">#</th>
			<th style="width:10%; text-align:center;">지역</th>
			<th style="width:40%"><span style="margin-left:20px;">팀</span></th>
			<th style="width:40%; text-align:center;">팀정보</th>
		</tr>
		<c:forEach begin="1" end="10" step="1" varStatus="idx">
			<tr>
				<td style="text-align:center; vertical-align:middle;">${idx.count}</td>
				<td style="text-align:center; vertical-align:middle;">Seoul</td>
				<td style="vertical-align:middle;">1번팀</td>
				<td>
					<table class="table table-sm table-dark table-borderless" style="margin:auto; padding:0px;">
						<tr>
							<td style="width:20%; text-align:right; font-weight:bold;">지역 : </td>
							<td style="width:30%">Seoul</td>
							<td style="width:20%; text-align:right; font-weight:bold;">연령대 : </td>
							<td style="width:30%">20대</td>
						</tr>
						<tr>
							<td style="text-align:right; font-weight:bold;">소속선수 : </td>
							<td>11명</td>
							<td style="text-align:right; font-weight:bold;">실력 : </td>
							<td>최상</td>
						</tr>
						<tr>
							<td style="text-align:right; font-weight:bold;">생성일 : </td>
							<td colspan="3">2019-04-15</td>
						</tr>
					</table>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

<script src="${pageContext.request.contextPath}/resources/twbsPagination/jquery.twbsPagination.min.js"></script>
<script>
$(function(){
	
});
</script>