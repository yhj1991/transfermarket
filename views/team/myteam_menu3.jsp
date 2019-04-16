<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>


<jsp:include page="team_header.jsp"></jsp:include>

<div style="height:30px"></div>

<style>
.uniform_div {
	display:table-cell;
	vertical-align:middle;
	background-size:cover;
	width:50px;
	height:50px;
	background-image:url('${pageContext.request.contextPath}/resources/img/uniform2.png');
	background-repeat:no-repeat;
}

.small_span {
	font-size:small;
}
</style>

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
	
	<div class="row">
		<div class="col-7">
			<table class="table table-dark table-sm" style="margin-top:10px;">
				<thead>
					<tr>
						<th colspan="4" style="text-align:center; font-size:large;">소속선수 목록</th>
					</tr>
					<tr>
						<th style="text-align:center; width:100px">등번호</th>
						<th style="width:330px; text-align:center;">선수</th>
						<th style="width:170px">국적</th>
						<th style="text-align:center; width:100px">가치<a href="#" id="mv_btn" style="margin-left:5px; color:white;" value="0">↕</a></th>
					</tr>
				</thead>
				<tbody id="playerlist_tbody">
					<c:if test="${empty playerList}">
						<tr>
							<td colspan="4" style="text-align:center;">등록된 선수가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty playerList}">
						<c:forEach var="pList" items="${playerList}">
						<tr>
							<td align="center" >
								<div class="uniform_div">
									<span style="font-weight:bold; font-size:large;">${pList.player_backnum}</span>
								</div>
							</td>
							<td style="text-align:center;">
								<table class="table table-dark table-sm table-borderless" style="margin:auto;">
									<tr>
										<td rowspan="2" style="width:40px">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${pList.player_no}">
												<img src="${pageContext.request.contextPath}/img/player_img.do?no=${pList.player_no}" style="width:40px; height:40px"/>
											</a>
										</td>
										<td style="font-size:small;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${pList.player_no}" style="color:white;">
												<span>${pList.player_name}</span>
												<c:if test="${pList.player_no eq pList.club_captain}">
													<img src="${pageContext.request.contextPath}/resources/img/captain.png" style="width:24px; height:18px; margin-left:5px;" />
												</c:if>
											</a>
										</td>
									</tr>
									<tr>
										<td style="font-size:small;">${pList.player_position1} - ${pList.player_position2}</td>
									</tr>
								</table>
							</td>
							<td style="vertical-align:middle;">
									<img src="${pageContext.request.contextPath}/img/country_img.do?no=${pList.country_no}" style="width:24px; height:16px;"/>
									<span style="font-size:small; margin-left:5px">${pList.country_name}</span>
							</td>
							<td style="text-align:right; vertical-align:middle;">
								<span>$</span><span style="font-size:large; font-weight:bold; margin-left:5px">${pList.player_mv}</span><span style="margin-left:5px">Bill</span>
							</td>
						</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		
		<div class="col-5">
			<table class="table table-dark table-sm">
				<thead>
					<tr>
						<th colspan="2" style="text-align:center; font-size:large;">주장</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:30%">
							<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.captain.player_no}">
								<img src="${pageContext.request.contextPath}/img/player_img.do?no=${info.captain.player_no}" />
							</a>
						</td>
						<td style="width:70%">
							<table class="table table-dark table-sm table-borderless" style="margin:auto;">
								<tr>
									<td>
										<span class="small_span">선수명 : </span>
										<span style="font-size:large; font-weight:bold;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.captain.player_no}" style="color:white;">${info.captain.player_name}</a>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span class="small_span">국적 : </span>
										<img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.captain.country_no}" style="width:24px; height:16px;"/>
										<span style="margin-left:5px; font-size:small;">${info.captain.country_name}</span>
									</td>
								</tr>
								<tr>
									<td><span class="small_span">나이 : </span>${info.mogoal.player_age}</td>
								</tr>
								<tr>
									<td><span class="small_span">포지션 : </span><span style="font-size:small;">${info.captain.player_position1} - ${info.captain.player_position2}</span></td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div style="height:6px"></div>
			
			<table class="table table-dark table-sm">
				<thead>
					<tr>
						<th colspan="3" style="text-align:center; font-size:large;">팀 내 최다득점자</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:30%">
							<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.mogoal.player_no}"> 
								<img src="${pageContext.request.contextPath}/img/player_img.do?no=${info.mogoal.player_no}" />
							</a>
						</td>
						<td colspan="2" style="width:70%">
							<table class="table table-dark table-sm table-borderless" style="margin:auto;">
								<tr>
									<td>
										<span class="small_span">선수명 : </span>
										<span style="font-size:large; font-weight:bold;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.mogoal.player_no}" style="color:white;">${info.mogoal.player_name}</a>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span class="small_span">국적 : </span>
										<img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.mogoal.country_no}" style="width:24px; height:16px;"/>
										<span style="margin-left:5px; font-size:small;">${info.mogoal.country_name}</span>
									</td>
								</tr>
								<tr>
									<td><span class="small_span">나이 : </span>${info.mogoal.player_age}</td>
								</tr>
								<tr>
									<td><span class="small_span">포지션 : </span><span style="font-size:small;">${info.mogoal.player_position1} - ${info.mogoal.player_position2}</span></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; width:30%">경기수</td>
						<td style="text-align:center; width:35%">득점</td>
						<td style="text-align:center; width:35%">도움</td>
					</tr>
					<tr>
						<td style="text-align:center;">${info.mogoal.attempts}</td>
						<td style="text-align:center;">${info.mogoal.goal}</td>
						<td style="text-align:center;">${info.mogoal.assist}</td>
					</tr>
				</tbody>
			</table>
			
			<div style="height:6px"></div>
			
			<table class="table table-dark table-sm">
				<thead>
					<tr>
						<th colspan="3" style="text-align:center; font-size:large;">팀 내 최다도움</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:30%">
							<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.moassist.player_no}">
								<img src="${pageContext.request.contextPath}/img/player_img.do?no=${info.moassist.player_no}" />
							</a>
						</td>
						<td colspan="2" style="width:70%">
							<table class="table table-dark table-sm table-borderless" style="margin:auto;">
								<tr>
									<td>
										<span class="small_span">선수명 : </span>
										<span style="font-size:large; font-weight:bold;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.moassist.player_no}" style="color:white;">${info.moassist.player_name}</a>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span class="small_span">국적 : </span>
										<img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.moassist.country_no}" style="width:24px; height:16px;"/>
										<span style="margin-left:5px; font-size:small;">${info.moassist.country_name}</span>
									</td>
								</tr>
								<tr>
									<td><span class="small_span">나이 : </span>${info.moassist.player_age}</td>
								</tr>
								<tr>
									<td><span class="small_span">포지션 : </span><span style="font-size:small;">${info.moassist.player_position1} - ${info.moassist.player_position2}</span></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; width:30%">경기수</td>
						<td style="text-align:center; width:35%">득점</td>
						<td style="text-align:center; width:35%">도움</td>
					</tr>
					<tr>
						<td style="text-align:center;">${info.moassist.attempts}</td>
						<td style="text-align:center;">${info.moassist.goal}</td>
						<td style="text-align:center;">${info.moassist.assist}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<table class="table table-dark table-sm" style="margin-top:10px">
		<tr>
			<td colspan="7" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${club.club_no}" style="width:18px; height:24px;"/> 공격포인트 순위</td>
		</tr>
		<tr>
			<td style="text-align:center; width:10%">순위</td>
			<td style="text-align:center; width:35%">선수</td>
			<td style="width:15%">국적</td>
			<td style="text-align:center; width:10%">경기수</td>
			<td style="text-align:center; width:10%">득점</td>
			<td style="text-align:center; width:10%">도움</td>
			<td style="text-align:center; width:10%">공격포인트</td>
		</tr>
		<c:forEach var="point" items="${info.pointlist}" varStatus="count">
			<tr>
				<td style="text-align:center; vertical-align:middle;">${count.count}</td>
				<td>
					<table class="table table-dark table-sm table-borderless" style="margin:auto;">
						<tr>
							<td rowspan="2" style="width:40px">
								<a href="${pageContext.request.contextPath}/detail/player.do?no=${point.player_no}">
									<img src="${pageContext.request.contextPath}/img/player_img.do?no=${point.player_no}" style="width:40px; height:40px"/>
								</a>
							</td>
							<td style="font-size:small;">
								<a href="${pageContext.request.contextPath}/detail/player.do?no=${point.player_no}" style="color:white;">${point.player_name}</a>
							</td>
						</tr>
						<tr>
							<td style="font-size:small;">${point.player_position1} - ${point.player_position2}</td>
						</tr>
					</table>
				</td>
				<td style="vertical-align:middle;">
					<img src="${pageContext.request.contextPath}/img/country_img.do?no=${point.country_no}" style="width:24px; height:16px;" />
					<span style="margin-left:5px; font-size:small;">${point.country_name}</span>
				</td>
				<td style="text-align:center; vertical-align:middle;">${point.attempts}</td>
				<td style="text-align:center; vertical-align:middle;">${point.goal}</td>
				<td style="text-align:center; vertical-align:middle;">${point.assist}</td>
				<td style="text-align:center; vertical-align:middle;">${point.point}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<script>
$(function(){

});
</script>

<jsp:include page="../footer.jsp"></jsp:include>