<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<style>
#playerlist_tbody td {
	font-size:small;
}
</style>

<c:if test="${param.detail == 1}">
	<table class="table table-sm table-dark">
		<thead>
			<tr>
				<td colspan="10">
					<div class="form-inline">
						<input type="text" class="form-control form-control-sm" id="player_search_text" placeholder="선수명" />
						<input type="button" style="margin-left:5px"class="btn btn-outline-light btn-sm" id="player_search_btn" value="검색" />
						<input type="button" style="margin-left:5px"class="btn btn-outline-light btn-sm" id="reset_search_btn" value="검색초기화" />
						<span style="margin-left:50px">국가별 선수목록 / 리그별 선수목록 / 클럽별 선수목록 조회 들어갈자리 / 정렬기준 (나이 / 가치 / 키 / 포지션)</span>
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align:center; width:5%">#</td>
				<td style="text-align:center; width:5%">국가</td>
				<td style="text-align:center; width:5%">소속팀</td>
				<td style="text-align:center; width:25%">선수명</td>
				<td style="text-align:center; width:8%">생년월일</td>
				<td style="text-align:center; width:8%">나이</td>
				<td style="text-align:center; width:8%">가치(Bill)</td>
				<td style="text-align:center; width:8%">키(cm)</td>
				<td style="text-align:center; width:20%">포지션</td>
				<td style="text-align:center; width:8%">주발</td>
			</tr>
		</thead>
		<tbody id="playerlist_tbody"></tbody>
	</table>
	<div class="row justify-content-center" style="margin-top:30px">
		<ul class="pagination-sm" id="pagination"></ul>
	</div>
</c:if>

<c:if test="${param.detail == 2}">
	<form id="insert_form" action="insert_player.do" method="post" enctype="multipart/form-data">
		<c:forEach begin="1" end="5" step="1">
			<div class="row justify-content-center insert_player_div">
				<c:forEach begin="1" end="2" step="1">
				<div class="col-md-6">
					<table class="table table-dark table-sm" style="width:100%">
				 		<tr>
				 			<td rowspan="2" style="width:15%; text-align:center; vertical-align:middle;">포지션</td>
					 		<td style="width:35%; text-align:center;">
				 				<select name="position1[]" class="form-control form-control-sm position1">
				 					<option value="0">Position1</option>
				 					<option disabled>-------------</option>
				 					<c:forEach var="position1" items="${position1List}">
				 						<option value="${position1.position1_name}">${position1.position1_name}</option>
				 					</c:forEach>
				 				</select>
					 		</td>
					 		<td rowspan="2"  style="width:15%; text-align:center; vertical-align:middle;">소속클럽</td>
					 		<td style="width:35%; text-align:center;">
					 			<select name="country[]" class="form-control form-control-sm country">
					 				<option value="0">Country</option>
					 				<optgroup label="---------- Europe --------------------------------------"></optgroup>
					 					<c:forEach var="country" items="${countryList}">
						 					<c:if test="${country.continent_no == 1}">
						 						<option value="${country.country_no}">${country.country_name}</option>
						 					</c:if>
					 					</c:forEach>
					 				<%-- 
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
					 				 --%>
					 			</select>
					 		</td>
					 	</tr>
					 	<tr>
					 		<td>
					 			<select name="position2[]" class="form-control form-control-sm position2">
				 					<option value="0">Position2</option>
				 					<option disabled>-------------</option>
				 				</select>
					 		</td>
					 		<td>
					 			<select name="club[]" class="form-control form-control-sm club">
					 				<option value="0">Club</option>
					 			</select>
					 		</td>
					 	</tr>
					 	<tr>
					 		<td style="text-align:center;">소속국가</td>
					 		<td style="text-align:center; overflow:visible;">
					 			<select name="player_country[]" class="form-control form-control-sm player_country">
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
					 		<td style="text-align:center;">선수이름</td>
					 		<td style="text-align:center;"><input type="text" name="name[]" class="form-control form-control-sm" placeholder="선수이름" /></td>
					 	</tr>
					 	<tr>
					 		<td style="text-align:center;">생년월일</td>
					 		<td style="text-align:center;"><input type="text" name="birth[]" class="form-control form-control-sm" placeholder="생년월일" /></td>
					 		<td style="text-align:center;">선수가치</td>
					 		<td style="text-align:center;"><input type="text" name="mv[]" class="form-control form-control-sm" placeholder="선수가치" /></td>
					 	</tr>
					 	<tr>
					 		<td style="text-align:center;">나이</td>
					 		<td style="text-align:center;"><input type="text" name="age[]" class="form-control form-control-sm" placeholder="나이" /></td>
					 		<td style="text-align:center;">키</td>
					 		<td style="text-align:center;"><input type="text" name="height[]" class="form-control form-control-sm" placeholder="키" /></td>
					 	</tr>
					 	<tr>
					 		<td style="text-align:center;">등번호</td>
					 		<td style="text-align:center;"><input type="text" name="backnum[]" class="form-control form-control-sm" placeholder="등번호" /></td>
					 		<td style="text-align:center;">사용하는 발</td>
					 		<td style="text-align:center;">
						 		<select name="foot[]" class="form-control form-control-sm">
						 			<option value="0">foot</option>
						 			<option disabled>-----------------------------------------------------</option>
						 			<option value="Left">Left</option>
						 			<option value="Right">Right</option>
						 			<option value="Both">Both</option>
						 		</select>
					 		</td>
					 	</tr>
					 	<tr>
					 		<td style="text-align:center;">선수이미지</td>
					 		<td colspan="2"><input type="file" name="file[]"/></td>
					 		<td><input type="submit" class="btn btn-outline-light form-control insert_btn" value="등록" /></td>
					 	</tr>
					 </table>
				</div>
				</c:forEach>
			</div>
		</c:forEach>
		<div style="height:30px"></div>
		<input type="submit" class="btn btn-dark form-control" value="전체등록" />
	</form>
</c:if>

<c:if test="${param.detail == 1}">
<script src="${pageContext.request.contextPath}/resources/twbsPagination/jquery.twbsPagination.min.js"></script>
<script>
$(function(){
	// pagination
	$('#pagination').twbsPagination({
		totalPages: '${totpage}',
		visiblePages: '${totpage < 5 ? totpage : 5}',
		next: '>',
		prev: '<',
		onPageClick: function (event, page) {
			$.post('rest_search_player.json', {page : page}, function(data){
				$('#playerlist_tbody').empty();
				var len = data.search.searchList.length;
				for(var i = 0; i < len; i++){
					$('#playerlist_tbody').append(
							'<tr>'+
								'<td style="text-align:center; vertical-align:middle;">' + data.search.searchList[i].rank + '</td>'+
								'<td style="text-align:center; vertical-align:middle;">'+
									'<img src="${pageContext.request.contextPath}/img/country_img.do?no=' + data.search.searchList[i].country_no + '" style="width:24px; height:16px;"/>'+
								'</td>'+
								'<td style="text-align:center; vertical-align:middle;">'+
									'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.search.searchList[i].club_no + '" style="width:18px; height:24px;"/>'+
								'</td>'+
								'<td style="vertical-align:middle;">'+
									'<label style="width:30px"></label>'+
									'<img src="${pageContext.request.contextPath}/img/player_img.do?no=' + data.search.searchList[i].player_no + '" style="width:24px; height:24px;"/>'+
									'<span style="margin-left:5px">' + data.search.searchList[i].player_name + '</span>'+
								'</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].player_birth + '</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].player_age + '</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].player_mv + '</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].player_height + '</td>'+
								'<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + data.search.searchList[i].player_position1 + ' - ' + data.search.searchList[i].player_position2 + '</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].player_foot + '</td>'+
							'</tr>'
					);
				}
			},'json');
		}
    });
	
	// 선수목록 검색 초기화
	$('#reset_search_btn').click(function(){
		window.location.reload();
	});
	
	// 선수목록 검색
	$('#player_search_btn').click(function(){
		var text = $('#player_search_text').val();
		$.post('rest_search_player.json', {text : text}, function(data){
			console.log(data);
			$('#playerlist_tbody').empty();
			var len = data.search.searchList.length;
			console.log(len);
			if(len == 0){
				$('#playerlist_tbody').append(
					'<tr>'+
						'<td colspan="10" style="text-align:center; font-size:x-large;">검색된 선수가 없습니다.</td>'+
					'</tr>'		
				);
			}
			else {
				for(var i = 0; i < len; i++){
					$('#playerlist_tbody').append(
							'<tr>'+
								'<td style="text-align:center; vertical-align:middle;">' + data.search.searchList[i].rank + '</td>'+
								'<td style="text-align:center; vertical-align:middle;">'+
									'<img src="${pageContext.request.contextPath}/img/country_img.do?no=' + data.search.searchList[i].country_no + '" style="width:24px; height:16px;"/>'+
								'</td>'+
								'<td style="text-align:center; vertical-align:middle;">'+
									'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.search.searchList[i].club_no + '" style="width:18px; height:24px;"/>'+
								'</td>'+
								'<td style="vertical-align:middle;">'+
									'<label style="width:30px"></label>'+
									'<img src="${pageContext.request.contextPath}/img/player_img.do?no=' + data.search.searchList[i].player_no + '" style="width:24px; height:24px;"/>'+
									'<span style="margin-left:5px">' + data.search.searchList[i].player_name + '</span>'+
								'</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].player_birth + '</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].player_age + '</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].player_mv + '</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].player_height + '</td>'+
								'<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + data.search.searchList[i].player_position1 + ' - ' + data.search.searchList[i].player_position2 + '</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].player_foot + '</td>'+
							'</tr>'	
					);
				}
				$('#pagination').twbsPagination('destroy');
		        $('#pagination').twbsPagination({
			       	totalPages: data.search.searchPage,
			   		visiblePages: data.search.searchPage < 5 ? data.search.searchPage : 5,
			   		next: '>',
			   		prev: '<',
			   		onPageClick: function (event, page) {
			   			$.post('rest_search_player.json', {text : text, page : page}, function(data){
			   				$('#playerlist_tbody').empty();
							var len = data.search.searchList.length;
							for(var i = 0; i < len; i++){
								$('#playerlist_tbody').append(
										'<tr>'+
											'<td style="text-align:center; vertical-align:middle;">' + data.search.searchList[i].rank + '</td>'+
											'<td style="text-align:center; vertical-align:middle;">'+
												'<img src="${pageContext.request.contextPath}/img/country_img.do?no=' + data.search.searchList[i].country_no + '" style="width:24px; height:16px;"/>'+
											'</td>'+
											'<td style="text-align:center; vertical-align:middle;">'+
												'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.search.searchList[i].club_no + '" style="width:18px; height:24px;"/>'+
											'</td>'+
											'<td style="vertical-align:middle;">'+
												'<label style="width:30px"></label>'+
												'<img src="${pageContext.request.contextPath}/img/player_img.do?no=' + data.search.searchList[i].player_no + '" style="width:24px; height:24px;"/>'+
												'<span style="margin-left:5px">' + data.search.searchList[i].player_name + '</span>'+
											'</td>'+
											'<td style="text-align:center;">' + data.search.searchList[i].player_birth + '</td>'+
											'<td style="text-align:center;">' + data.search.searchList[i].player_age + '</td>'+
											'<td style="text-align:center;">' + data.search.searchList[i].player_mv + '</td>'+
											'<td style="text-align:center;">' + data.search.searchList[i].player_height + '</td>'+
											'<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + data.search.searchList[i].player_position1 + ' - ' + data.search.searchList[i].player_position2 + '</td>'+
											'<td style="text-align:center;">' + data.search.searchList[i].player_foot + '</td>'+
										'</tr>'
								);
							}
						},'json');
			   		}
		        });
			}
		},'json');
	});
});
</script>
</c:if>


<c:if test="${param.detail == 2}">
<script>
$(function(){
	// 선수등록 국가목록
	$('.country').change(function(){
		var country = $(this).val();
		var idx = $(this).index('.country');
		if(country == 0){
			$('.club').eq(idx).empty();
			$('.club').eq(idx).append(
	 				'<option value="0">Club</option>'
			);
		}
		else{
			$.post('rest_country_club.json', {country : country}, function(data){
				$('.club').eq(idx).empty();
				var len = data.clubList.length;
				for(var i = 0; i < len; i++){
					$('.club').eq(idx).append(
						'<option value="' + data.clubList[i].club_no + '">' + data.clubList[i].club_name + '</option>'		
					);
				}
			});
		}
	});
	
	// 선수등록 포지션2 활성화
	$('.position1').change(function(){
		var position1 = $(this).val();
		var idx = $(this).index('.position1');
		if(position1 == 0){
			$('.position2').eq(idx).empty();
			$('.position2').eq(idx).append(
					'<option value="0">Position2</option>'+
 					'<option disabled>-------------</option>'
			);
		}
		else{
			$.post('rest_player_position2.json', {position1 : position1}, function(data){
				$('.position2').eq(idx).empty();
				var len = data.position2List.length;
				for(var i = 0; i < len; i++){
					$('.position2').eq(idx).append(
						'<option value="' + data.position2List[i].position2_name + '">' + data.position2List[i].position2_name + '</option>'		
					);
				}
			});
		}
	});
});
</script>
</c:if>
