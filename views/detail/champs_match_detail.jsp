<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<jsp:include page="../header.jsp"></jsp:include>

<div style="height:30px"></div>
<div class="container">
	<table class="table table-bordered table-sm table-dark">
		<tr>
			<td rowspan="3" style="text-align:left; width:10%">
				<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="width:92px; height:120px"/>
			</td>
			<td rowspan="3" style="text-align:left; width:20%">
				<span style="font-size:small;">
					<img src="${pageContext.request.contextPath}/img/league_img.do?no=${match.home_league}" style="margin-right:5px; width:18px; height:24px"/>${match.home_league_name}
				</span>
				<br />${match.home_name}<br />
			</td>
			<td style="text-align:center; width:50%;"><span style="font-size:x-large; font-weight:bold;">UEFA 챔피언스 리그</span><br />
				<span style="font-size:small;">${match.match_date} (${match.week})</span>
			</td>
			<td rowspan="3" style="text-align:right; width:20%">
				<span style="font-size:small;">
					<img src="${pageContext.request.contextPath}/img/league_img.do?no=${match.away_league}" style="margin-right:5px; width:18px; height:24px"/>${match.away_league_name}
				</span>
				<br />${match.away_name}<br />
			</td>
			<td rowspan="3" style="text-align:right; width:10%">
				<img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="width:92px; height:120px"/>
			</td>
		</tr>
		<tr>
			<td style="text-align:center; border:none;"><h2>${match.match_kickoff}</h2></td>
		</tr>
		<tr>
			<td style="text-align:center;  border:none;">경기장<br /><span style="font-size:small;">${match.club_stadium}</span></td>
		</tr>
	</table>
	팀별 총 선수가치, 총 득점, 총 도움, 평균나이 비교 그래프 들어갈자리임
	<table class="table table-dark table-sm">
		<tr>
			<th>팀별 정보</th>
		</tr>
		<tr>
			<td colspan="2">home팀</td>
			<td colspan="2">away팀</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	
	<div class="row">
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<tr>
					<td colspan="7" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="margin-right:5px; width:18px; height:24px" />감독</td>
				</tr>
			</table>
		</div>
		
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<tr>
					<td colspan="7" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="margin-right:5px; width:18px; height:24px" />감독</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="row">
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<tr>
					<td colspan="7" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="margin-right:5px; width:18px; height:24px" />핵심 선수</td>
				</tr>
				<tr>
					<th style="text-align:center; width:40%">선수</th>
					<th style="text-align:center; width:10%">경기수</th>
					<th style="text-align:center; width:10%">득점</th>
					<th style="text-align:center; width:10%">도움</th>
				</tr>
			</table>
		</div>
		
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<tr>
					<td colspan="7" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="margin-right:5px; width:18px; height:24px" />핵심 선수</td>
				</tr>
				<tr>
					<th style="text-align:center; width:40%">선수</th>
					<th style="text-align:center; width:10%">경기수</th>
					<th style="text-align:center; width:10%">득점</th>
					<th style="text-align:center; width:10%">도움</th>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="row">
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<tr>
					<td colspan="7" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="margin-right:5px; width:18px; height:24px" />최다득점자</td>
				</tr>
				<tr>
					<th style="text-align:center; width:40%">선수</th>
					<th style="text-align:center; width:10%">경기수</th>
					<th style="text-align:center; width:10%">득점</th>
					<th style="text-align:center; width:10%">도움</th>
				</tr>
			</table>
		</div>
		
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<tr>
					<td colspan="7" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="margin-right:5px; width:18px; height:24px" />최다득점자</td>
				</tr>
				<tr>
					<th style="text-align:center; width:40%">선수</th>
					<th style="text-align:center; width:10%">경기수</th>
					<th style="text-align:center; width:10%">득점</th>
					<th style="text-align:center; width:10%">도움</th>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="row">
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<tr>
					<td colspan="7" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_home}" style="margin-right:5px; width:18px; height:24px" />최고가치 선수</td>
				</tr>
				<tr>
					<th style="text-align:center; width:40%">선수</th>
					<th style="text-align:center; width:30%">국적</th>
					<th style="text-align:center; width:30%">가치</th>
				</tr>
			</table>
		</div>
		
		<div class="col-6">
			<table class="table table-dark table-bordered table-sm">
				<tr>
					<td colspan="7" style="text-align:center;"><img src="${pageContext.request.contextPath}/img/club_img.do?no=${match.match_away}" style="margin-right:5px; width:18px; height:24px" />최고가치 선수</td>
				</tr>
				<tr>
					<th style="text-align:center; width:40%">선수</th>
					<th style="text-align:center; width:30%">국적</th>
					<th style="text-align:center; width:30%">가치</th>
				</tr>
			</table>
		</div>
	</div>
	
</div>

<script>
$(function(){
	// 대륙 선택시
	$('#continent').change(function(){
		var no = $('#continent').val();
		if(no == 0){
			$('#country').empty();
			$('#country').append(
				'<option value="0">국가</option>'		
			);
		}
		else {
			$.post('rest_detail_countrylist.json', {no : no}, function(data){
				$('#country').empty();
				var len = data.countryList.length;
				for(var i = 0; i < len; i++){
					$('#country').append(
						'<option value="' + data.countryList[i].country_no + '">' + data.countryList[i].country_name + '</option>'		
					);
				}
			});
		}
	});
	
	// 국가 선택시
	
	
	// 리그 선택시
});
</script>
<jsp:include page="../footer.jsp"></jsp:include>
