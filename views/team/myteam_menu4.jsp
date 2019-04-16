<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>


<jsp:include page="team_header.jsp"></jsp:include>

<div style="height:30px"></div>

<style>
.table tr th {
	font-size:small;
}
.table tr td {
	font-size:small;
}
</style>

<div class="container">
	<div class="row">
		<div class="col">	
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
		</div>
			
		<div style="height:6px"></div>
			
		<div class="col">
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
