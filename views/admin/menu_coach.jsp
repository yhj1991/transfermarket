<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<style>
#coachlist_tbody {
	font-size:small;
}

.modal-coach-license {
	max-width:726px;
	min-width:726px;
}

.license_modal_div {
	display:table-cell;
	background-size:cover;
	background-image:url('${pageContext.request.contextPath}/resources/img/license.png');
	background-repeat:no-repeat;
	width:726px;
	height:472px;
}

.license_modal_country {
	position:absolute;
	left:285px;
	top:213px;
	font-size:large;
	color:white;
}

.license_modal_name {
	position:absolute;
	left:263px;
	top:239px;
	font-size:large;
	color:white;
}

.license_modal_birth {
	position:absolute;
	left:245px;
	top:263px;
	font-size:large;
	color:white;
}

.license_modal_acquire {
	position:absolute;
	left:275px;
	top:289px;
	font-size:large;
	color:white;
}

.license_modal_img {
	position:absolute;
	right:40px;
	top:193px;
}
</style>

<!-- 메뉴 = 감독 목록 -->
<c:if test="${param.detail == 1}">
	<table class="table table-sm table-dark">
		<thead>
			<tr>
				<td colspan="9">
					<div class="form-inline">
						<input type="text" class="form-control form-control-sm" id="coach_search_text" placeholder="감독명" />
						<input type="button" style="margin-left:5px"class="btn btn-outline-light btn-sm" id="coach_search_btn" value="검색" />
						<input type="button" style="margin-left:5px"class="btn btn-outline-light btn-sm" id="reset_search_btn" value="검색초기화" />
						<span style="margin-left:50px">국가별 감독목록 / 리그별 감독목록 / 클럽별 감독목록 조회 들어갈자리 / 정렬기준 (나이 / 가치 / 키 / 포지션)</span>
					</div>
				</td>
			</tr>
			<tr>
				<th style="text-align:center; width:3%">#</th>
				<th style="text-align:center; width:7%">라이센스</th>
				<th style="text-align:center; width:5%">국가</th>
				<th style="text-align:center; width:5%">소속팀</th>
				<th style="text-align:center; width:25%">감독명</th>
				<th style="text-align:center; width:10%">생년월일</th>
				<th style="text-align:center; width:10%">나이</th>
				<th style="text-align:center; width:20%">선호 포메이션</th>
				<th style="text-align:center; width:15%">등록일</th>
			</tr>
		</thead>
		<tbody id="coachlist_tbody"></tbody>
	</table>
	<div class="row justify-content-center" style="margin-top:30px">
		<ul class="pagination-sm" id="pagination"></ul>
	</div>
</c:if>

<!-- 라이센스 조회 Modal -->
<div class="modal fade" id="license_img_modal" tabindex="-1" role="dialog" aria-labelledby="licenseModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-coach-license" role="document">
		<div class="modal-content">
			<div class="license_modal_div"></div>
		</div>
	</div>
</div>

<!-- 메뉴 = 감독 등록 -->
<c:if test="${param.detail == 2}">
	<form id="insert_form" action="insert_coach.do" method="post" enctype="multipart/form-data">
		 <c:forEach begin="1" end="5" step="1">
			<div class="row justify-content-center insert_coach_div">
				<c:forEach begin="1" end="2" step="1">
				<div class="col-md-6">
					<table class="table table-dark table-sm" style="width:100%">
				 		<tr>
				 			<td style="width:15%; text-align:center; vertical-align:middle;">국가</td>
					 		<td style="width:35%; text-align:center;">
				 				<select name="coach_country[]" class="form-control form-control-sm coach_country">
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
					 		<td style="width:15%; text-align:center; vertical-align:middle;">감독명</td>
					 		<td style="width:35%; text-align:center;">
					 			<input type="text" name="name[]" class="form-control form-control-sm" placeholder="감독명" />
					 		</td>
					 	</tr>
					 	<tr>
					 		<td style="text-align:center;">생년월일</td>
					 		<td style="text-align:center;"><input type="text" name="birth[]" class="form-control form-control-sm" placeholder="생년월일" /></td>
					 		<td style="text-align:center;">나이</td>
					 		<td style="text-align:center;"><input type="text" name="age[]" class="form-control form-control-sm" placeholder="나이" /></td>
					 	</tr>
					 	<tr>
					 		<td style="text-align:center;">선호포메이션</td>
					 		<td colspan="3" style="text-align:center;">
					 			<select name="formation[]" class="form-control form-control-sm coach_country">
					 				<option value="0">Formation</option>
					 				<c:forEach var="formation" items="${formationList}">
					 					<option value="${formation.formation_name}">${formation.formation_name}</option>
					 				</c:forEach>
					 			</select>
					 		</td>
					 	</tr>
					 	<tr>
					 		<td style="text-align:center;">감독이미지</td>
					 		<td colspan="2"><input type="file" name="file[]" /></td>
					 		<td style="text-align:center;"><input type="submit" class="btn btn-outline-light form-control insert_btn" value="등록" /></td>
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
			$.post('rest_search_coach.json', {page : page}, function(data){
				$('#coachlist_tbody').empty();
				var len = data.search.searchList.length;
				for(var i = 0; i < len; i++){
					$('#coachlist_tbody').append(
						'<tr>'+
							'<td style="text-align:center; vertical-align:middle;">' + data.search.searchList[i].rank + '</td>'+
							'<td style="text-align:center; vertical-align:middle;">'+
								'<a href="#license_img_modal" style="color:white;" class="admin_coach_detail" data-toggle="modal" data-target="#license_img_modal">'+
									'<i class="fas fa-search-plus"></i>'+
								'</a>'+
							'</td>'+
							'<td style="text-align:center; vertical-align:middle;">'+
								'<img src="${pageContext.request.contextPath}/img/country_img.do?no=' + data.search.searchList[i].country_no + '" style="width:24px; height:16px;"/>'+
							'</td>'+
							'<td style="text-align:center; vertical-align:middle;">'+
								'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.search.searchList[i].club_no + '" style="width:18px; height:24px;"/>'+
							'</td>'+
							'<td style="vertical-align:middle;">'+
								'<label style="width:30px"></label>'+
								'<img src="${pageContext.request.contextPath}/img/coach_img.do?no=' + data.search.searchList[i].coach_no + '" style="width:24px; height:24px;" class="coach_no" alt="' + data.search.searchList[i].coach_no + '" />'+
								'<span style="margin-left:5px">' + data.search.searchList[i].coach_name + '</span>'+
							'</td>'+
							'<td style="text-align:center;">' + data.search.searchList[i].coach_birth + '</td>'+
							'<td style="text-align:center;">' + data.search.searchList[i].coach_age + '</td>'+
							'<td style="text-align:center;">' + data.search.searchList[i].coach_formation + '</td>'+
							'<td style="text-align:center;">' + data.search.searchList[i].coach_date + '</td>'+
						'</tr>'	
					);
				}
			},'json');
		}
    });
	
	// 검색초기화
	$('#reset_search_btn').click(function(){
		window.location.reload();
	});

	// 검색
	$('#coach_search_btn').click(function(){
		var text = $('#coach_search_text').val();
		$.post('rest_search_coach.json', {text : text}, function(data){
			$('#coachlist_tbody').empty();
			var len = data.search.searchList.length;
			if(len == 0){
				$('#coachlist_tbody').append(
					'<tr>'+
						'<td colspan="9" style="text-align:center; font-size:x-large;">검색된 감독이 없습니다.</td>'+
					'</tr>'		
				);
			}
			else {
				for(var i = 0; i < len; i++){
					$('#coachlist_tbody').append(
						'<tr>'+
							'<td style="text-align:center; vertical-align:middle;">' + data.search.searchList[i].rank + '</td>'+
							'<td style="text-align:center; vertical-align:middle;">'+
								'<a href="#license_img_modal" style="color:white;" class="admin_coach_detail" data-toggle="modal" data-target="#license_img_modal">'+
									'<i class="fas fa-search-plus"></i>'+
								'</a>'+
							'</td>'+
							'<td style="text-align:center; vertical-align:middle;">'+
								'<img src="${pageContext.request.contextPath}/img/country_img.do?no=' + data.search.searchList[i].country_no + '" style="width:24px; height:16px;"/>'+
							'</td>'+
							'<td style="text-align:center; vertical-align:middle;">'+
								'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.search.searchList[i].club_no + '" style="width:18px; height:24px;"/>'+
							'</td>'+
							'<td style="vertical-align:middle;">'+
								'<label style="width:30px"></label>'+
								'<img src="${pageContext.request.contextPath}/img/coach_img.do?no=' + data.search.searchList[i].coach_no + '" style="width:24px; height:24px;" class="coach_no" alt="' + data.search.searchList[i].coach_no + '" />'+
								'<span style="margin-left:5px">' + data.search.searchList[i].coach_name + '</span>'+
							'</td>'+
							'<td style="text-align:center;">' + data.search.searchList[i].coach_birth + '</td>'+
							'<td style="text-align:center;">' + data.search.searchList[i].coach_age + '</td>'+
							'<td style="text-align:center;">' + data.search.searchList[i].coach_formation + '</td>'+
							'<td style="text-align:center;">' + data.search.searchList[i].coach_date + '</td>'+
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
			   			$.post('rest_search_coach.json', {text : text, page : page}, function(data){
							$('#coachlist_tbody').empty();
							var len = data.search.searchList.length;
							for(var i = 0; i < len; i++){
								$('#coachlist_tbody').append(
									'<tr>'+
										'<td style="text-align:center; vertical-align:middle;">' + data.search.searchList[i].rank + '</td>'+
										'<td style="text-align:center; vertical-align:middle;">'+
											'<a href="#license_img_modal" style="color:white;" class="admin_coach_detail" data-toggle="modal" data-target="#license_img_modal">'+
												'<i class="fas fa-search-plus"></i>'+
											'</a>'+
										'</td>'+
										'<td style="text-align:center; vertical-align:middle;">'+
											'<img src="${pageContext.request.contextPath}/img/country_img.do?no=' + data.search.searchList[i].country_no + '" style="width:24px; height:16px;"/>'+
										'</td>'+
										'<td style="text-align:center; vertical-align:middle;">'+
											'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.search.searchList[i].club_no + '" style="width:18px; height:24px;"/>'+
										'</td>'+
										'<td style="vertical-align:middle;">'+
											'<label style="width:30px"></label>'+
											'<img src="${pageContext.request.contextPath}/img/coach_img.do?no=' + data.search.searchList[i].coach_no + '" style="width:24px; height:24px;" class="coach_no" alt="' + data.search.searchList[i].coach_no + '" />'+
											'<span style="margin-left:5px">' + data.search.searchList[i].coach_name + '</span>'+
										'</td>'+
										'<td style="text-align:center;">' + data.search.searchList[i].coach_birth + '</td>'+
										'<td style="text-align:center;">' + data.search.searchList[i].coach_age + '</td>'+
										'<td style="text-align:center;">' + data.search.searchList[i].coach_formation + '</td>'+
										'<td style="text-align:center;">' + data.search.searchList[i].coach_date + '</td>'+
									'</tr>'	
								);
							}
						},'json');
			   		}
	       		});
			}
		},'json');
	});
	
	// 라이센스 조회
	$(document).on('click', '.admin_coach_detail', function(){
		var idx = $(this).index('.admin_coach_detail');
		var no = $('.coach_no').eq(idx).attr('alt');
		$.post('rest_admin_coach_detail.json', {no : no}, function(data){
			$('.license_modal_div').empty();
			$('.license_modal_div').append(
					'<div class="license_modal_country">'+
						'<img src="${pageContext.request.contextPath}/img/country_img.do?no=' + data.coach.country_no + '" style="margin-right:5px; width:24px; height:16px;"/>' + data.coach.country_name +
					'</div>'+
					'<div class="license_modal_name">' + data.coach.coach_name + '</div>'+
					'<div class="license_modal_birth">' + data.coach.coach_birth + '</div>'+
					'<div class="license_modal_acquire">' + data.coach.coach_date + '</div>'+
					'<div class="license_modal_img">'+
						'<img src="${pageContext.request.contextPath}/img/coach_img.do?no=' + data.coach.coach_no + '"/>'+
					'</div>'
			);
		},'json');
	});
});
</script>
</c:if>

<c:if test="${param.detail == 2}">
<script>
$(function(){
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
			},'json');
		}
	});
	
});
</script>
</c:if>
