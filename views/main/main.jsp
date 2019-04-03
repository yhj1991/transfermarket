<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<style>
.table tr th {
	vertical-align:middle;
}

.table tr td {
	vertical-align:middle;
}
</style>

<jsp:include page="../header.jsp"></jsp:include>

<div style="height:10px"></div>

<div class="container">
	<div class="form-inline" align="center">
	<c:forEach var="category" items="${category}">
		<div class="col-sm-2">
			<div>
				<a href="${pageContext.request.contextPath}/detail/continent.do?no=${category.continent_no}">
					<img src="${pageContext.request.contextPath}/img/continent_img.do?no=${category.continent_no}" style="width:65px; height:65px" alt="${category.continent_name}" />
				</a>
			</div>
			<div style="margin-top:3px"><span style="font-weight:bold;">${category.continent_name}</span></div>
		</div>
	</c:forEach>
	</div>
</div>

<hr />

<div class="container">
	
	<div class="row">
		<div class="col" style="padding:0px">
			<table class="table table-sm table-dark">
				<thead>
					<tr>
						<th colspan="3" style="text-align:center;">시즌기록(득점)</th>
					</tr>
					<tr>
						<td colspan="3" style="text-align:right; font-size:small;">
							<a href="#">전체</a>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; font-size:small;">선수</td>
						<td style="text-align:center; font-size:small;">경기</td>
						<td style="text-align:center; font-size:small;">득점</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="goal" items="${player.goal}">
						<tr style="height:48px">
							<td style="text-align:center;">
								<table class="table table-dark table-sm table-borderless" style="margin:auto;">
									<tr>
										<td rowspan="2" style="width:40px">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${goal.player_no}"  style="color:white;">
												<img src="${pageContext.request.contextPath}/img/player_img.do?no=${goal.player_no}" style="width:40px; height:40px"/>
											</a>
										</td>
										<td style="font-size:small;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${goal.player_no}"  style="color:white;">${goal.player_name}</a>
										</td>
									</tr>
									<tr>
										<td style="font-size:small;">
											<a href="${pageContext.request.contextPath}/detail/club.do?no=${goal.club_no}" style="color:white;">
												<img src="${pageContext.request.contextPath}/img/club_img.do?no=${goal.club_no}" style="margin-right:5px; width:18px; height:24px;" />${goal.club_name}
											</a>
										</td>
									</tr>
								</table>
							</td>
							<td style="text-align:center; vertical-align:middle;">${goal.attempts}</td>
							<td style="text-align:center; vertical-align:middle;">${goal.goal}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="col" style="padding:0px; margin-left:3px">
			<table class="table table-sm table-dark">
				<thead>
					<tr>
						<th colspan="3" style="text-align:center;">시즌기록(도움)</th>
					</tr>
					<tr>
						<td colspan="3" style="text-align:right; font-size:small;">
							<a href="#">전체</a>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; font-size:small;">선수</td>
						<td style="text-align:center; font-size:small;">경기</td>
						<td style="text-align:center; font-size:small;">도움</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="assist" items="${player.assist}">
						<tr style="height:48px">
							<td style="text-align:center;">
								<table class="table table-dark table-sm table-borderless" style="margin:auto;">
									<tr>
										<td rowspan="2" style="width:40px">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${assist.player_no}"  style="color:white;">
												<img src="${pageContext.request.contextPath}/img/player_img.do?no=${assist.player_no}" style="width:40px; height:40px"/>
											</a>
										</td>
										<td style="font-size:small;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${assist.player_no}"  style="color:white;">${assist.player_name}</a>
										</td>
									</tr>
									<tr>
										<td style="font-size:small;">
											<a href="${pageContext.request.contextPath}/detail/club.do?no=${assist.club_no}" style="color:white;">
												<img src="${pageContext.request.contextPath}/img/club_img.do?no=${assist.club_no}" style="margin-right:5px; width:18px; height:24px;" />${assist.club_name}
											</a>
										</td>
									</tr>
								</table>
							</td>
							<td style="text-align:center; vertical-align:middle;">${assist.attempts}</td>
							<td style="text-align:center; vertical-align:middle;">${assist.assist}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="col" style="padding:0px; margin-left:3px">
			<table class="table table-sm table-dark">
				<thead>
					<tr>
						<th colspan="3" style="text-align:center;">시장가치(높은순)</th>
					</tr>
					<tr>
						<td colspan="3" style="text-align:right; font-size:small;">
							<a href="#">전체</a>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; width:40px; font-size:small;">선수/클럽</td>
						<td style="text-align:right; font-size:small;"><span style="margin-right:25px">가치</span></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mv" items="${player.mv}">
						<tr style="height:48px">
							<td style="text-align:center;">
								<table class="table table-dark table-sm table-borderless" style="margin:auto;">
									<tr>
										<td rowspan="2" style="width:40px">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${mv.player_no}">
												<img src="${pageContext.request.contextPath}/img/player_img.do?no=${mv.player_no}" style="width:40px; height:40px"/>
											</a>
										</td>
										<td style="font-size:small;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${mv.player_no}" style="color:white;">${mv.player_name}</a>
										</td>
									</tr>
									<tr>
										<td style="font-size:small;">
											<img src="${pageContext.request.contextPath}/img/club_img.do?no=${mv.club_no}" style="margin-right:5px; width:18px; height:24px;" />
												<a href="${pageContext.request.contextPath}/detail/club.do?no=${mv.club_no}" style="color:white;">${mv.club_name}</a>
										</td>
									</tr>
								</table>
							</td>
							<td style="font-size:small; text-align:right; vertical-align:middle;">
								<span>$</span>
								<span style="font-size:large; font-weight:bold;">${mv.player_mv}</span>
								<span style="margin-right:20px">Bill</span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div style="height:30px"></div>

	<div class="row">
		<div class="col" style="padding:0px">
			<table class="table table-sm table-dark" style="height:330px">
				<thead>
					<tr>
						<th colspan="4" style="text-align:center;">수페르리가 엘라다 경기일정</th>
					</tr>
					<tr>
						<td style="text-align:center; font-size:small; width:15%">경기일</td>
						<td style="text-align:center; font-size:small; width:40%">홈</td>
						<td style="text-align:center; font-size:small; width:5%">시간</td>
						<td style="text-align:center; font-size:small; width:40%">어웨이</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="s_greece" items="${schedule_greece}">
						<tr style="height:40px">
							<td style="text-align:center;">${s_greece.match_date}</td>
								<td style="text-align:center;">
									<a href="${pageContext.request.contextPath}/detail/club.do?no=${s_greece.match_home}" style="color:white;">
										<img src="${pageContext.request.contextPath}/img/club_img.do?no=${s_greece.match_home}" style="width:18px; height:24px;"/>
										<span style="font-size:small; margin-left:3px">${s_greece.home_name}</span>
									</a>
								</td>
							<td style="text-align:center;"><a href="${pageContext.request.contextPath}/detail/match.do?no=${s_greece.match_no}">${s_greece.match_kickoff}</a></td>
								<td style="text-align:center;">
									<a href="${pageContext.request.contextPath}/detail/club.do?no=${s_greece.match_away}" style="color:white;">
										<img src="${pageContext.request.contextPath}/img/club_img.do?no=${s_greece.match_away}" style="width:18px; height:24px;"/>
										<span style="font-size:small; margin-left:3px">${s_greece.away_name}</span>
									</a>
								</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>
		
		<div class="col-5" style="margin-left:5px; padding:0px">
			<table class="table table-sm table-dark">
				<thead>
					<tr>
						<th colspan="2" style="text-align:center;">많이 검색된 선수</th>
					</tr>
					<tr>
						<th style="text-align:center; font-size:small; width:55%">선수/포지션</th>
						<th style="text-align:center; width:45%; font-size:small;">국적/클럽</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="hit" items="${player.hit}">
						<tr>
							<td>
								<table class="table table-dark table-sm table-borderless" style="margin:auto;">
									<tr>
										<td rowspan="2" style="width:40px">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${hit.player_no}" style="color:white;">
												<img src="${pageContext.request.contextPath}/img/player_img.do?no=${hit.player_no}" style="width:40px; height:40px"/>
											</a>
										</td>
										<td style="font-size:small;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${hit.player_no}" style="color:white;">${hit.player_name}</a>
										</td>
									</tr>
									<tr>
										<td style="font-size:small;">${hit.player_position1} - ${hit.player_position2}</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="table table-dark table-sm table-borderless" style="margin:auto;">
									<tr>
										<td style="font-size:small;">
											<img src="${pageContext.request.contextPath}/img/country_img.do?no=${hit.country_no}" style="width:24px; height:16px;"/>
											<span style="margin-left:5px">${hit.country_name}</span>
										</td>
									</tr>
									<tr>
										<td style="font-size:small;">
											<a href="${pageContext.request.contextPath}/detail/club.do?no=${hit.club_no}" style="color:white;">
												<img src="${pageContext.request.contextPath}/img/club_img.do?no=${hit.club_no}" style="width:18px; height:24px;"/>
												<span style="margin-left:5px">${hit.club_name}</span>
											</a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>
	</div>
	
	<div style="height:30px"></div>
	
	<div class="row">
		<div class="col" style="padding:0px">
			<table class="table table-sm table-dark">
				<thead>
					<tr>
						<th colspan="4" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/league_img.do?no=6" style="margin-right:5px; width:18px; height:24px" />잉글랜드 프리미어 리그 경기일정</th>
					</tr>
					<tr>
						<td colspan="4">
							<div style="float:right;">
								<a href="#전체일정EPL" style="font-size:small;">전체일정</a>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; font-size:small; width:15%">경기일</td>
						<td style="text-align:center; font-size:small; width:40%">홈</td>
						<td style="text-align:center; font-size:small; width:5%">시간</td>
						<td style="text-align:center; font-size:small; width:40%">어웨이</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="s_epl" items="${schedule_epl}">
						<tr style="height:40px">
							<td style="text-align:center;">${s_epl.match_date}</td>
								<td style="text-align:center;">
									<a href="${pageContext.request.contextPath}/detail/club.do?no=${s_epl.match_home}" style="color:white;">
										<img src="${pageContext.request.contextPath}/img/club_img.do?no=${s_epl.match_home}" style="width:18px; height:24px;"/>
										<span style="font-size:small; margin-left:3px">${s_epl.home_name}</span>
									</a>
								</td>
								<td style="text-align:center;">
									<a href="${pageContext.request.contextPath}/detail/match.do?no=${s_epl.match_no}">${s_epl.match_kickoff}</a>
								</td>
								<td style="text-align:center;">
									<a href="${pageContext.request.contextPath}/detail/club.do?no=${s_epl.match_away}" style="color:white;">
										<img src="${pageContext.request.contextPath}/img/club_img.do?no=${s_epl.match_away}" style="width:18px; height:24px;"/>
										<span style="font-size:small; margin-left:3px">${s_epl.away_name}</span>
									</a>
								</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>
		
		<div class="col-5" style="margin-left:5px; padding:0px">
			<table class="table table-sm table-dark">
				<thead>
					<tr>
						<th colspan="7" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/league_img.do?no=6" style="margin-right:5px; width:18px; height:24px" />잉글랜드 프리미어 리그</th>
					</tr>
					<tr>
						<td colspan="7">
							<div style="float:left; width:5px; height:5px">
							</div>
							<div style="float:right;">
								<a href="${pageContext.request.contextPath}/detail/league.do?no=6" style="font-size:small;">전체</a>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; font-size:small; width:9%">순위</td>
						<td style="text-align:center; font-size:small; width:43%">클럽</td>
						<td style="text-align:center; font-size:small; width:12%">경기</td>
						<td style="text-align:center; font-size:small; width:9%">승</td>
						<td style="text-align:center; font-size:small; width:9%">무</td>
						<td style="text-align:center; font-size:small; width:9%">패</td>
						<td style="text-align:center; font-size:small; width:9%">승점</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="epl" items="${epl}" varStatus="idx">
						<tr style="height:40px">
							<td style="text-align:center; font-size:small;">${idx.count}</td>
							<td>
								<a href="${pageContext.request.contextPath}/detail/club.do?no=${epl.club_no}" style="color:white;">
									<img src="${pageContext.request.contextPath}/img/club_img.do?no=${epl.club_no}" style="width:18px; height:24px;"/>
									<span style="font-size:small; margin-left:3px">${epl.club_name}</span>
								</a>
							</td>
							<td style="text-align:center; font-size:small;">${epl.attempts}</td>
							<td style="text-align:center; font-size:small;">${epl.win}</td>
							<td style="text-align:center; font-size:small;">${epl.draw}</td>
							<td style="text-align:center; font-size:small;">${epl.lose}</td>
							<td style="text-align:center; font-size:small;">${epl.vp}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>
	</div>
	
	<div style="height:30px"></div>
	
	<div class="row">
		<div class="col" style="padding:0px">
			<table class="table table-sm table-dark">
				<thead>
					<tr>
						<th colspan="4" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/league_img.do?no=17" style="margin-right:5px; width:18px; height:24px" />스페인 프리메라리가 경기일정</th>
					</tr>
					<tr>
						<td colspan="4">
							<div style="float:left; width:5px; height:5px">
							</div>
							<div style="float:right;">
								<a href="#전체일정라리가" style="font-size:small;">전체일정</a>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; font-size:small; width:15%">경기일</td>
						<td style="text-align:center; font-size:small; width:40%">홈</td>
						<td style="text-align:center; font-size:small; width:5%">시간</td>
						<td style="text-align:center; font-size:small; width:40%">어웨이</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="s_laliga" items="${schedule_laliga}">
						<tr style="height:40px">
							<td style="text-align:center;">${s_laliga.match_date}</td>
								<td style="text-align:center;">
									<a href="${pageContext.request.contextPath}/detail/club.do?no=${s_laliga.match_home}" style="color:white;">
										<img src="${pageContext.request.contextPath}/img/club_img.do?no=${s_laliga.match_home}" style="width:18px; height:24px;"/>
										<span style="font-size:small; margin-left:3px">${s_laliga.home_name}</span>
									</a>
								</td>
								<td style="text-align:center;">
									<a href="${pageContext.request.contextPath}/detail/match.do?no=${s_laliga.match_no}">${s_laliga.match_kickoff}</a>
								</td>
								<td style="text-align:center;">
									<a href="${pageContext.request.contextPath}/detail/club.do?no=${s_laliga.match_away}" style="color:white;">
										<img src="${pageContext.request.contextPath}/img/club_img.do?no=${s_laliga.match_away}" style="width:18px; height:24px;"/>
										<span style="font-size:small; margin-left:3px">${s_laliga.away_name}</span>
									</a>
								</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>
		
		<div class="col-5" style="margin-left:5px; padding:0px">
			<table class="table table-sm table-dark">
				<thead>
					<tr>
						<th colspan="7" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/league_img.do?no=17" style="margin-right:5px; width:18px; height:24px" />스페인 프리메라리가</th>
					</tr>
					<tr>
						<td colspan="7">
							<div style="float:left; width:5px; height:5px">
							</div>
							<div style="float:right;">
								<a href="${pageContext.request.contextPath}/detail/league.do?no=17" style="font-size:small;">전체</a>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; font-size:small; width:9%">순위</td>
						<td style="text-align:center; font-size:small; width:43%">클럽</td>
						<td style="text-align:center; font-size:small; width:12%">경기</td>
						<td style="text-align:center; font-size:small; width:9%">승</td>
						<td style="text-align:center; font-size:small; width:9%">무</td>
						<td style="text-align:center; font-size:small; width:9%">패</td>
						<td style="text-align:center; font-size:small; width:9%">승점</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="laliga" items="${laliga}" varStatus="idx">
						<tr style="height:40px">
							<td style="text-align:center; font-size:small;">${idx.count}</td>
							<td>
								<a href="${pageContext.request.contextPath}/detail/club.do?no=${laliga.club_no}" style="color:white;">
									<img src="${pageContext.request.contextPath}/img/club_img.do?no=${laliga.club_no}" style="width:18px; height:24px;"/>
									<span style="font-size:small; margin-left:3px">${laliga.club_name}</span>
								</a>
							</td>
							<td style="text-align:center; font-size:small;">${laliga.attempts}</td>
							<td style="text-align:center; font-size:small;">${laliga.win}</td>
							<td style="text-align:center; font-size:small;">${laliga.draw}</td>
							<td style="text-align:center; font-size:small;">${laliga.lose}</td>
							<td style="text-align:center; font-size:small;">${laliga.vp}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>
	</div>
	
	<div style="height:30px"></div>
	
	<div class="row">
		<div class="col" style="padding:0px">
			<table class="table table-sm table-dark">
				<thead>
					<tr>
						<th colspan="4" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/league_img.do?no=10" style="margin-right:5px; width:18px; height:24px" />이탈리아 세리에 A 경기일정</th>
					</tr>
					<tr>
						<td colspan="4">
							<div style="float:left; width:5px; height:5px">
							</div>
							<div style="float:right;">
								<a href="#전체일정세리에" id="total_seria_match" style="font-size:small;">전체일정</a>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; font-size:small; width:15%">경기일</td>
						<td style="text-align:center; font-size:small; width:40%">홈</td>
						<td style="text-align:center; font-size:small; width:5%">시간</td>
						<td style="text-align:center; font-size:small; width:40%">어웨이</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="s_seria" items="${schedule_seria}">
						<tr style="height:40px">
							<td style="text-align:center;">${s_seria.match_date}</td>
								<td style="text-align:center;">
									<a href="${pageContext.request.contextPath}/detail/club.do?no=${s_seria.match_home}" style="color:white;">
										<img src="${pageContext.request.contextPath}/img/club_img.do?no=${s_seria.match_home}" style="width:18px; height:24px;"/>
										<span style="font-size:small; margin-left:3px">${s_seria.home_name}</span>
									</a>
								</td>
								<td style="text-align:center;">
									<a href="${pageContext.request.contextPath}/detail/match.do?no=${s_seria.match_no}">${s_seria.match_kickoff}</a>
								</td>
								<td style="text-align:center;">
									<a href="${pageContext.request.contextPath}/detail/club.do?no=${s_seria.match_away}" style="color:white;">
										<img src="${pageContext.request.contextPath}/img/club_img.do?no=${s_seria.match_away}" style="width:18px; height:24px;"/>
										<span style="font-size:small; margin-left:3px">${s_seria.away_name}</span>
									</a>
								</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>
		
		<div class="col-5" style="margin-left:5px; padding:0px">
			<table class="table table-sm table-dark">
				<thead>
					<tr>
						<th colspan="7" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/league_img.do?no=10" style="margin-right:5px; width:18px; height:24px" />이탈리아 세리에 A</th>
					</tr>
					<tr>
						<td colspan="7">
							<div style="float:left; width:5px; height:5px">
							</div>
							<div style="float:right;">
								<a href="${pageContext.request.contextPath}/detail/league.do?no=10" style="font-size:small;">전체</a>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; font-size:small; width:9%">순위</td>
						<td style="text-align:center; font-size:small; width:43%">클럽</td>
						<td style="text-align:center; font-size:small; width:12%">경기</td>
						<td style="text-align:center; font-size:small; width:9%">승</td>
						<td style="text-align:center; font-size:small; width:9%">무</td>
						<td style="text-align:center; font-size:small; width:9%">패</td>
						<td style="text-align:center; font-size:small; width:9%">승점</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="seria" items="${seria}" varStatus="idx">
						<tr style="height:40px">
							<td style="text-align:center; font-size:small;">${idx.count}</td>
							<td>
								<a href="${pageContext.request.contextPath}/detail/club.do?no=${seria.club_no}" style="color:white;">
									<img src="${pageContext.request.contextPath}/img/club_img.do?no=${seria.club_no}" style="width:18px; height:24px;"/>
									<span style="font-size:small; margin-left:3px">${seria.club_name}</span>
								</a>
							</td>
							<td style="text-align:center; font-size:small;">${seria.attempts}</td>
							<td style="text-align:center; font-size:small;">${seria.win}</td>
							<td style="text-align:center; font-size:small;">${seria.draw}</td>
							<td style="text-align:center; font-size:small;">${seria.lose}</td>
							<td style="text-align:center; font-size:small;">${seria.vp}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>
	</div>
	
	<div style="height:30px"></div>
	
	<div class="row">
		<div class="col" style="padding:0px">
			<table class="table table-sm table-dark">
				<thead>
					<tr align="center">
						<th colspan="4">
							<a href="#" id="prev1" style="color:white;">&#60;</a>
								<span style="color:white; font-weight:bold; margin-left:10px">UEFA 챔피언스리그 경기일정 (<span id="group_code1" style="color:white; font-weight:bold;">A</span>조)</span>
							<a href="#" id="next1" style="color:white; margin-left:10px">&#62;</a>
						</th>
					</tr>
					<tr>
						<td colspan="4">
							<div style="float:left; width:5px; height:5px">
							</div>
							<div style="float:right;">
								<a href="#전체일정챔스" id="total_champs_matchday" style="font-size:small;">전체일정</a>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; font-size:small; width:15%">경기일</td>
						<td style="text-align:center; font-size:small; width:40%">홈</td>
						<td style="text-align:center; font-size:small; width:5%">시간</td>
						<td style="text-align:center; font-size:small; width:40%">어웨이</td>
					</tr>
				</thead>
				<tbody id="champs_match_tbody">
					<c:forEach var="champs" items="${schedule_champs}">
						<tr style="height:40px">
							<td style="text-align:center;">${champs.match_date}</td>
							<td style="text-align:center;">
								<a href="${pageContext.request.contextPath}/detail/club.do?no=${champs.match_home}" style="color:white;">
									<img src="${pageContext.request.contextPath}/img/club_img.do?no=${champs.match_home}" style="width:18px; height:24px;"/>
									<span style="font-size:small; margin-left:3px">${champs.home_name}</span>
								</a>
							</td>
							<td style="text-align:center;"><a href="${pageContext.request.contextPath}/detail/champs_match.do?no=${champs.match_no}">${champs.match_kickoff}</a></td>
							<td style="text-align:center;">
								<a href="${pageContext.request.contextPath}/detail/club.do?no=${champs.match_away}" style="color:white;">
									<img src="${pageContext.request.contextPath}/img/club_img.do?no=${champs.match_away}" style="width:18px; height:24px;"/>
									<span style="font-size:small; margin-left:3px">${champs.away_name}</span>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>
		
		<div class="col-5" style="margin-left:5px; padding:0px">
			<table class="table table-sm table-dark">
				<thead>
					<tr>
						<th colspan="7" style="text-align:center;">
							<a href="#" id="prev2" style="color:white;">&#60;</a>
								<span style="color:white; font-weight:bold; margin-left:10px">UEFA 챔피언스리그(<span id="group_code2" style="color:white; font-weight:bold;">A</span>조)</span>
							<a href="#" id="next2" style="color:white; margin-left:10px">&#62;</a>
						</th>
					</tr>
					<tr>
						<td colspan="7">
							<div style="float:left; width:5px; height:5px">
							</div>
							<div style="float:right;">
								<a href="#전체클럽챔스" id="total_champs_matchday" style="font-size:small;">전체</a>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; font-size:small; width:9%">순위</td>
						<td style="text-align:center; font-size:small; width:43%">클럽</td>
						<td style="text-align:center; font-size:small; width:12%">경기</td>
						<td style="text-align:center; font-size:small; width:9%">승</td>
						<td style="text-align:center; font-size:small; width:9%">무</td>
						<td style="text-align:center; font-size:small; width:9%">패</td>
						<td style="text-align:center; font-size:small; width:9%">승점</td>
					</tr>
				</thead>
				<tbody id="champs_clublist_tbody">
					<c:forEach var="champs" items="${champs}" varStatus="idx">
						<tr style="height:40px">
							<td style="text-align:center; font-size:small;">${idx.count}</td>
							<td>
								<a href="${pageContext.request.contextPath}/detail/club.do?no=${champs.club_no}" style="color:white;">
									<img src="${pageContext.request.contextPath}/img/club_img.do?no=${champs.club_no}" style="width:18px; height:24px;"/>
									<span style="font-size:small; margin-left:3px">${champs.club_name}</span>
								</a>
							</td>
							<td style="text-align:center; font-size:small;">${champs.attempts}</td>
							<td style="text-align:center; font-size:small;">${champs.win}</td>
							<td style="text-align:center; font-size:small;">${champs.draw}</td>
							<td style="text-align:center; font-size:small;">${champs.lose}</td>
							<td style="text-align:center; font-size:small;">${champs.vp}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div>
	</div>
</div>

<script>
$(function(){
	var champs_group = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
	var num1 = 0;
	var num2 = 0;
	
	$('#prev1').click(function(){
		event.preventDefault();
		num1--;
		if(num1 < 0){
			num1 = 7;
		} 
		$('#group_code1').text(champs_group[num1]);
		$.post('rest_champs_group_match.json', {group : champs_group[num1]}, function(data){
			var len = data.match.length;
			$('#champs_match_tbody').empty();
			for(var i = 0; i < len; i++){
				$('#champs_match_tbody').append(
						'<tr style="height:40px">'+
							'<td style="text-align:center;"><a href="${pageContext.request.contextPath}/detail/champs_match.do?no=' + data.match[i].match_no + '" style="color:white;">' + data.match[i].match_date + '</a></td>'+
							'<td style="text-align:center;">'+
								'<a href="${pageContext.request.contextPath}/detail/club.do?no=' + data.match[i].match_home + '" style="color:white;">'+
								'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.match[i].match_home + '" style="width:18px; height:24px;"/>'+
								'<span style="font-size:small; margin-left:3px">' + data.match[i].home_name + '</span>'+
								'</a>'+
								'</td>'+
							'<td style="text-align:center;"><a href="${pageContext.request.contextPath}/detail/champs_match.do?no=' + data.match[i].match_no + '">' + data.match[i].match_kickoff + '</a></td>'+
							'<td style="text-align:center;">'+
								'<a href="${pageContext.request.contextPath}/detail/club.do?no=' + data.match[i].match_away + '" style="color:white;">'+
								'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.match[i].match_away + '" style="width:18px; height:24px;"/>'+
								'<span style="font-size:small; margin-left:3px">' + data.match[i].away_name + '</span>'+
								'</a>'+
							'</td>'+
						'</tr>'		
				);
			}
		});
	});
	
	$('#next1').click(function(){
		event.preventDefault();
		num1++;
		if(num1 > 7){
			num1 = 0;
		}
		$('#group_code1').text(champs_group[num1]);
		$.post('rest_champs_group_match.json', {group : champs_group[num1]}, function(data){
			var len = data.match.length;
			$('#champs_match_tbody').empty();
			for(var i = 0; i < len; i++){
				$('#champs_match_tbody').append(
						'<tr style="height:40px">'+
							'<td style="text-align:center;"><a href="${pageContext.request.contextPath}/detail/champs_match.do?no=' + data.match[i].match_no + '" style="color:white;">' + data.match[i].match_date + '</a></td>'+
							'<td style="text-align:center;">'+
								'<a href="${pageContext.request.contextPath}/detail/club.do?no=' + data.match[i].match_home + '" style="color:white;">'+
								'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.match[i].match_home + '" style="width:18px; height:24px;"/>'+
								'<span style="font-size:small; margin-left:3px">' + data.match[i].home_name + '</span>'+
								'</a>'+
								'</td>'+
							'<td style="text-align:center;"><a href="${pageContext.request.contextPath}/detail/champs_match.do?no=' + data.match[i].match_no + '">' + data.match[i].match_kickoff + '</a></td>'+
							'<td style="text-align:center;">'+
								'<a href="${pageContext.request.contextPath}/detail/club.do?no=' + data.match[i].match_away + '" style="color:white;">'+
								'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.match[i].match_away + '" style="width:18px; height:24px;"/>'+
								'<span style="font-size:small; margin-left:3px">' + data.match[i].away_name + '</span>'+
								'</a>'+
							'</td>'+
						'</tr>'		
				);
			}
		});
	});
	
	$('#prev2').click(function(){
		event.preventDefault();
		num2--;
		if(num2 < 0){
			num2 = 7;
		} 
		$('#group_code2').text(champs_group[num2]);
		$.post('rest_champs_grouplist.json', {group : champs_group[num2]}, function(data){
			var len = data.groupList.length;
			$('#champs_clublist_tbody').empty();
			for(var i = 0; i < len; i++){
				$('#champs_clublist_tbody').append(
						'<tr style="height:40px">'+
							'<td style="text-align:center; font-size:small;">' + (i+1) + '</td>'+
							'<td>'+
								'<a href="${pageContext.request.contextPath}/detail/club.do?no=' + data.groupList[i].club_no + '" style="color:white;">'+
								'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.groupList[i].club_no + '" style="width:18px; height:24px;"/>'+
								'<span style="font-size:small; margin-left:3px">' + data.groupList[i].club_name + '</span>'+
								'</a>'+
							'</td>'+
							'<td style="text-align:center; font-size:small;">' + data.groupList[i].attempts + '</td>'+
							'<td style="text-align:center; font-size:small;">' + data.groupList[i].win + '</td>'+
							'<td style="text-align:center; font-size:small;">' + data.groupList[i].draw + '</td>'+
							'<td style="text-align:center; font-size:small;">' + data.groupList[i].lose + '</td>'+
							'<td style="text-align:center; font-size:small;">' + data.groupList[i].vp + '</td>'+
						'</tr>'
				);
			}
		},'json');
	});
	
	$('#next2').click(function(){
		event.preventDefault();
		num2++;
		if(num2 > 7){
			num2 = 0;
		}
		$('#group_code2').text(champs_group[num2]);
		$.post('rest_champs_grouplist.json', {group : champs_group[num2]}, function(data){
			console.log(data);
			var len = data.groupList.length;
			$('#champs_clublist_tbody').empty();
			for(var i = 0; i < len; i++){
				$('#champs_clublist_tbody').append(
						'<tr style="height:40px">'+
							'<td style="text-align:center; font-size:small;">' + (i+1) + '</td>'+
							'<td>'+
								'<a href="${pageContext.request.contextPath}/detail/club.do?no=' + data.groupList[i].club_no + '" style="color:white;">'+
								'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.groupList[i].club_no + '" style="width:18px; height:24px;"/>'+
								'<span style="font-size:small; margin-left:3px">' + data.groupList[i].club_name + '</span>'+
								'</a>'+
							'</td>'+
							'<td style="text-align:center; font-size:small;">' + data.groupList[i].attempts + '</td>'+
							'<td style="text-align:center; font-size:small;">' + data.groupList[i].win + '</td>'+
							'<td style="text-align:center; font-size:small;">' + data.groupList[i].draw + '</td>'+
							'<td style="text-align:center; font-size:small;">' + data.groupList[i].lose + '</td>'+
							'<td style="text-align:center; font-size:small;">' + data.groupList[i].vp + '</td>'+
						'</tr>'
				);
			}
		},'json');
	});
	
});
</script>
<jsp:include page="../footer.jsp"></jsp:include>