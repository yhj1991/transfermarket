<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

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

<jsp:include page="../header.jsp"></jsp:include>

<div style="height:30px"></div>

<div class="container">
	<form id="search_club_form" action="club_detail.do" method="get">
		<div class="form-inline">
		<select id="continent" class="form-control form-control-sm" style="height:40px">
			<option value="0">대륙</option>
			<c:forEach var="continent" items="${continentList}">
				<option value="${continent.continent_no}">${continent.continent_name}</option>
			</c:forEach>
		</select>
		
		<div style="width:10px"></div>
		
		<select id="country" class="form-control form-control-sm" style="height:40px">
			<option value="0">국가</option>
		</select>
		
		<div style="width:10px"></div>
		
		<select id="league" class="form-control form-control-sm" style="height:40px">
			<option value="0">리그</option>
		</select>
		
		<div style="width:10px"></div>
		
		<select name="no" id="club" class="form-control form-control-sm" style="height:40px">
			<option value="0">클럽</option>
		</select>
		
		<div style="width:10px"></div>
		
		<input type="submit" class="btn btn-dark" id="search_club_btn" value="검색" />
		</div>
	</form>
	
	<table class="table table-dark table-hover table-sm" style="margin-top:10px">
		<tr>
			<td style="width:150px"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${club.club_no}" id="club_img" alt="${club.club_no}" style="width:92px; height:120px"/></td>
			<td style="vertical-align:bottom;"><h1>${club.club_name}</h1></td>
		</tr>
		<tr>
			<td>소속리그</td>
			<td>
				<a href="${pageContext.request.contextPath}/detail/league.do?no=${club.league_no}">
					<img src="${pageContext.request.contextPath}/img/league_img.do?no=${club.league_no}" style="margin-right:5px; width:18px; height:24px"/>
					<span>${club.league_name}</span>
				</a>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${club.club_addr}</td>
		</tr>
		<tr>
			<td>전화</td>
			<td>${club.club_tel}</td>
		</tr>
		<tr>
			<td>팩스</td>
			<td>${club.club_fax}</td>
		</tr>
		<tr>
			<td>홈페이지</td>
			<td><a href="http://${club.club_page}" target="_blank">${club.club_page}</a></td>
		</tr>
		<tr>
			<td>경기장</td>
			<td>${club.club_stadium}</td>
		</tr>
		<tr>
			<td>창단일</td>
			<td>${club.club_founded}</td>
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
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${pList.player_no}" style="color:white;">${pList.player_name}</a>
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
								<span>$</span><span style="font-size:large; font-weight:bold; margin-left:5px">${pList.player_mv}</span><span style="margin-left:5px">Mill</span>
							</td>
						</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		
		<div class="col-5">
			<table class="table table-dark table-sm" style="margin-top:10px;">
				<thead>
					<tr>
						<th colspan="3" style="text-align:center; font-size:large;">감독</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:20%"><img src="${pageContext.request.contextPath}/img/coach_img.do?no=${info.coach.coach_no}" /></td>
						<td style="width:40%">
							<table class="table table-dark table-sm table-borderless" style="margin:auto;">
								<tr>
									<td><span class="small_span" style="font-weight:bold;">${info.coach.coach_name}</span></td>
								</tr>
								<tr>
									<td><img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.coach.country_no}" style="width:24px; height:16px;"/><span style="margin-left:5px; font-size:small;">${info.coach.country_name}</span></td>
								</tr>
								<tr>
									<td><span class="small_span">나이 : </span>${info.coach.coach_age}</td>
								</tr>
								<tr>
									<td><span class="small_span">선호 포메이션 : </span><br />${info.coach.coach_formation}</td>
								</tr>
							</table>
						</td>
						<td style="width:40%">
							<img src="${pageContext.request.contextPath}/img/formation_img.do?formation=${info.coach.coach_formation}"  style="width:150px; height:100px; margin-top:15px"/>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div style="height:6px"></div>
			
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
						<th colspan="3" style="text-align:center; font-size:large;">팀 내 최고가치</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:30%">
							<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.movalue.player_no}">
								<img src="${pageContext.request.contextPath}/img/player_img.do?no=${info.movalue.player_no}" />
							</a>
						</td>
						<td colspan="2" style="width:70%">
							<table class="table table-dark table-sm table-borderless" style="margin:auto;">
								<tr>
									<td>
										<span class="small_span">선수명 : </span>
										<span style="font-size:large; font-weight:bold;">
											<a href="${pageContext.request.contextPath}/detail/player.do?no=${info.movalue.player_no}" style="color:white;">${info.movalue.player_name}</a>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span class="small_span">국적 : </span><img src="${pageContext.request.contextPath}/img/country_img.do?no=${info.movalue.country_no}" style="width:24px; height:16px;"/>
										<span style="margin-left:5px; font-size:small;">${info.movalue.country_name}</span>
									</td>
								</tr>
								<tr>
									<td><span class="small_span">나이 : </span>${info.movalue.player_age}</td>
								</tr>
								<tr>
									<td><span class="small_span">포지션 : </span><span style="font-size:small;">${info.movalue.player_position1} - ${info.movalue.player_position2}</span></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="text-align:center;">가치</td>
						<td style="text-align:center;">$ ${info.movalue.player_mv} Bill</td>
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
						<td style="text-align:center;">2</td>
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
						<td style="text-align:center;">2</td>
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
				<td style="text-align:center; vertical-align:middle;">2</td>
				<td style="text-align:center; vertical-align:middle;">${point.goal}</td>
				<td style="text-align:center; vertical-align:middle;">${point.assist}</td>
				<td style="text-align:center; vertical-align:middle;">${point.point}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<script>
$(function(){
	$('#search_club_btn').click(function(){
		var no = $('#club').val();
		if(no == 0){
			alert('검색하실 클럽을 선택해주세요.');
			return false;
		}
		else {
			$('#search_club_form').submit();
		}
	});
	
	// SelectBox 대륙 선택
	$('#continent').change(function(){
		var no = $('#continent').val();
		if(no == 0){
			$('#country').empty();
			$('#country').append(
				'<option value="0">국가</option>'		
			);
		}
		else {
			$('#league').empty();
			$('#league').append(
				'<option value="0">리그</option>'		
			);
			$('#club').empty();
			$('#club').append(
				'<option value="0">클럽</option>'		
			);
			$.post('rest_sb_countrylist.json', {no : no}, function(data){
				$('#country').empty();
				$('#country').append(
						'<option value="0">국가</option>'		
				);
				var len = data.countryList.length;
				for(var i = 0; i < len; i++){
					$('#country').append(
						'<option value="' + data.countryList[i].country_no + '">' + data.countryList[i].country_name + '</option>'		
					);
				}
			});
		}
	});
	
	// SelectBox 국가 선택
	$('#country').change(function(){
		var no = $('#country').val();
		if(no == 0){
			$('#league').empty();
			$('#league').append(
				'<option value="0">리그</option>'		
			);
		}
		else {
			$.post('rest_sb_leaguelist.json', {no : no}, function(data){
				var len = data.leagueList.length;
				if(len == 0){
					alert('해당하는 국가의 리그가 없습니다. 다른 국가를 선택해주세요.');
					$('#league').empty();
					$('#league').append(
							'<option value="0">리그</option>'		
					);
				}
				else {
					$('#league').empty();
					$('#league').append(
							'<option value="0">리그</option>'		
					);
					for(var i = 0; i < len; i++){
						$('#league').append(
							'<option value="' + data.leagueList[i].league_no + '">' + data.leagueList[i].league_name + '</option>'		
						);
					}
				}
			});
		}
	});
	
	// SelectBox 리그 선택
	$('#league').change(function(){
		var no = $('#league').val();
		if(no == 0){
			$('#club').empty();
			$('#club').append(
				'<option value="0">클럽</option>'		
			);
		}
		else {
			$.post('rest_sb_clublist.json', {no : no}, function(data){
				$('#club').empty();
				$('#club').append(
						'<option value="0">클럽</option>'		
				);
				var len = data.clubList.length;
				for(var i = 0; i < len; i++){
					$('#club').append(
						'<option value="' + data.clubList[i].club_no + '">' + data.clubList[i].club_name + '</option>'		
					);
				}
			});
		}
	});
	
	$('#mv_btn').click(function(){
		event.preventDefault();
		var no = $('#club_img').attr('alt');
		var order = $(this).attr('value');
		if(order == 0){
			$('#playerlist_tbody').empty();
			$.post('rest_club_playerlist.json', {no : no, order : order}, function(data){
				var len = data.playerList.length;
				for(var i = 0; i < len; i++){
					$('#playerlist_tbody').append(
							'<tr>'+
								'<td align="center" >'+
									'<div class="uniform_div">'+
										'<span style="font-weight:bold; font-size:large;">' + data.playerList[i].player_backnum + '</span>'+
									'</div>'+
								'</td>'+
								'<td style="text-align:center;">'+
									'<table class="table table-dark table-sm table-borderless" style="margin:auto;">'+
										'<tr>'+
											'<td rowspan="2" style="width:40px">'+
												'<a href="${pageContext.request.contextPath}/player_detail.do?no=' + data.playerList[i].player_no + '">'+
													'<img src="${pageContext.request.contextPath}/img/player_img.do?no=' + data.playerList[i].player_no + '" style="width:40px; height:40px"/>'+
												'</a>'+
											'</td>'+
											'<td style="font-size:small;">'+
												'<a href="${pageContext.request.contextPath}/player_detail.do?no=' + data.playerList[i].player_no + '" style="color:white;">' + data.playerList[i].player_name + '</a>'+
											'</td>'+
										'</tr>'+
										'<tr>'+
											'<td style="font-size:small;">' + data.playerList[i].player_position1 + ' - ' + data.playerList[i].player_position2 + '</td>'+
										'</tr>'+
									'</table>'+
								'</td>'+
								'<td style="vertical-align:middle;">'+
									'<img src="${pageContext.request.contextPath}/img/country_img.do?no=' + data.playerList[i].country_no + '" />'+
									'<span style="font-size:small; margin-left:5px">' + data.playerList[i].country_name + '</span>'+
								'</td>'+
								'<td style="text-align:right; vertical-align:middle;">'+
									'<span>$</span>'+
									'<span style="font-size:large; font-weight:bold; margin-left:5px">' + data.playerList[i].player_mv + '</span>'+
									'<span style="margin-left:5px">Mill</span>'+
								'</td>'+
							'</tr>'		
					);
				}
			});
			$(this).attr('value', '1');
		}
		else if(order == 1){
			$('#playerlist_tbody').empty();
			$.post('rest_club_playerlist.json', {no : no, order : order}, function(data){
				var len = data.playerList.length;
				for(var i = 0; i < len; i++){
					$('#playerlist_tbody').append(
							'<tr>'+
								'<td align="center" >'+
									'<div class="uniform_div">'+
										'<span style="font-weight:bold; font-size:large;">' + data.playerList[i].player_backnum + '</span>'+
									'</div>'+
								'</td>'+
								'<td style="text-align:center;">'+
									'<table class="table table-dark table-sm table-borderless" style="margin:auto;">'+
										'<tr>'+
											'<td rowspan="2" style="width:40px">'+
												'<a href="${pageContext.request.contextPath}/player_detail.do?no=' + data.playerList[i].player_no + '">'+
													'<img src="${pageContext.request.contextPath}/img/player_img.do?no=' + data.playerList[i].player_no + '" style="width:40px; height:40px"/>'+
												'</a>'+
											'</td>'+
											'<td style="font-size:small;">'+
												'<a href="${pageContext.request.contextPath}/player_detail.do?no=' + data.playerList[i].player_no + '" style="color:white;">' + data.playerList[i].player_name + '</a>'+
											'</td>'+
										'</tr>'+
										'<tr>'+
											'<td style="font-size:small;">' + data.playerList[i].player_position1 + ' - ' + data.playerList[i].player_position2 + '</td>'+
										'</tr>'+
									'</table>'+
								'</td>'+
								'<td style="vertical-align:middle;">'+
									'<img src="${pageContext.request.contextPath}/img/country_img.do?no=' + data.playerList[i].country_no + '" />'+
									'<span style="font-size:small; margin-left:5px">' + data.playerList[i].country_name + '</span>'+
								'</td>'+
								'<td style="text-align:right; vertical-align:middle;">'+
									'<span>$</span>'+
									'<span style="font-size:large; font-weight:bold; margin-left:5px">' + data.playerList[i].player_mv + '</span>'+
									'<span style="margin-left:5px">Mill</span>'+
								'</td>'+
							'</tr>'		
					);
				}
			});
			$(this).attr('value', '0');
		}
		
	});
			
});
</script>

<jsp:include page="../footer.jsp"></jsp:include>
