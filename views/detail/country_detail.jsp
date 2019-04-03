<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<jsp:include page="../header.jsp"></jsp:include>

<div style="height:30px"></div>
<!-- 
SELECT
	a.continent_no, a.country_no, a.country_name, b.league_no, b.league_name
FROM
	tm_country a
INNER JOIN
	tm_league b                                                      
ON
	a.country_no = b.country_no
WHERE
	a.continent_no = 1;

SELECT * FROM tm_league a
INNER JOIN (SELECT b.league_no, c.player_mv FROM tm_club b
			INNER JOIN tm_player c
            ON b.club_no = c.club_no
            ) aa
ON a.league_no = aa.league_no;


마지막으로 적은거
SELECT c.league_name, SUM(aa.players) player FROM tm_league c
INNER JOIN (SELECT a.league_no, a.club_name, COUNT(player_no) players FROM tm_club a
			INNER JOIN tm_player b
			ON a.club_no = b.club_no
             WHERE a.league_no = 9
			GROUP BY a.club_no
			) aa
ON c.league_no = aa.league_no;
 -->

<div class="container">
	<div>
		<table class="table table-dark">
			<tr>
				<td><img src="${pageContext.request.contextPath}/img/continent_img.do?no=${param.no}" style="width:65px; height:65px"/></td>
			</tr>
		</table>
	</div>

	<table class="table table-dark table-sm">
		<tr>
			<th style="width:25%">리그</th>
			<th style="width:20%">국가</th>
			<th style="width:15%; text-align:center;">클럽수</th>
			<th style="width:15%; text-align:center;">선수인원</th>
			<th style="width:15%; text-align:center;">평균나이</th>
			<th style="width:20%; text-align:center;">총 가치</th>
		</tr>
		<c:forEach var="cList" items="${continentList}">
			<tr>
				<td>
					<a href="#"><img src="${pageContext.request.contextPath}/img/league_img.do?no=${cList.league_no}" style="width:12px; height:7px" alt="${cList.league_name}"></a>
					<a href="#" style="color:white;">${cList.league_name}</a>
				</td>
				<td>
					<a href="#"><img src="${pageContext.request.contextPath}/img/country_img.do?no=${cList.country_no}" style="width:12px; height:7px"></a>
					<a href="#" style="color:white;">${cList.country_name}</a>
				</td>
				<td style="text-align:center;">${cList.clubs}</td>
				<td style="text-align:center;">${cList.players}</td>
				<td style="text-align:center;">${cList.totage}</td>
				<td style="text-align:center;">${cList.totmv}</td>
			</tr>
		</c:forEach>
	</table>
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
