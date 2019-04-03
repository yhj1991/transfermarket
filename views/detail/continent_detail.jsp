<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<style>
.continent_active {
	background-color:#81BEF7;
}
</style>

<jsp:include page="../header.jsp"></jsp:include>

<div style="height:30px"></div>
 
<div class="container">
	<div class="form-inline" align="center">
	<c:forEach var="category" items="${category}">
		<div class="col-sm-2">
			<div>
				<a href="${pageContext.request.contextPath}/detail/continent.do?no=${category.continent_no}">
					<img src="${pageContext.request.contextPath}/img/continent_img.do?no=${category.continent_no}" style="width:65px; height:65px" alt="${category.continent_name}" />
				</a>
			</div>
			<div style="margin-top:3px" class="${category.continent_no == param.no ? "continent_active" : ""}"><span style="font-weight:bold;">${category.continent_name}</span></div>
		</div>
	</c:forEach>
	</div>
</div>

<div style="height:30px"></div>

<div class="container">

	<table class="table table-dark table-sm">
		<c:if test="${param.no ==2}">
		<tr>
			<th colspan="6" style="text-align:center; font-size:large;">아시아</th>
		</tr>
		</c:if>
		<tr>
			<th style="width:20%">국가</th>
			<th style="width:30%">리그</th>
			<th style="width:12%; text-align:center;">클럽수</th>
			<th style="width:12%; text-align:center;">선수인원</th>
			<th style="width:13%; text-align:center;">평균나이</th>
			<th style="width:13%; text-align:center;">총 가치(Bill)</th>
		</tr>
		<c:forEach var="cList" items="${continentList}">
			<tr>
				<td style="font-size:small;">
					<a href="${pageContext.request.contextPath}/detail/league.do?no=${cList.league_no}" style="color:white;">
						<img src="${pageContext.request.contextPath}/img/country_img.do?no=${cList.country_no}" style="width:24px; height:16px">
						<span>${cList.country_name}</span>
					</a>
				</td>
				<td style="font-size:small;">
					<a href="${pageContext.request.contextPath}/detail/league.do?no=${cList.league_no}" style="color:white;">
						<img src="${pageContext.request.contextPath}/img/league_img.do?no=${cList.league_no}" style="width:18px; height:24px" alt="${cList.league_name}">
						<span>${cList.league_name}</span>
					</a>
				</td>
				<td style="text-align:center; font-size:small;">${cList.clubs}</td>
				<td style="text-align:center; font-size:small;">${cList.players}</td>
				<td style="text-align:center; font-size:small;">${cList.player_age}</td>
				<td style="text-align:center; font-size:small;">${cList.player_mv}</td>
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
