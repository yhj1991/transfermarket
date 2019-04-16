<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<style>
#memberlist_tbody td {
	font-size:small;
}
</style>

<h4 align="center">회원관리</h4>
<div style="height:20px"></div>
<table class="table table-sm table-dark" id="">
	<c:if test="${empty member.list}">
		<tr>
			<td colspan="${param.detail != 3 ? '9' : '10'}" style="text-align: center;">${param.detail != 3 ? '가입신청' : '차단'}중인 회원이 없습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${!empty member.list}">
		<thead>
			<tr>
				<td colspan="${param.detail == 2 ? '9' : '10'}">
					<div class="form-inline">
						<input type="text" class="form-control form-control-sm" id="search_mem_text" placeholder="아이디" />
						<input type="button" style="margin-left:5px"class="btn btn-light btn-sm" id="search_mem_btn" value="검색" />
					</div>
				</td>
			</tr>
			<tr>
				<th style="text-align: center; width:5%">#</th>
				<th style="text-align: center; width:13%">아이디</th>
				<th style="text-align: center; width:13%">이름</th>
				<th style="text-align: center; width:10%">전화</th>
				<th style="text-align: center;">이메일</th>
				<c:choose>
					<c:when test="${param.detail == 4}">
						<th style="text-align: center;">가입신청일</th>
					</c:when>
					<c:otherwise>
						<th style="text-align: center;">가입일</th>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${param.detail == 4}"></c:when>
					<c:otherwise>
						<c:if test="${param.detail != 2}">
							<th style="text-align: center;">차단일</th>
						</c:if>
					</c:otherwise>
				</c:choose>
				<th style="text-align: center; width:5%">등급</th>
				<th style="text-align: center; width:5%">상태</th> 
				<th style="text-align: center; width:5%">${param.detail == 4 ? '승인' : '차단'}</th>
			</tr>
		</thead>
		<tbody id="memberlist_tbody">
			<c:forEach var="list" items="${member.list}" varStatus="idx">
				<tr>
					<td style="text-align: center;">${idx.count}</td>
					<td style="text-align: center;" class="admin_mem_id">${list.mem_id}</td>
					<td style="text-align: center;">${list.mem_name}</td>
					<td style="text-align: center;">${list.mem_tel}</td>
					<td style="text-align: center;">${list.mem_email}</td>
					<td style="text-align: center;">${list.mem_date}</td>
					<c:choose>
						<c:when test="${param.detail == 4}"></c:when>
						<c:otherwise>
							<c:if test="${param.detail != 2}">
								<td style="text-align: center;">${list.block_date}</td>
							</c:if>
						</c:otherwise>
					</c:choose>
					<td style="text-align: center;">${list.authority}</td>
					<td style="text-align: center;">
						<c:if test="${list.enabled eq 1}">일반</c:if>
						<c:if test="${list.enabled ne 1}">${param.detail == 4 ? '미승인' : '차단'}</c:if>
					</td>
					<td style="text-align: center;">
						<c:if test="${list.enabled eq 1}">
							<input type="button" class="btn btn-light btn-sm admin_member_btn" value="차단" />
						</c:if>
						<c:if test="${list.enabled ne 1}">
							<input type="button" class="btn btn-light btn-sm admin_member_btn" value="${param.detail == 4 ? '승인' : '해제'}" />
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</c:if>
</table>

<script>
$(function(){
	$('#search_mem_btn').click(function(){
		var query = new URLSearchParams(window.location.search);
		var detail = query.get('detail');
		var colspan = 9;
		var text = $('#search_mem_text').val();
		if(detail == 3){
			colspan = 10;
		}
		
		$.post('rest_search_member.json', {text : text, detail : detail}, function(data){
			$('#memberlist_tbody').empty();
			var len = data.search.length;
			if(len > 0){
				for(var i = 0; i < len; i++){
					var block = data.search[i].block_date;
					if(!block){
						block = "";
					}
					else {
						block = data.search[i].block_date;
					}
					$('#memberlist_tbody').append(
							'<tr>'+
							'<td style="text-align: center;">' + data.search[i].rank + '</td>'+
								'<td style="text-align: center;" class="admin_mem_id">' + data.search[i].mem_id + '</td>'+
								'<td style="text-align: center;">' + data.search[i].mem_name + '</td>'+
								'<td style="text-align: center;">' + data.search[i].mem_tel + '</td>'+
								'<td style="text-align: center;">' + data.search[i].mem_email + '</td>'+
								'<td style="text-align: center;">' + data.search[i].mem_date + '</td>'+
								'<c:if test="${param.detail != 2}">'+
									'<td style="text-align: center;">' + block + '</td>'+
								'</c:if>'+
								'<td style="text-align: center;">' + data.search[i].authority + '</td>'+
								'<td style="text-align: center;">' + (data.search[i].enabled == 1 ? '일반' : '차단') + '</td>'+
								'<td style="text-align: center;">'+
								(data.search[i].enabled == 1 ? '<input type="button" class="btn btn-light btn-sm admin_member_btn" value="차단" />' : '<input type="button" class="btn btn-light btn-sm admin_member_btn" value="해제" />') +
								'</td>'+
							'</tr>'
					);
				}
			}
			else {
				$('#memberlist_tbody').append(
					'<tr>'+
						'<td colspan="' + colspan + '" style="text-align: center;">검색조건에 해당하는 회원이 없습니다.</td>'+
					'</tr>'
				);
			}
			
		},'json');
	});
	
	$(document).on('click', '.admin_member_btn', function(){
		var idx = $(this).index('.admin_member_btn');  
		var id = $('.admin_mem_id').eq(idx).text();
		var btn = $(this).val();
		if(btn == "차단"){
		$.post('rest_update_member_enabled.json', {id : id, btn : btn}, function(data){
			if(data.ret == 1){
				alert(id + ' 회원이 정지되었습니다.');
				window.location.reload();
			}
		});
		}
		else {
			$.post('rest_update_member_enabled.json', {id : id, btn : btn}, function(data){
				if(data.ret == 1){
					alert(id + ' 회원이 정지해제 되었습니다.');
					window.location.reload();
				}
			});
		}
	});
});
</script>