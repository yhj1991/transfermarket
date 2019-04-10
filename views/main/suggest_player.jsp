<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<style>
.player_link {
	margin-left:15px;
	color:white;
}

#playerlist_tbody td {
	font-size:small;
}
</style>

<div class="container">
	<table class="table table-sm table-dark">
		<thead>
			<tr>
				<td colspan="10">
					<div class="form-inline">
						<input type="text" class="form-control form-control-sm" id="player_search_text" placeholder="선수명" />
						<input type="button" style="margin-left:5px"class="btn btn-outline-light btn-sm" id="search_btn" value="검색" />
						<input type="button" style="margin-left:5px"class="btn btn-outline-light btn-sm" id="reset_search_btn" value="검색초기화" />
						<span style="margin-left:50px">국가별 선수목록 / 리그별 선수목록 / 클럽별 선수목록 조회 들어갈자리 / 정렬기준 (나이 / 가치 / 키 / 포지션)</span>
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align:center; width:5%">#</td>
				<td style="text-align:center; width:5%">국가</td>
				<td style="text-align:center; width:5%">소속팀</td>
				<td style="text-align:center; width:25%">선수명</td>
				<td style="text-align:center; width:8%">생년월일</td>
				<td style="text-align:center; width:8%">나이</td>
				<td style="text-align:center; width:8%">키(cm)</td>
				<td style="text-align:center; width:20%">포지션</td>
				<td style="text-align:center; width:8%">주발</td>
			</tr>
		</thead>
		<tbody id="playerlist_tbody">
			<c:forEach var="player" items="${list}" varStatus="idx">
				<tr>
					<td style="text-align:center;">${idx.count}</td>
					<td style="text-align:center;"><img src="${pageContext.request.contextPath}/img/country_img.do?no=${player.country_no}" style="width:24px; height:16px;"/></td>
					<td style="text-align:center;"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${player.club_no}" style="width:18px; height:24px;"/></td>
					<td>
						<a href="${pageContext.request.contextPath}/detail/player.do?no=${player.player_no}">
							<img src="${pageContext.request.contextPath}/img/player_img.do?no=${player.player_no}" style="width:24px; height:24px;"/>
							<span style="margin-left:5px">${player.player_name}</span>
						</a>
					</td>
					<td style="text-align:center;">${player.player_birth}</td>
					<td style="text-align:center;">${player.player_age}</td>
					<td style="text-align:center;">${player.player_height}</td>
					<td>${player.player_position1} - ${player.player_position2}</td>
					<td style="text-align:center;">${player.player_foot }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="row justify-content-center" style="margin-top:30px">
		<ul class="pagination-sm" id="pagination"></ul>
	</div>
</div>