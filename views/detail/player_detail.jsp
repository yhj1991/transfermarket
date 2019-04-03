<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<style>
.player_link {
	margin-left:15px;
	color:white;
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
		<table class="table table-dark">
			<tr>
				<td><a href="#선수정보" class="form-inline" style="color:white;">선수정보</a></td>
				<td><a href="#선수가치" class="form-inline player_link">선수가치</a></td>
				<!-- 
				<td><a href="#이적정보" class="form-inline player_link">이적정보</a></td>
				<td><a href="#수상내역" class="form-inline player_link">수상내역</a></td>
				<td><a href="#뉴스" class="form-inline player_link">뉴스</a></td>
				 -->
			</tr>
		</table>
	</div>

	<div class="player_div3">
		<table class="table table-sm table-dark">
				<tr>
					<td style="width:20%">국가</td>
					<td style="width:20%"><img src="${pageContext.request.contextPath}/img/country_img.do?no=${player.country_no}" style="width:24px; height:16px;"/> ${player.country_name}</td>
					<td style="text-align:center;"><span style="font-size:small; font-weight:bold;">포지션 : ${player.player_position1} - ${player.player_position2}</span></td>
					<td rowspan="9" style="width:40%"></td>
				</tr>
				<tr>
					<td>소속팀</td>
					<td><a href="${pageContext.request.contextPath}/detail/club.do?no=${player.club_no}"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${player.club_no}" style="width:18px; height:24px;"/> ${player.club_name}</a></td>
					<td rowspan="8" style="width:20%; border-top:none;">
						<img src="${pageContext.request.contextPath}/img/position_img.do?position2=${player.player_position2}" />
					</td>
				</tr>
				<tr>
					<td>등번호</td>
					<td>${player.player_backnum}</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>${player.player_birth}</td>
				</tr>
				<tr>
					<td>나이</td>
					<td>${player.player_age}</td>
				</tr>
				<tr>
					<td>키</td>
					<td>${player.player_height}</td>
				</tr>
				<tr>
					<td>가치</td>
					<td>${player.player_mv}</td>
				</tr>
				<tr>
					<td>사용하는 발</td>
					<td>${player.player_foot}</td>
				</tr>
		</table>
	</div>
	
	<div class="player_div4">
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

<jsp:include page="../footer.jsp"></jsp:include>