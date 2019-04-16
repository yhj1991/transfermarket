<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<style>
.player_link {
	margin-left:15px;
	color:white;
}
.table-sm tr td {
	font-size:small;
	vertical-align:middle;
}
</style>
<jsp:include page="../header.jsp"></jsp:include>

<div class="container">
	<div class="player_div1">
		<table class="table table-dark table-borderless">
			<tr>
				<td rowspan="4" style="width:100px; height:100px">
					<img src="${pageContext.request.contextPath}/img/player_img.do?no=${player.player_no}"/>
				</td>
			</tr>
			<tr>
				<td><span style="font-size:xx-large; font-weight:bold;">${player.player_name}</span></td>
			</tr>
			<tr>
				<td><a href="${pageContext.request.contextPath}/detail/club.do?no=${player.club_no}"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${player.club_no}" style="width:18px; height:24px;"/> ${player.club_name}</a></td>
			</tr>
			<tr>
				<td>${player.player_position1} - ${player.player_position2}</td>
			</tr>
		</table>
	</div>
	
	<div class="player_div2">
		<table class="table table-sm table-dark table-bordered">
			<tr style="height:10%">
				<th colspan="6" style="font-size:x-large;">선수 정보</th>
			</tr>
			<tr style="height:10%">
				<td colspan="2" style="width:30%; text-align:center;"><span style="font-size:small; font-weight:bold;">상세정보</span></td>
				<td colspan="2" style="width:35%; text-align:center;"><span style="font-size:small; font-weight:bold;">포지션 : ${player.player_position1} - ${player.player_position2}</span></td>
				<td colspan="2" style="width:35%; text-align:center;"><span style="font-size:small; font-weight:bold;">선수 가치 (최근 4시즌) / 공격포인트 (최근 4시즌)</span></td>
			</tr>
			<tr style="height:10%">
				<td style="width:10%">국가</td>
				<td style="width:20%">
					<img src="${pageContext.request.contextPath}/img/country_img.do?no=${player.country_no}" style="width:24px; height:16px;"/> 
					<span style="margin-left:5px;">${player.country_name}</span>
				</td>
				<td colspan="2" rowspan="10" style="border-top:none; text-align:center;">
					<img src="${pageContext.request.contextPath}/img/position_img.do?position2=${player.player_position2}" />
				</td>
				<td colspan="2" rowspan="4" style="border-top:none; width:200px;">
					<canvas id="myChart1"></canvas>
				</td>
			</tr>
			<tr style="height:10%">
				<td>소속팀</td>
				<td>
					<a href="${pageContext.request.contextPath}/detail/club.do?no=${player.club_no}">
						<img src="${pageContext.request.contextPath}/img/club_img.do?no=${player.club_no}" style="width:18px; height:24px;"/>
						<span style="margin-left:5px;">${player.club_name}</span>
					</a>
				</td>
			</tr>
			<tr style="height:10%">
				<td>등번호</td>
				<td>${player.player_backnum}</td>
			</tr>
			<tr style="height:10%">
				<td>생년월일</td>
				<td>${player.player_birth}</td>
			</tr>
			<tr style="height:10%">
				<td>나이</td>
				<td>${player.player_age}</td>
				<td colspan="2" rowspan="4" style="border-top:none;">
					<canvas id="myChart2"></canvas>
				</td>
			</tr>
			<tr style="height:10%">
				<td>키</td>
				<td>${player.player_height}</td>
			</tr>
			<tr style="height:10%">
				<td>가치</td>
				<td>${player.player_mv}</td>
			</tr>
			<tr style="height:10%">
				<td>사용하는 발</td>
				<td>${player.player_foot}</td>
			</tr>
		</table>
	</div>
	
	<div class="player_div3">
		<table class="table table-dark">
			<tr>
				<td style="width:32%; text-align:center;">대회</td>
				<td style="width:17%; text-align:center;">경기수</td>
				<td style="width:17%; text-align:center;">득점</td>
				<td style="width:17%; text-align:center;">도움</td>
				<td style="width:17%; text-align:center;">분당 공격포인트</td>
			</tr>
			<tr>
				<td style="text-align:center;">UEFA 챔피언스리그</td>
				<td style="text-align:center;">6</td>
				<td style="text-align:center;">1</td>
				<td style="text-align:center;">2</td>
				<td style="text-align:center;">34(분)</td>
			</tr>
			<tr>
				<td style="text-align:center;">Laliga</td>
				<td style="text-align:center;">26</td>
				<td style="text-align:center;">2</td>
				<td style="text-align:center;">3</td>
				<td style="text-align:center;">51(분)</td>
			</tr>
		</table>
	</div>
</div>

<script>
$(function(){
	// Chart.defaults.line.spanGaps = true;
	// new Chart(document.getElementById('myChart'),{
	Chart.defaults.global.defaultFontColor = 'white';
	new Chart($('#myChart1'),{
		type : 'line',
		data : {
				labels : ['2016', '2017', '2018', '2019'],
				datasets : [{
								label : '선수 가치', 
								data : [3, 1, 4, 2], 
								fill : false, 
								borderColor : 'rgb(75, 192, 192)', 
								lineTension : 0.3
								}]
				},
		options : {
			maintainAspectRatio: false
		}
	});
	
	new Chart($('#myChart2'),{
		type : 'line',
		data : {
				labels : ['2016', '2017', '2018', '2019'],
				datasets : [{
								label : '공격포인트', 
								data : [68, 74, 63, 71], 
								fill : false, 
								borderColor : 'rgba(153, 102, 255, 1)', 
								lineTension : 0.3
								}]
				},
		options : {
			maintainAspectRatio: false
		}
	});
});
</script>

<jsp:include page="../footer.jsp"></jsp:include>