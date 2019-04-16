<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<style>
.table tr th {
	font-size:small;
	vertical-align:middle;
}
.table tr td {
	font-size:small;
	vertical-align:middle;
}
.continent_active {
	background-color:#81BEF7;
}
.matchlist_div,
.playerlist_div,
.matchlist_table tr,
.playerlist_table tr {
	max-height:275px;
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

<div class="container">
	<div class="row">
		
		<%-- 
			<table class="table table-dark table-sm">
				<tr>
					<td style="text-align:center; font-size:large; font-weight:bold;">리그 검색</td>
				</tr>
				<tr>
					<td>
						<div class="form-inline">
							<select id="sb_continent" class="form-control form-control-sm">
								<option value="0" selected>대륙을 선택하세요</option>
								<c:forEach var="continent" items="${continentList}">
									<option value="${continent.continent_no}">${continent.continent_name}</option>
								</c:forEach>
							</select>
							
							<select id="sb_country" class="form-control form-control-sm" style="margin-left:10px">
								<option value="0"  selected>국가를 선택하세요</option>
							</select>
							
							<select id="sb_league" name="no" class="form-control form-control-sm" style="margin-left:10px">
								<option value="0"  selected>리그를 선택하세요</option>
							</select>
							
							<input type="submit" class="btn btn-outline-light btn-sm" id="league_search_btn" style="margin-left:10px" value="검색" />
						</div>
					</td>
				</tr>
			</table>
			 --%>
		</form>
		
		<table class="table table-dark table-borderless table-sm">
			<tr>
				<td rowspan="2" style="width:15%" align="center">
					<img src="${pageContext.request.contextPath}/img/league_img.do?no=${league.league.league_no}" style="width:92px; height:120px"/>
				</td>
				<td style="vertical-align:bottom;">
					<div class="row">
						<img src="${pageContext.request.contextPath}/img/continent_img.do?no=${league.league.continent_no}" style="width:24px; height:24px;"/>
						<span style="margin-left:5px;">${league.league.continent_name}</span>
						<div style="width:30px;"></div>
						<img src="${pageContext.request.contextPath}/img/country_img.do?no=${league.league.country_no}" style="width:24px; height:18px"/>
						<span style="margin-left:5px;">${league.league.country_name}</span>
					</div>
				</td>
				<td style="text-align:center; font-size:large; font-weight:bold;">
					<div class="row justify-content-center" style="margin-left:20px;">리그 검색</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="row">
						<span style="font-size:x-large; font-weight:bold;">${league.league.league_name}</span>
					</div>
				</td>
				<td>
					<form id="league_search_form" action="${pageContext.request.contextPath}/detail/league.do" method="get" style="margin-bottom:0px;">
						<div class="row form-inline justify-content-end" style="margin-right:30px;">
							<select id="sb_continent" class="form-control form-control-sm">
								<option value="0" selected>대륙을 선택하세요</option>
								<c:forEach var="continent" items="${continentList}">
									<option value="${continent.continent_no}">${continent.continent_name}</option>
								</c:forEach>
							</select>
							
							<select id="sb_country" class="form-control form-control-sm" style="margin-left:10px">
								<option value="0"  selected>국가를 선택하세요</option>
							</select>
							
							<select id="sb_league" name="no" class="form-control form-control-sm" style="margin-left:10px">
								<option value="0"  selected>리그를 선택하세요</option>
							</select>
							
							<input type="submit" class="btn btn-outline-light btn-sm" id="league_search_btn" style="margin-left:10px" value="검색" />
						</div>
					</form>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="row">
		<table class="table table-dark table-sm">
			<tr>
				<td colspan="4" style="font-size:large;">소속 클럽</td>
			</tr>
			<tr>
				<th style="width:40%; text-align:center;">클럽</th>
				<th style="width:20%; text-align:center;">선수인원</th>
				<th style="width:20%; text-align:center;">평균나이</th>
				<th style="width:20%; text-align:center;">총 가치</th>
			</tr>
			<c:forEach var="clubs" items="${league.clubs}">
				<tr>
					<td>
						<a href="club.do?no=${clubs.club_no}" style="margin-left:5px">
							<img src="${pageContext.request.contextPath}/img/club_img.do?no=${clubs.club_no}" style="width:18px; height:24px" alt="${clubs.club_no}">
							<span style="margin-left:5px">${clubs.club_name}</span>
						</a>
					</td>
					<td style="text-align:center;">${clubs.players}</td>
					<td style="text-align:center;">${clubs.age}</td>
					<td style="text-align:center;">${clubs.mv}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	 
	 <div class="row">
		<div class="col-7 matchlist_div" style="padding-left:0px; padding-right:0px">
			<table class="table table-dark table-sm matchlist_table" style="margin-bottom:0px;">
				<tr>
					<th colspan="4" style="font-size:medium;">
						<img src="${pageContext.request.contextPath}/img/league_img.do?no=${league.league.league_no}" style="width:18px; height:24px"/>
						<span>${league.league.league_name} 경기일정</span>
					</th>
				</tr>
				<c:if test="${empty match}">
				<tr>
					<td colspan="4" style="font-size:medium; height:239px;">생성된 경기일정이 없습니다.</td>
				</tr>
				</c:if>
				<c:forEach var="match" items="${match}" varStatus="idx">
				<c:if test="${idx.index%3 == 0}">
					<tr>
						<td colspan="4" style="font-size:medium;">
							<fmt:formatNumber var="rounds" value="${idx.index/3+1}"/><span style="font-weight:bold;">${rounds} Rounds</span>
						</td> 
					</tr>
					<tr>
						<th style="width:14%">경기일</th>
						<th style="width:40%">홈</th>
						<th style="width:6%">시간</th>
						<th style="width:40%">어웨이</th>
					</tr>
				</c:if>
				<tr>
					<td>${match.match_date}</td>
					<td>
						<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="width:18px; height:24px;" />
						<span style="margin-left:5px;">${match.home_name}</span>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/detail/match.do?no=${match.match_no}">${match.match_kickoff}</a>
					</td>
					<td>
						<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="width:18px; height:24px;" />
						<span style="margin-left:5px;">${match.away_name}</span>
					</td>
				</tr>	
				</c:forEach>
			</table>
		</div>
		<div class="col-5" style="height:300px; padding-right:0px;">
			<table class="table table-dark table-sm clublist_table">
				<tr>
					<th colspan="7" style="font-size:medium;">
						<img src="${pageContext.request.contextPath}/img/league_img.do?no=${league.league.league_no}" style="width:18px; height:24px"/>
						<span>${league.league.league_name} 클럽순위</span>
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
				<c:forEach var="rank" items="${league.rank}" varStatus="idx">
					<tr>
						<td style="text-align:center;">${idx.count}</td>
						<td style="text-align:left;">
							<a href="${pageContext.request.contextPath}/detail/club.do?no=${rank.club_no}" style="margin-left:5px;">
								<img src="${pageContext.request.contextPath}/img/club_img.do?no=${rank.club_no}" style="width:18px; height:24px; margin-right:5px"/>
								<span>${rank.club_name}</span>
							</a>
						</td>
						<td>${rank.attempts}</td>
						<td>${rank.win}</td>
						<td>${rank.draw}</td>
						<td>${rank.lose}</td>
						<td>${rank.vp}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	<div class="row">
		<div class="col playerlist_div" style="padding:0px">
			<table class="table table-dark table-sm playerlist_table" style="margin-bottom:0px">
				<tr>
					<td colspan="4" style="font-size:large;">득점 순위</td>
				</tr>
				<tr>
					<th style="text-align:center; width:10%">순위</th>
					<th style="text-align:center; width:60%">선수/클럽</th>
					<th style="text-align:center; width:15%">경기수</th>
					<th style="text-align:center; width:15%">득점</th>
				</tr>
				<c:if test="${empty league.goal}">
					<tr>
						<td colspan="4" style="text-align:center; font-size:large; font-weight:bold;">등록된 선수가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty league.goal}">
				<c:forEach var="goal" items="${league.goal}" varStatus="idx">
					<tr>
						<td style="text-align:center; font-size:medium; font-weight:bold;">${idx.count}</td>
						<td style="padding:0px">
							<table class="table table-sm table-dark table-borderless" style="margin:auto; padding:0px; height:24px;">
								<tr>
									<td rowspan="2" style="width:30px;">
										<a href="${pageContext.request.contextPath}/detail/player.do?no=${goal.player_no}">
											<img src="${pageContext.request.contextPath}/img/player_img.do?no=${goal.player_no}" style="width:25px; height:25px;" />
										</a>
									</td>
									<td>
										<a href="${pageContext.request.contextPath}/detail/player.do?no=${goal.player_no}">
											<span>${goal.player_name}</span>
										</a>
									</td>
								</tr>
								<tr>
									<td>
										<a href="${pageContext.request.contextPath}/detail/club.do?no=${goal.club_no}">
											<img src="${pageContext.request.contextPath}/img/club_img.do?no=${goal.club_no}" style="width:18px; height:24px;" />
											<span>${goal.club_name}</span>
										</a>
									</td>
								</tr>
							</table>
						</td>
						<td style="text-align:center; font-size:medium; font-weight:bold;">${goal.attempts}</td>
						<td style="text-align:center; font-size:medium; font-weight:bold;">${goal.goal}</td>
					</tr>
				</c:forEach>
				</c:if>
			</table>
		</div>
		<div style="width:3px;"></div>
		<div class="col playerlist_div" style="padding:0px;">
			<table class="table table-dark table-sm playerlist_table" style="margin-bottom:0px;">
				<tr>
					<td colspan="4" style="font-size:large;">도움 순위</td>
				</tr>
				<tr>
					<th style="text-align:center; width:10%">순위</th>
					<th style="text-align:center; width:60%">선수/클럽</th>
					<th style="text-align:center; width:15%">경기수</th>
					<th style="text-align:center; width:15%">도움</th>
				</tr>
				<c:if test="${empty league.assist}">
					<tr>
						<td colspan="4" style="text-align:center; font-size:large; font-weight:bold;">등록된 선수가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty league.assist}">
				<c:forEach var="assist" items="${league.assist}" varStatus="idx">
					<tr>
						<td style="text-align:center; font-size:medium; font-weight:bold;">${idx.count}</td>
						<td style="padding:0px">
							<table class="table table-sm table-dark table-borderless" style="margin:auto; padding:0px; height:24px;">
								<tr>
									<td rowspan="2" style="width:30px;">
										<a href="${pageContext.request.contextPath}/detail/player.do?no=${assist.player_no}">
											<img src="${pageContext.request.contextPath}/img/player_img.do?no=${assist.player_no}" style="width:25px; height:25px;" />
										</a>
									</td>
									<td>
										<a href="${pageContext.request.contextPath}/detail/player.do?no=${assist.player_no}">
											<span>${assist.player_name}</span>
										</a>
									</td>
								</tr>
								<tr>
									<td>
										<a href="${pageContext.request.contextPath}/detail/club.do?no=${assist.club_no}">
											<img src="${pageContext.request.contextPath}/img/club_img.do?no=${assist.club_no}" style="width:18px; height:24px;" />
											<span>${assist.club_name}</span>
										</a>
									</td>
								</tr>
							</table>
						</td>
						<td style="text-align:center; font-size:medium; font-weight:bold;">${assist.attempts}</td>
						<td style="text-align:center; font-size:medium; font-weight:bold;">${assist.assist}</td>
					</tr>
				</c:forEach>
				</c:if>
			</table>
		</div>
		<div style="width:3px;"></div>
		<div class="col playerlist_div" style="padding:0px;">
			<table class="table table-dark table-sm playerlist_table" style="margin-bottom:0px;">
				<tr>
					<td colspan="4" style="font-size:large;">선수가치 순위 (Bill)</td>
				</tr>
				<tr>
					<th style="text-align:center; width:10%">순위</th>
					<th style="text-align:center; width:60%">선수/클럽</th>
					<th style="text-align:center; width:15%">국적</th>
					<th style="text-align:center; width:15%">가치</th>
				</tr>
				<c:if test="${empty league.mv}">
					<tr>
						<td colspan="4" style="text-align:center; font-size:large; font-weight:bold;">등록된 선수가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty league.mv}">
				<c:forEach var="mv" items="${league.mv}" varStatus="idx">
					<tr>
						<td style="text-align:center; font-size:medium; font-weight:bold;">${idx.count}</td>
						<td style="padding:0px">
							<table class="table table-sm table-dark table-borderless" style="margin:auto; padding:0px; height:24px;">
								<tr>
									<td rowspan="2" style="width:30px;">
										<a href="${pageContext.request.contextPath}/detail/player.do?no=${mv.player_no}">
											<img src="${pageContext.request.contextPath}/img/player_img.do?no=${mv.player_no}" style="width:25px; height:25px;" />
										</a>
									</td>
									<td>
										<a href="${pageContext.request.contextPath}/detail/player.do?no=${mv.player_no}">
											<span>${mv.player_name}</span>
										</a>
									</td>
								</tr>
								<tr>
									<td>
										<a href="${pageContext.request.contextPath}/detail/club.do?no=${mv.club_no}">
											<img src="${pageContext.request.contextPath}/img/club_img.do?no=${mv.club_no}" style="width:18px; height:24px;" />
											<span>${mv.club_name}</span>
										</a>
									</td>
								</tr>
							</table>
						</td>
						<td style="text-align:center;">
							<img src="${pageContext.request.contextPath}/img/country_img.do?no=${mv.country_no}" style="width:24px; height:18px;" />
						</td>
						<td style="text-align:center; font-size:medium; font-weight:bold;">${mv.player_mv}</
					</tr>
				</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
	<div style="height:50px;"></div>
</div>

<script>
$(function(){
	// 대륙 선택시
	$('#sb_continent').change(function(){
		$('#sb_country').empty();
		var no = $('#sb_continent').val();
		if(no == 0){
			$('#sb_league').empty();
			$('#sb_country').append(
				'<option value="0" selected>국가를 선택하세요</option>'
			);
			$('#sb_league').append(
				'<option value="0" selected>리그를 선택하세요</option>'
			);
		}
		else {
			$.post('rest_sb_countrylist.json', {no : no}, function(data){
				var len = data.countryList.length;
				$('#sb_country').append(
					'<option value="0" selected>국가를 선택하세요</option>'
				);
				$('#sb_league').append(
					'<option value="0" selected>리그를 선택하세요</option>'
				);
				for(var i = 0; i < len; i++){
					$('#sb_country').append(
						'<option value="' + data.countryList[i].country_no + '">' + data.countryList[i].country_name + '</option>'		
					);
				}
			});
		}
	});
	
	// 국가 선택시
	$('#sb_country').change(function(){
		$('#sb_league').empty();
		var no = $('#sb_country').val();
		if(no == 0){
			$('#sb_league').append(
				'<option value="0" selected>리그를 선택하세요</option>'
			);
		}
		else {
			$.post('rest_sb_leaguelist.json', {no : no}, function(data){
				var len = data.leagueList.length;
				if(len == 0){
					alert('해당하는 국가의 리그가 없습니다. 다른 국가를 선택해주세요.');
					$('#sb_league').append(
						'<option value="0" selected>리그를 선택하세요</option>'
					);
				}
				else{
					$('#sb_league').append(
						'<option value="0" selected>리그를 선택하세요</option>'
					);
					for(var i = 0; i < len; i++){
						$('#sb_league').append(
							'<option value="' + data.leagueList[i].league_no + '">' + data.leagueList[i].league_name + '</option>'		
						);
					}
				}
			});
		}
	});
	
	// 검색
	$('#league_search_btn').click(function(){
		var no = $('#sb_league').val();
		if(no == 0){
			alert('리그를 선택해주세요.');
			return false;
		}
		else {
			$('#league_search_form').submit();
		}
	});
	
});
</script>
<jsp:include page="../footer.jsp"></jsp:include>
