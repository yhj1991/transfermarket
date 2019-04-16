<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<style>
.match_table {
	 text-align:center;
	 vertical-align:middle;
}

</style>
<div class="container">
	<c:if test="${param.detail == 1}">
		<h3 style="text-align:center;">경기일정 관리 (리그)</h3>
		<table class="table table-dark table-bordered match_table" style="margin-top:30px">
			<tr>
				<td colspan="3"><input type="button" class="btn btn-light form-control" id="insert_match_btn" value="일정생성" /></td>
			</tr>
			<tr>
				<th style="font-weight:bold; font-size:small;">대륙</th>
				<th style="font-weight:bold; font-size:small;">국가</th>
				<th style="font-weight:bold; font-size:small;">리그</th>
			</tr>
			<tr>
				<td style="width:33%">
					<select id="continentList" class="form-control form-control-sm continent">
		 				<option value="0">Continent</option>
		 				<c:forEach var="continent" items="${continentList}">
	 						<option value="${continent.continent_no}">${continent.continent_name}</option>
		 				</c:forEach>
		 			</select>
				</td>
				<td style="width:33%">
					<select id="countryList" class="form-control form-control-sm">
						<option value="0">Country</option>
					</select>
				</td>
				<td style="width:34%">
					<select id="leagueList" class="form-control form-control-sm">
						<option value="0">League</option>
					</select>
				</td>
			</tr>
			<tr>
				<th style="font-weight:bold; font-size:small;">시즌 개막일</th>
				<th style="font-weight:bold; font-size:small;">시즌 개막시간</th>
				<th></th>
			</tr>
			<tr>
				<td><input type="date" id="matchdate" class="form-control form-control-sm" /></td>
				<td>
					<select id="kickoff" class="form-control form-control-sm" >
						<option value="0">개막시간</option>
						<option value="03:00">03:00</option>
						<option value="03:30">03:30</option>
						<option value="05:00">05:00</option>
						<option value="05:30">05:30</option>
						<option value="20:00">20:00</option>
						<option value="20:30">20:30</option>
					</select>
				</td>
				<td></td>
			</tr>
		</table>
		
		<table class="table table-dark table-bordered match_table" style="margin-top:30px">
			<thead>
				<tr>
					<th colspan="4" style="text-align:left; font-size:xx-large;">클럽목록</th>
				</tr>
				<tr>
					<th style="width:10%; font-weight:bold; font-size:small;">#</th>
					<th style="width:40%; font-weight:bold; font-size:small;">클럽</th>
					<th style="width:10%; font-weight:bold; font-size:small;">#</th>
					<th style="width:40%; font-weight:bold; font-size:small;">클럽</th>
				</tr>
			</thead>
			<tbody id="clubList_div"></tbody>
		</table>
	</c:if>

	<c:if test="${param.detail == 2}">
		<h3 style="text-align:center;">경기일정 관리 (챔피언스 리그)</h3>
		<table class="table table-dark table-bordered match_table" style="margin-top:30px">
			<tr>
				<td colspan="2"><input type="button" class="btn btn-light form-control" id="insert_match_btn" value="일정생성" /></td>
			</tr>
			<tr>
				<th style="font-weight:bold; font-size:small;">그룹별 조회</th>
				<th style="font-weight:bold; font-size:small;">국가</th>
			</tr>
			<tr>
				<td style="width:33%">
					<select id="groupList" class="form-control form-control-sm continent" style="margin-top:3px">
		 				<option selected disabled>ChampionsLeague Group</option>
		 				<option value="0">All Group</option>
		 				<c:forEach var="group" items="${champs.groupList}">
	 						<option value="${group.champs_group}">${group.champs_group}</option>
		 				</c:forEach>
		 			</select>
				</td>
				<td style="width:33%">
					<select id="countryList" class="form-control form-control-sm">
						<option value="0">Country</option>
					</select>
				</td>
			</tr>
			<tr>
				<th style="font-weight:bold; font-size:small;">시즌 개막일</th>
				<th style="font-weight:bold; font-size:small;">시즌 개막시간</th>
			</tr>
			<tr>
				<td><input type="date" id="matchdate" class="form-control form-control-sm" /></td>
				<td>
					<select id="kickoff" class="form-control form-control-sm" >
						<option value="0">개막시간</option>
						<option value="03:00">03:00</option>
						<option value="03:30">03:30</option>
						<option value="05:00">05:00</option>
						<option value="05:30">05:30</option>
						<option value="20:00">20:00</option>
						<option value="20:30">20:30</option>
					</select>
				</td>
			</tr>
		</table>
		
		<table class="table table-dark table-bordered match_table" style="margin-top:30px">
			<thead>
				<tr>
					<th colspan="4" style="text-align:left; font-size:xx-large;">클럽목록</th>
				</tr>
				<tr>
					<th style="width:10%; font-weight:bold; font-size:small;">#</th>
					<th style="width:40%; font-weight:bold; font-size:small;">클럽</th>
					<th style="width:10%; font-weight:bold; font-size:small;">#</th>
					<th style="width:40%; font-weight:bold; font-size:small;">클럽</th>
				</tr>
			</thead>
			<tbody id="champsList_div">
				<c:forEach var="group" items="${champs.groupList}">
					<tr>
						<td colspan="4" style="font-size:large; font-weight:bold;">${group.champs_group} 조</td>
					</tr>
					<c:forEach begin="0" end="${clubLength}" step="2" varStatus="idx">
						<c:if test="${group.champs_group == champs.clubList[idx.index].champs_group}">
							<tr>
								<td>${champs.clubList[idx.index].rank}</td>
								<td>
									<img src="${pageContext.request.contextPath}/img/club_img.do?no=${champs.clubList[idx.index].club_no}" style="margin-right:5px; width:18px; height:24px;" />
									${champs.clubList[idx.index].club_name}
								</td>
								<td>${champs.clubList[idx.index+1].rank}</td>
								<td>
									<img src="${pageContext.request.contextPath}/img/club_img.do?no=${champs.clubList[idx.index+1].club_no}" style="margin-right:5px; width:18px; height:24px;" />
									${champs.clubList[idx.index+1].club_name}
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</div>

<script>
$(function(){
	
	$('#insert_match_btn').click(function(){
		var len = $('.club_no').length;
		var clubno = new Array(len);
		var leagueno = $('#leagueList').val();
		var matchdate = $('#matchdate').val();
		var kickoff = $('#kickoff').val();
		if(len == 0){
			alert('조회된 팀이 없어 경기일정을 생성할 수 없습니다.');
			return false;
		}
		else {
			clubno = [];
			for(var i = 0; i < len; i++){
				clubno[i] = $('.club_no').eq(i).val();
			}
			var obj = clubno.reduce(function(o, val, currentIndex) { 
				o[currentIndex] = +val; 
				return o; 
				}, {});
			$.post('rest_insert_match.json', {clubno : JSON.stringify(obj), leagueno : leagueno, matchdate : matchdate, kickoff : kickoff}, function(data){
				if(data.ret > 0){
					alert('일정이 생성되었습니다.');
					window.location.reload();
				}
				else if(data.ret == 0){
					alert('잔여일정이 남아있어 경기를 생성할 수 없습니다.');
					window.location.reload();
				}
				else {
					alert('일정 생성에 실패했습니다.');
					window.location.reload();
				}
			},'json');
		}
	});
	
	
	$('#continentList').change(function(){
		var no = $(this).val();
		if(no == 0){
			$('#countryList').empty();
			$('#countryList').append(
				'<option value="0">Country</option>'		
			);
			$('#leagueList').empty();
			$('#leagueList').append(
				'<option value="0">Club</option>'		
			);
		}
		else {
			$.post('${pageContext.request.contextPath}/detail/rest_sb_countrylist.json', {no : no}, function(data){
				var len = data.countryList.length;
				$('#countryList').empty();
				$('#countryList').append(
					'<option value="0" selected disabled>국가를 선택하세요.</option>'		
				);
				for(var i = 0; i < len; i++){
					$('#countryList').append(
						'<option value="' + data.countryList[i].country_no + '">' + data.countryList[i].country_name + '</option>'
					);
				}
			});
		}
	});
	
	$('#countryList').change(function(){
		var no = $(this).val();
			$.post('${pageContext.request.contextPath}/detail/rest_sb_leaguelist.json', {no : no}, function(data){
				var len = data.leagueList.length;
				$('#leagueList').empty();
				$('#leagueList').append(
					'<option value="0" selected disabled>리그를 선택하세요.</option>'		
				);
				if(len == 0){
					alert('해당 국가에 소속된 클럽이 없습니다.');
					$('#countryList').val('0').prop('selected', true);
					return false;
				}
				for(var i = 0; i < len; i++){
					$('#leagueList').append(
						'<option value="' + data.leagueList[i].league_no + '">' + data.leagueList[i].league_name + '</option>'
					);
				}
			});
	});

	$('#leagueList').change(function(){
		var no = $(this).val();
		$.post('${pageContext.request.contextPath}/detail/rest_sb_clublist.json', {no : no}, function(data){
			var len = data.clubList.length;
			$('#clubList_div').empty();
			for(var i = 0; i < len/2; i++){
				$('#clubList_div').append(
					'<tr>'+
						'<td style="font-size:small;">' + ((i+1)*2-1) + '</td>'+
						'<td>'+
							'<input type="hidden" class="club_no" value="' + data.clubList[i].club_no + '" />' +
							'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.clubList[i].club_no + '" style="margin-right:5px; width:18px; height:24px;" />' + data.clubList[i].club_name +
						'</td>'+
						'<td style="font-size:small;">' + ((i+1)*2) + '</td>'+
						'<td>'+
							'<input type="hidden" class="club_no" value="' + data.clubList[i+3].club_no + '" />' +
							'<img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.clubList[i+3].club_no + '" style="margin-right:5px; width:18px; height:24px;" />' + data.clubList[i+3].club_name +
						'</td>'+
					'</tr>'
				);
			}
		});
	});
	
	$('#groupList').change(function(){
		var group = $(this).val();
		if(group == 0){
			window.location.reload();
		}
		else {
			$.post('rest_champs_group_clublist.json', {group : group}, function(data){
				
				$('#champsList_div').empty();
				var len = data.search.length;
				$('#champsList_div').append(
					'<tr>'+
						'<td colspan="4" style="font-size:large; font-weight:bold;">' + group + ' 조</td>'+
					'</tr>'
				);
				for(var j = 0; j < len/2; j++){
					$('#champsList_div').append(
						'<tr>'+
							'<td>' + data.search[j*2].rank + '</td>'+
							'<td><img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.search[j*2].club_no + '" style="margin-right:5px; width:18px; height:24px;" />' + data.search[j*2].club_name + '</td>'+
							'<td>' + data.search[(j*2)+1].rank + '</td>'+
							'<td><img src="${pageContext.request.contextPath}/img/club_img.do?no=' + data.search[(j*2)+1].club_no + '" style="margin-right:5px; width:18px; height:24px;" />' + data.search[(j*2)+1].club_name + '</td>'+
						'</tr>'
					);
				}
			});
		}
	});
	
});
</script>