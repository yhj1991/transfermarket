<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<style>
.continent_active {
	background-color:#81BEF7;
}
.matchlist_div {
	max-height:235px;
	overflow-y:scroll;
}
.matchlist_table tr {
	max-height:250px;
	overflow-y:scroll;
}
.matchlist_table tr th {
	padding:5px;
	text-align:center; 
	font-size:small;
}
.matchlist_table tr td {
	padding:5px;
	text-align:center;
	font-size:small;
}
.clublist_table tr th {
	padding:5px;
	text-align:center;
	font-size:small;
}
.clublist_table tr td {
	padding:5px;
	text-align:center;
	font-size:small;
}
::-webkit-scrollbar {
	width: 12px;
	height: 8px;
}
::-webkit-scrollbar-track {
	background: #394f62;
}
::-webkit-scrollbar-thumb {
	background: #6d8da6;
}
::-webkit-scrollbar-thumb:hover {
	background: #8ab5d6;
}
</style>

<jsp:include page="../header.jsp"></jsp:include>

<div style="height:30px"></div>
 
<div class="container" style="padding:0px">
	<table class="table table-dark table-bordered">
			<tr>
				<c:forEach var="category" items="${category}">
					<td align="center">
						<a href="${pageContext.request.contextPath}/detail/continent.do?no=${category.continent_no}">
							<img src="${pageContext.request.contextPath}/img/continent_img.do?no=${category.continent_no}" style="width:65px; height:65px" alt="${category.continent_name}" />
						</a>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="category" items="${category}">
					<td align="center" class="${category.continent_no == param.no ? 'continent_active' : ''}">
						<div style="margin-top:3px">
							<a href="${pageContext.request.contextPath}/detail/continent.do?no=${category.continent_no}">
								<span style="font-weight:bold;">${category.continent_name}</span>
							</a>
						</div>
					</td>
				</c:forEach>
			</tr>
	</table>
	
	<div style="margin-top:30px;">
		<table class="table table-dark table-bordered table-sm">
				<tr>
					<th>국가</th>
					<th>리그</th>
					<th>1</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>				
			</table>
	</div>
	
	<div class="row" style="margin-top:30px;">
		<div class="col-7 matchlist_div" style="padding-right:0px">
			<table class="table table-dark table-bordered table-sm matchlist_table" style="margin-bottom:0px;">
				<tr>
					<th colspan="4" style="font-size:medium;">
						<img src="${pageContext.request.contextPath}/img/league_img.do?no=10" style="width:18px; height:24px;" />
						<span style="margin-left:10px; font-size:medium;">리그이름</span>
					</th>
				</tr>
				<tr>
					<th style="width:14%">경기일</th>
					<th style="width:38%">홈</th>
					<th style="width:10%">시간</th>
					<th style="width:38%">어웨이</th>
				</tr>
				<c:if test="${empty match}">
				<tr>
					<td colspan="4" style="font-size:medium;">생성된 경기일정이 없습니다.</td>
				</tr>
				</c:if>
				<c:forEach var="match" items="${match}" varStatus="idx">
				<c:if test="${idx.index%3 == 0}">
					<tr>
						<td colspan="4" style="font-size:medium;">
							<fmt:formatNumber var="rounds" value="${idx.index/3+1}"/>${rounds} Rounds
						</td> 
					</tr>
				</c:if>
				<tr>
					<td>${match.match_date}</td>
					<td>
						<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="width:18px; height:24px;" />
						<span style="margin-left:5px;">${match.home_name}</span>
					</td>
					<td>${match.match_kickoff}</td>
					<td>
						<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="width:18px; height:24px;" />
						<span style="margin-left:5px;">${match.away_name}</span>
					</td>
				</tr>	
				</c:forEach>
			</table>
		</div>
		<div class="col-5" style="height:300px;">
			<table class="table table-dark table-bordered table-sm clublist_table">
				<tr>
					<th colspan="7">
						<img src="${pageContext.request.contextPath}/img/league_img.do?no=10" style="width:18px; height:24px;" />
						<span style="margin-left:10px; font-size:medium;">캄페오나투 브라질레이루 세리이 A</span>
					</th>
				</tr>
				<tr>
					<th style="width:10%">순위</th>
					<th>클럽</th>
					<th style="width:12%">경기수</th>
					<th style="width:7%">승</th>
					<th style="width:7%">무</th>
					<th style="width:7%">패</th>
					<th style="width:10%">승점</th>
				</tr>
				<c:forEach begin="1" end="6" step="1" varStatus="idx">
				<tr>
					<td>${idx.count}</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>

<div style="height:30px"></div>

