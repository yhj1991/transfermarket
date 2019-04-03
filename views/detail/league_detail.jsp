<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</style>

<jsp:include page="../header.jsp"></jsp:include>

<div style="height:30px"></div>

<div class="container">
	<div>
		<form id="league_search_form" action="${pageContext.request.contextPath}/detail/league.do" method="get">
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
		</form>
	
		<table class="table table-dark">
			<tr>
				<td rowspan="4" style="width:15%" align="center">
					<img src="${pageContext.request.contextPath}/img/league_img.do?no=${param.no}" style="width:92px; height:120px"/>
				</td>
				<td>
					<img src="${pageContext.request.contextPath}/img/continent_img.do?no=${league.league.continent_no}" style="width:24px; height:24px;"/>
					<span>${league.league.continent_name}</span>
				</td>
			</tr>
			<tr>
				<td>
					<img src="${pageContext.request.contextPath}/img/country_img.do?no=${league.league.country_no}" style="width:24px; height:18px"/>
					<span>${league.league.country_name}</span>
				</td>
			</tr>
			<tr>
				<td>
					<span style="font-size:x-large; font-weight:bold;">${league.league.league_name}</span>
				</td>
			</tr>
		</table>
	</div>

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
	
	<div class="row">
		<div class="col">
			<table class="table table-dark table-sm">
				<tr>
					<td colspan="4" style="font-size:large;">클럽 순위</td>
				</tr>
				<tr>
					<th style="text-align:center; width:10%">순위</th>
					<th style="text-align:center;">클럽</th>
					<th style="text-align:center; width:12%">경기수</th>
					<th style="text-align:center; width:7%">승</th>
					<th style="text-align:center; width:7%">무</th>
					<th style="text-align:center; width:7%">패</th>
					<th style="text-align:center; width:10%">승점</th>
				</tr>
				<c:forEach var="rank" items="${league.rank}" varStatus="idx">
					<tr>
						<td style="text-align:center;">${idx.count}</td>
						<td>
							<a href="${pageContext.request.contextPath}/detail/club.do?no=${rank.club_no}">
								<img src="${pageContext.request.contextPath}/img/club_img.do?no=${rank.club_no}" style="width:18px; height:24px; margin-right:5px"/>
								<span>${rank.club_name}</span>
							</a>
						</td>
						<td style="text-align:center;">${rank.attempts}</td>
						<td style="text-align:center;">${rank.win}</td>
						<td style="text-align:center;">${rank.draw}</td>
						<td style="text-align:center;">${rank.lose}</td>
						<td style="text-align:center;">${rank.vp}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="col">
			<table class="table table-dark table-sm">
				<tr>
					<td colspan="4" style="font-size:large;">선수가치 순위</td>
				</tr>
				<tr>
					<th style="text-align:center; width:8%">순위</th>
					<th style="text-align:center; width:44%">선수/클럽</th>
					<th style="text-align:center; width:28%">국적</th>
					<th style="text-align:center; width:15%">가치(Bill)</th>
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
						<td>
							<table class="table table-sm table-dark table-borderless" style="margin:auto; height:24px">
								<tr>
									<td rowspan="2" style="width:70px">
										<a href="${pageContext.request.contextPath}/detail/player.do?no=${mv.player_no}">
											<img src="${pageContext.request.contextPath}/img/player_img.do?no=${mv.player_no}" style="width:45px; height:45px;" />
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
						<td>
							<img src="${pageContext.request.contextPath}/img/country_img.do?no=${mv.country_no}" style="width:24px; height:18px; margin-left:10px" />
							<span style="margin-left:5px">${mv.country_name}</span>
						</td>
						<td style="text-align:center; font-size:medium; font-weight:bold;">${mv.player_mv}</
					</tr>
				</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<table class="table table-dark table-sm">
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
									<td rowspan="2" style="width:70px">
										<a href="${pageContext.request.contextPath}/detail/player.do?no=${goal.player_no}">
											<img src="${pageContext.request.contextPath}/img/player_img.do?no=${goal.player_no}" style="width:45px; height:45px;" />
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
		
		<div class="col">
			<table class="table table-dark table-sm">
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
									<td rowspan="2" style="width:70px">
										<a href="${pageContext.request.contextPath}/detail/player.do?no=${assist.player_no}">
											<img src="${pageContext.request.contextPath}/img/player_img.do?no=${assist.player_no}" style="width:45px; height:45px;" />
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
	</div>
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
