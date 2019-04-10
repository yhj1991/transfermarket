<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<style>
.small_span {
	font-size:small;
}
</style>

<jsp:include page="../header.jsp"></jsp:include>

<div style="height:30px"></div>

<div class="container">
	<table class="table table-bordered table-sm table-dark">
		<tr>
			<td rowspan="3" style="text-align:left; width:10%">
				<a href="${pageContext.request.contextPath}/detail/club.do?no=${match.match_home}">
					<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="width:92px; height:120px"/>
				</a>
			</td>
			<td rowspan="3" style="text-align:left; width:20%">
				<a href="${pageContext.request.contextPath}/detail/league.do?no=${match.home_league}">
					<span style="font-size:small;">
						<img src="${pageContext.request.contextPath}/img/league_img.do?no=${match.home_league}" style="margin-right:5px; width:18px; height:24px"/>${match.home_league_name}
					</span>
				</a>
				<br />
				<a href="${pageContext.request.contextPath}/detail/club.do?no=${match.match_home}">${match.home_name}</a>
			</td>
			<td style="text-align:center; width:50%;"><span style="font-size:x-large; font-weight:bold;">${match.home_league_name}</span><br />
				<span style="font-size:small;">${match.match_date} (${match.week})</span>
			</td>
			<td rowspan="3" style="text-align:right; width:20%">
				<span style="font-size:small;">
					<a href="${pageContext.request.contextPath}/detail/league.do?no=${match.away_league}">
						<img src="${pageContext.request.contextPath}/img/league_img.do?no=${match.away_league}" style="margin-right:5px; width:18px; height:24px"/>${match.away_league_name}
					</a>
				</span>
				<br />
				<a href="${pageContext.request.contextPath}/detail/club.do?no=${match.match_away}">${match.away_name}</a>
			</td>
			<td rowspan="3" style="text-align:right; width:10%">
				<a href="${pageContext.request.contextPath}/detail/club.do?no=${match.match_away}">
					<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="width:92px; height:120px"/>
				</a>
			</td>
		</tr>
		<tr>
			<td style="text-align:center; border:none;"><h2>${match.match_kickoff}</h2></td>
		</tr>
		<tr>
			<td style="text-align:center;  border:none;">경기장<br /><span style="font-size:small;">${match.club_stadium}</span></td>
		</tr>
	</table>

	<table class="table table-dark table-sm">
		<tr>
			<th colspan="5" style="text-align:center;">팀별 정보</th>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center; width:40%">
				<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="width:18px; height:24px"/>
				<span style="font-weight:bold; margin-left:5px">${match.home_name}</span>
			</td>
			<td style="text-align:center; width:20%">팀</td>
			<td colspan="2" style="text-align:center; width:40%">
				<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="width:18px; height:24px"/>
				<span style="font-weight:bold; margin-left:5px">${match.away_name}</span>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center; width:40%">${info.club[0].goal}</td>
			<td style="text-align:center; width:20%">팀 득점</td>
			<td colspan="2" style="text-align:center; width:40%">${info.club[1].goal}</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center; width:40%">${info.club[0].assist}</td>
			<td style="text-align:center; width:20%">팀 도움</td>
			<td colspan="2" style="text-align:center; width:40%">${info.club[1].assist}</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center; width:40%">${info.club[0].player_mv}</td>
			<td style="text-align:center; width:20%">선수단 가치 (Bill)</td>
			<td colspan="2" style="text-align:center; width:40%">${info.club[1].player_mv}</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center; width:40%">${info.club[0].player_age}</td>
			<td style="text-align:center; width:20%">평균 나이</td>
			<td colspan="2" style="text-align:center; width:40%">${info.club[1].player_age}</td>
		</tr>
	</table>
	
	<div class="row">
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<tr>
					<td colspan="3" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="margin-right:5px; width:18px; height:24px" />감독</td>
				</tr>
				<tr>
					<td style="width:20%"><img src="${pageContext.request.contextPath}/img/coach_img.do?no=${info.coach[0].coach_no}" /></td>
					<td style="width:40%">
						<table class="table table-dark table-sm table-borderless">
							<tr>
								<td><span class="small_span" style="font-weight:bold;">${info.coach[0].coach_name}</span></td>
							</tr>
							<tr>
								<td><img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.coach[0].country_no}" style="width:24px; height:16px"/><span style="margin-left:5px; font-size:small;">${info.coach[0].country_name}</span></td>
							</tr>
							<tr>
								<td>나이 : ${info.coach[0].coach_age}</td>
							</tr>
							<tr>
								<td><span style="font-size:small;">선호 포메이션 : ${info.coach[0].coach_formation}</span></td>
							</tr>
						</table>
					</td>
					<td style="width:40%;" align="center">
						<img src="${pageContext.request.contextPath}/img/formation_img.do?formation=${info.coach[0].coach_formation}"  style="width:150px; height:100px; margin-top:15px"/>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<tr>
					<td colspan="3" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="margin-right:5px; width:18px; height:24px" />감독</td>
				</tr>
				<tr>
					<td style="width:20%"><img src="${pageContext.request.contextPath}/img/coach_img.do?no=${info.coach[1].coach_no}" /></td>
					<td style="width:40%">
						<table class="table table-dark table-sm table-borderless">
							<tr>
								<td><span class="small_span" style="font-weight:bold;">${info.coach[1].coach_name}</span></td>
							</tr>
							<tr>
								<td><img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.coach[1].country_no}" style="width:24px; height:16px"/><span style="margin-left:5px; font-size:small;">${info.coach[1].country_name}</span></td>
							</tr>
							<tr>
								<td>나이 : ${info.coach[0].coach_age}</td>
							</tr>
							<tr>
								<td><span style="font-size:small;">선호 포메이션 : ${info.coach[1].coach_formation}</span></td>
							</tr>
						</table>
					</td>
					<td style="width:40%" align="center">
						<img src="${pageContext.request.contextPath}/img/formation_img.do?formation=${info.coach[1].coach_formation}"  style="width:150px; height:100px; margin-top:15px"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="row">
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<thead>
					<tr>
						<td colspan="3" style="text-align:center;">
							<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="margin-right:5px; width:18px; height:24px" />핵심 선수
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:30%" align="center">
							<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player1[0].player_no}">
								<img src="${pageContext.request.contextPath}/img/player_img.do?no=${info.player1[0].player_no}" style="width:120px; height:120px"/>
							</a>
						</td>
						<td colspan="2" style="width:70%">
							<table class="table table-dark table-sm table-borderless" style="margin:auto;">
								<tr>
									<td>
										<span class="small_span">선수명 : </span>
										<span style="font-size:large; font-weight:bold;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player1[0].player_no}" style="color:white;">${info.player1[0].player_name}</a>
										</span>
									</td>
								</tr>
								<tr>
									<td><span class="small_span">국적 : </span><img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.player1[0].country_no}" style="width:24px; height:16px"/><span style="margin-left:5px; font-weight:bold;">${info.player1[0].country_name}</span></td>
								</tr>
								<tr>
									<td><span class="small_span">나이 : </span>${info.player1[0].player_age}</td>
								</tr>
								<tr>
									<td><span class="small_span">포지션 : </span><span style="font-size:small;">${info.player1[0].player_position1} - ${info.player1[0].player_position2}</span></td>
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
						<td style="text-align:center;">${info.player1[0].attempts}</td>
						<td style="text-align:center;">${info.player1[0].goal}</td>
						<td style="text-align:center;">${info.player1[0].assist}</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<thead>
					<tr>
						<td colspan="3" style="text-align:center;">
							<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="margin-right:5px; width:18px; height:24px" />핵심 선수
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:30%" align="center">
							<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player1[1].player_no}">
								<img src="${pageContext.request.contextPath}/img/player_img.do?no=${info.player1[1].player_no}" style="width:120px; height:120px"/>
							</a>
						</td>
						<td colspan="2" style="width:70%">
							<table class="table table-dark table-sm table-borderless" style="margin:auto;">
								<tr>
									<td>
										<span class="small_span">선수명 : </span>
										<span style="font-size:large; font-weight:bold;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player1[0].player_no}" style="color:white;">${info.player1[1].player_name}</a>
										</span>
									</td>
								</tr>
								<tr>
									<td><span class="small_span">국적 : </span><img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.player1[1].country_no}" style="width:24px; height:16px"/><span style="margin-left:5px; font-weight:bold;">${info.player1[1].country_name}</span></td>
								</tr>
								<tr>
									<td><span class="small_span">나이 : </span>${info.player1[1].player_age}</td>
								</tr>
								<tr>
									<td><span class="small_span">포지션 : </span><span style="font-size:small;">${info.player1[1].player_position1} - ${info.player1[1].player_position2}</span></td>
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
						<td style="text-align:center;">${info.player1[1].attempts}</td>
						<td style="text-align:center;">${info.player1[1].goal}</td>
						<td style="text-align:center;">${info.player1[1].assist}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="row">
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<thead>
					<tr>
						<td colspan="3" style="text-align:center;">
							<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="margin-right:5px; width:18px; height:24px" />최다 득점
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:30%" align="center">
							<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player2[0].player_no}">
								<img src="${pageContext.request.contextPath}/img/player_img.do?no=${info.player2[0].player_no}" style="width:120px; height:120px"/>
							</a>
						</td>
						<td colspan="2" style="width:70%">
							<table class="table table-dark table-sm table-borderless" style="margin:auto;">
								<tr>
									<td>
										<span class="small_span">선수명 : </span>
										<span style="font-size:large; font-weight:bold;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player2[0].player_no}" style="color:white;">${info.player2[0].player_name}</a>
										</span>
									</td>
								</tr>
								<tr>
									<td><span class="small_span">국적 : </span><img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.player2[0].country_no}" style="width:24px; height:16px"/><span style="margin-left:5px; font-weight:bold;">${info.player2[0].country_name}</span></td>
								</tr>
								<tr>
									<td><span class="small_span">나이 : </span>${info.player2[0].player_age}</td>
								</tr>
								<tr>
									<td><span class="small_span">포지션 : </span><span style="font-size:small;">${info.player2[0].player_position1} - ${info.player2[0].player_position2}</span></td>
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
						<td style="text-align:center;">${info.player2[0].attempts}</td>
						<td style="text-align:center;">${info.player2[0].goal}</td>
						<td style="text-align:center;">${info.player2[0].assist}</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<thead>
					<tr>
						<td colspan="3" style="text-align:center;">
							<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="margin-right:5px; width:18px; height:24px" />최다 득점
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:30%" align="center">
							<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player2[1].player_no}">
								<img src="${pageContext.request.contextPath}/img/player_img.do?no=${info.player2[1].player_no}" style="width:120px; height:120px"/>
							</a>
						</td>
						<td colspan="2" style="width:70%">
							<table class="table table-dark table-sm table-borderless" style="margin:auto;">
								<tr>
									<td>
										<span class="small_span">선수명 : </span>
										<span style="font-size:large; font-weight:bold;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player2[1].player_no}" style="color:white;">${info.player2[1].player_name}</a>
										</span>
									</td>
								</tr>
								<tr>
									<td><span class="small_span">국적 : </span><img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.player2[1].country_no}" style="width:24px; height:16px"/><span style="margin-left:5px; font-weight:bold;">${info.player2[1].country_name}</span></td>
								</tr>
								<tr>
									<td><span class="small_span">나이 : </span>${info.player2[1].player_age}</td>
								</tr>
								<tr>
									<td><span class="small_span">포지션 : </span><span style="font-size:small;">${info.player2[1].player_position1} - ${info.player2[1].player_position2}</span></td>
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
						<td style="text-align:center;">${info.player2[1].attempts}</td>
						<td style="text-align:center;">${info.player2[1].goal}</td>
						<td style="text-align:center;">${info.player2[1].assist}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="row">
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<thead>
					<tr>
						<td colspan="3" style="text-align:center;">
							<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="margin-right:5px; width:18px; height:24px" />최다 도움
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:30%" align="center">
							<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player3[0].player_no}">
								<img src="${pageContext.request.contextPath}/img/player_img.do?no=${info.player3[0].player_no}" style="width:120px; height:120px"/>
							</a>
						</td>
						<td colspan="2" style="width:70%">
							<table class="table table-dark table-sm table-borderless" style="margin:auto;">
								<tr>
									<td>
										<span class="small_span">선수명 : </span>
										<span style="font-size:large; font-weight:bold;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player3[0].player_no}" style="color:white;">${info.player3[0].player_name}</a>
										</span>
									</td>
								</tr>
								<tr>
									<td><span class="small_span">국적 : </span><img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.player3[0].country_no}" style="width:24px; height:16px"/><span style="margin-left:5px; font-weight:bold;">${info.player3[0].country_name}</span></td>
								</tr>
								<tr>
									<td><span class="small_span">나이 : </span>${info.player3[0].player_age}</td>
								</tr>
								<tr>
									<td><span class="small_span">포지션 : </span><span style="font-size:small;">${info.player3[0].player_position1} - ${info.player3[0].player_position2}</span></td>
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
						<td style="text-align:center;">${info.player3[0].attempts}</td>
						<td style="text-align:center;">${info.player3[0].goal}</td>
						<td style="text-align:center;">${info.player3[0].assist}</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<thead>
					<tr>
						<td colspan="3" style="text-align:center;">
							<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="margin-right:5px; width:18px; height:24px" />최다 도움
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:30%" align="center">
							<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player3[1].player_no}">
								<img src="${pageContext.request.contextPath}/img/player_img.do?no=${info.player3[1].player_no}" style="width:120px; height:120px"/>
							</a>
						</td>
						<td colspan="2" style="width:70%">
							<table class="table table-dark table-sm table-borderless" style="margin:auto;">
								<tr>
									<td>
										<span class="small_span">선수명 : </span>
										<span style="font-size:large; font-weight:bold;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player3[1].player_no}" style="color:white;">${info.player3[1].player_name}</a>
										</span>
									</td>
								</tr>
								<tr>
									<td><span class="small_span">국적 : </span><img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.player3[1].country_no}" style="width:24px; height:16px"/><span style="margin-left:5px; font-weight:bold;">${info.player3[1].country_name}</span></td>
								</tr>
								<tr>
									<td><span class="small_span">나이 : </span>${info.player3[1].player_age}</td>
								</tr>
								<tr>
									<td><span class="small_span">포지션 : </span><span style="font-size:small;">${info.player3[1].player_position1} - ${info.player3[1].player_position2}</span></td>
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
						<td style="text-align:center;">${info.player3[1].attempts}</td>
						<td style="text-align:center;">${info.player3[1].goal}</td>
						<td style="text-align:center;">${info.player3[1].assist}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="row">
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<thead>
					<tr>
						<td colspan="3" style="text-align:center;">
							<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="margin-right:5px; width:18px; height:24px" />최고 가치
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:30%" align="center">
							<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player4[0].player_no}">
								<img src="${pageContext.request.contextPath}/img/player_img.do?no=${info.player4[0].player_no}" style="width:120px; height:120px"/>
							</a>
						</td>
						<td colspan="2" style="width:70%">
							<table class="table table-dark table-sm table-borderless" style="margin:auto;">
								<tr>
									<td>
										<span class="small_span">선수명 : </span>
										<span style="font-size:large; font-weight:bold;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player4[0].player_no}" style="color:white;">${info.player4[0].player_name}</a>
										</span>
									</td>
								</tr>
								<tr>
									<td><span class="small_span">국적 : </span><img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.player4[0].country_no}" style="width:24px; height:16px"/><span style="margin-left:5px; font-size:small;">${info.player4[0].country_name}</span></td>
								</tr>
								<tr>
									<td><span class="small_span">나이 : </span>${info.player4[0].player_age}</td>
								</tr>
								<tr>
									<td><span class="small_span">포지션 : </span><span style="font-size:small;">${info.player4[0].player_position1} - ${info.player4[0].player_position2}</span></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="text-align:center;">가치</td>
						<td style="text-align:center;">$ ${info.player4[0].player_mv} Bill</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<thead>
					<tr>
						<td colspan="3" style="text-align:center;">
							<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="margin-right:5px; width:18px; height:24px" />최고 가치
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:30%" align="center">
							<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player4[1].player_no}">
								<img src="${pageContext.request.contextPath}/img/player_img.do?no=${info.player4[1].player_no}" style="width:120px; height:120px"/>
							</a>
						</td>
						<td colspan="2" style="width:70%">
							<table class="table table-dark table-sm table-borderless" style="margin:auto;">
								<tr>
									<td>
										<span class="small_span">선수명 : </span>
										<span style="font-size:large; font-weight:bold;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.player4[1].player_no}" style="color:white;">${info.player4[1].player_name}</a>
										</span>
									</td>
								</tr>
								<tr>
									<td><span class="small_span">국적 : </span><img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.player4[1].country_no}" style="width:24px; height:16px"/><span style="margin-left:5px; font-size:small;">${info.player4[1].country_name}</span></td>
								</tr>
								<tr>
									<td><span class="small_span">나이 : </span>${info.player4[1].player_age}</td>
								</tr>
								<tr>
									<td><span class="small_span">포지션 : </span><span style="font-size:small;">${info.player4[1].player_position1} - ${info.player4[1].player_position2}</span></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="text-align:center;">가치</td>
						<td style="text-align:center;">$ ${info.player4[1].player_mv} Bill</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
</div>

<jsp:include page="../footer.jsp"></jsp:include>
