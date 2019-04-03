<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- 
<div class="container">
<h4>클럽등록</h4>
	<form id="form" action="club.do" method="post" enctype="multipart/form-data">
		<div id="club_box">
			<div>
				<div class="row">
					<input type="button" class="btn btn-dark btn-sm delete_club_box" value="X" />&nbsp;
				</div>
				<div class="row form-inline" style="margin-top:5px">
					<input type="text" name="no[]" class="form-control form-control-sm" placeholder="리그코드" />&nbsp;
					<input type="text" name="name[]" class="form-control form-control-sm" placeholder="클럽명" />&nbsp;
					<input type="text" name="addr[]" class="form-control form-control-sm" placeholder="주소" />&nbsp;
					<input type="text" name="tel[]" class="form-control form-control-sm" placeholder="전화" />&nbsp;
				</div>
				<div class="row form-inline" style="margin-top:5px">
					<input type="text" name="fax[]" class="form-control form-control-sm" placeholder="팩스" />&nbsp;
					<input type="text" name="page[]" class="form-control form-control-sm" placeholder="홈페이지" />&nbsp;
					<input type="text" name="stadium[]" class="form-control form-control-sm" placeholder="홈구장" />&nbsp;
					<input type="text" name="founded[]" class="form-control form-control-sm" placeholder="창단일" />&nbsp;
					<input type="file" name="file[]"/>
				</div>
			</div>
		<div style="margin-top:20px">
			<input type="submit" class="btn btn-dark" value="등록" />
			<input type="button" class="btn btn-dark" id="insert_club_box" value="추가" />
		</div>
	</form>
</div>
<hr />
 -->
 
<form id="insert_form" action="update_club.do" method="post" enctype="multipart/form-data">
	 <c:forEach begin="1" end="21" step="1">
		<div class="row justify-content-center insert_coach_div">
			<c:forEach begin="1" end="2" step="1">
			<div class="col-md-6">
				<div id="collapse0">
				<table class="table table-dark table-sm" style="width:100%">
			 		<tr>
			 			<td style="width:15%; text-align:center; vertical-align:middle;">국가</td>
				 		<td style="width:35%; text-align:center;">
			 				<select class="form-control form-control-sm sb_country">
				 				<option value="0">Country</option>
				 				<optgroup label="---------- Europe --------------------------------------"></optgroup>
				 				<c:forEach var="country" items="${countryList}">
				 					<c:if test="${country.continent_no == 1}">
				 						<option value="${country.country_no}">${country.country_name}</option>
				 					</c:if>
				 				</c:forEach>
				 				<optgroup label="---------- Asia&Oceania ------------------------------"></optgroup>
				 					<c:forEach var="country" items="${countryList}">
				 					<c:if test="${country.continent_no == 2 || country.continent_no == 3}">
				 						<option value="${country.country_no}">${country.country_name}</option>
				 					</c:if>
				 				</c:forEach>
				 				<optgroup label="---------- South&North America ---------------------"></optgroup>
				 					<c:forEach var="country" items="${countryList}">
				 					<c:if test="${country.continent_no == 4 || country.continent_no == 5}">
				 						<option value="${country.country_no}">${country.country_name}</option>
				 					</c:if>
				 				</c:forEach>
				 				<optgroup label="---------- Africa ----------------------------------------"></optgroup>
				 					<c:forEach var="country" items="${countryList}">
				 					<c:if test="${country.continent_no == 6}">
				 						<option value="${country.country_no}">${country.country_name}</option>
				 					</c:if>
				 				</c:forEach>
				 			</select>
				 		</td>
				 		<td style="width:15%; text-align:center; vertical-align:middle;">클럽</td>
				 		<td style="width:35%; text-align:center;">
				 			<select name="club[]" class="form-control form-control-sm sb_club">
				 				<option value="0">Clubs</option>
				 			</select>
				 		</td>
				 	</tr>
				 	<tr>
				 		<td style="text-align:center;">클럽이미지</td>
				 		<td colspan="2"><input type="file" name="file[]" /></td>
				 		<td style="text-align:center;"><!-- <input type="submit" class="btn btn-outline-light form-control insert_btn" value="등록" /> --></td>
				 	</tr>
				 </table>
				 </div>
			</div>
			</c:forEach>
		</div>
	</c:forEach>
	<div style="height:30px"></div>
	<input type="submit" class="btn btn-dark form-control" value="전체등록" />
</form>
	
<script>
$(function(){
	// 선수등록 국가목록
	$('.sb_country').change(function(){
		var country = $(this).val();
		var idx = $(this).index('.sb_country');
		if(country == 0){
			$('.sb_club').eq(idx).empty();
			$('.sb_club').eq(idx).append(
	 				'<option value="0">Club</option>'
			);
		}
		else{
			$.post('rest_country_club.json', {country : country}, function(data){
				$('.sb_club').eq(idx).empty();
				var len = data.clubList.length;
				for(var i = 0; i < len; i++){
					$('.sb_club').eq(idx).append(
						'<option value="' + data.clubList[i].club_no + '">' + data.clubList[i].club_name + '</option>'		
					);
				}
			});
		}
	});
});
</script>