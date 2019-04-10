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
						<input type="text" class="form-control form-control-sm" id="player_search_text" placeholder="클럽명" />
						<input type="button" style="margin-left:5px"class="btn btn-outline-light btn-sm" id="search_btn" value="검색" />
						<input type="button" style="margin-left:5px"class="btn btn-outline-light btn-sm" id="reset_search_btn" value="검색초기화" />
						<span style="margin-left:50px"></span>
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align:center; width:5%">#</td>
				<td style="text-align:center; width:5%">국가</td>
				<td style="text-align:center; width:5%">소속리그</td>
				<td style="text-align:center; width:25%">클럽명</td>
				<td style="text-align:center; width:8%">주소</td>
				<td style="text-align:center; width:8%">전화</td>
				<td style="text-align:center; width:8%">팩스</td>
				<td style="text-align:center; width:8%">홈페이지</td>
				<td style="text-align:center; width:20%">경기장</td>
				<td style="text-align:center; width:8%">설립일</td>
			</tr>
		</thead>
		<tbody id="playerlist_tbody">
			<c:forEach var="club" items="${list}" varStatus="idx">
				<tr>
					<td style="text-align:center;">${idx.count}</td>
					<td style="text-align:center;">
						<img src="${pageContext.request.contextPath}/img/country_img.do?no=${club.country_no}" style="width:24px; height:18px;" />
						<span>${club.country_name}</span>
					</td>
					<td style="text-align:center;">
						<img src="${pageContext.request.contextPath}/img/league_img.do?no=${club.league_no}" style="width:18px; height:24px;" />
						<span>${club.league_name}</span>
					</td>
					<td style="text-align:center;">
						<img src="${pageContext.request.contextPath}/img/club_img.do?no=${club.club_no}" style="width:24px; height:24px;" />
						<span>${club.club_name}</span>
					</td>
					<td style="text-align:center;">${club.club_addr}</td>
					<td style="text-align:center;">${club.club_tel}</td>
					<td style="text-align:center;">${club.club_fax}</td>
					<td style="text-align:center;">${club.club_page}</td>
					<td style="text-align:center;">${club.club_stadium}</td>
					<td style="text-align:center;">${club.club_founded}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="row justify-content-center" style="margin-top:30px">
		<ul class="pagination-sm" id="pagination"></ul>
	</div>
</div>