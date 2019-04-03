<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 
<div class="container">
<h4>리그등록</h4>
	<form id="form" action="league.do" method="post" enctype="multipart/form-data">
		<div id="league_box">
			<div class="form-inline">
				<input type="button" class="btn btn-dark btn-sm delete_league_box" value="X" />&nbsp;
				<input type="text" name="country[]" class="form-control form-control-sm" placeholder="국가코드" />
				<input type="text" name="name[]" class="form-control form-control-sm" placeholder="국가명" />
				<input type="file" name="file[]"/>
			</div>
		</div>
		<div style="margin-top:20px">
			<input type="submit" class="btn btn-dark" value="등록" />
			<input type="button" class="btn btn-dark" id="insert_league_box" value="추가" />
		</div>
	</form>
</div>
 -->
 
<div class="form-inline">
	<form id="continent_form" action="" method="get">
			<input type="hidden" name="menu" value="league" />
			<input type="hidden" name="boxnum" value="1" />
	 	<select name="continent" class="form-control form-control-sm" id="continent_selectbox">
	 		<option value="0">대륙</option>
		 		<c:forEach var="list" items="${continentList}">
		 			<option value="${list.continent_no}" ${list.continent_no eq param.continent ? "selected" : ""}>${list.continent_name}</option>
		 		</c:forEach>
	 	</select>
	</form>

	<form id="country_form" action="" method="get">
		<input type="hidden" name="menu" value="league" />
		<input type="hidden" name="boxnum" value="2" />
	 	<select name="country"  style="margin-left:5px" class="form-control form-control-sm" id="country_selectbox">
	 		<option value="0">국가</option>
	 			<c:forEach var="list" items="${countryList}">
		 			<option value="${list.country_no}">${list.country_name}</option>
		 		</c:forEach>
	 	</select>
 	</form>
</div>

<table class="table table-sm table-dark" style="margin-top:20px">
	<thead>
		<tr>
			<th>대륙</th>
			<th>국가</th>
			<th>리그</th>
		</tr>
	</thead>
	<tbody id="tbody">
		<c:forEach var="list" items="${list}">
		<tr>
			<td><img src="${pageContext.request.contextPath}/img/continent_img.do?no=${list.continent_no}" style="width:12px; height:12px"/><span style="margin-left:5px">${list.continent_name}</span></td>
			<td><img src="${pageContext.request.contextPath}/img/country_img.do?no=${list.country_no}" style="width:12px; height:7px"/><span style="margin-left:5px">${list.country_name}</span></td>
			<td><img src="${pageContext.request.contextPath}/img/league_img.do?no=${list.league_no}" style="width:12px; height:7px"/><span style="margin-left:5px">${list.league_name}</span></td>
		</tr>
		</c:forEach>
	</tbody>
</table>

<script>
$(function(){
	
	$('#continent_selectbox').change(function(){
		$('#continent_form').submit();
	});
	
	$('#country_selectbox').change(function(){
		$('#country_form').submit();
	});
	
});
</script>