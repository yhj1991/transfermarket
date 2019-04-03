<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
 
<div class="form-inline">
	<form id="continent_form" action="" method="get">
		<input type="hidden" name="menu" value="country" />
 	<select name="continent" class="form-control form-control-sm" id="continent_selectbox">
 		<option value="0">대륙</option>
	 		<c:forEach var="list" items="${continentList}">
	 			<option value="${list.continent_no}" ${list.continent_no eq param.continent ? "selected" : ""}>${list.continent_name}</option>
	 		</c:forEach>
 	</select>
</form>
</div>

<table class="table table-sm table-dark" style="margin-top:20px">
	<thead>
		<tr>
			<th>대륙</th>
			<th>국가</th>
		</tr>
	</thead>
	<tbody id="tbody">
		<c:forEach var="list" items="${list}">
		<tr>
			<td style="width:150px">
				<img src="${pageContext.request.contextPath}/img/continent_img.do?no=${list.continent_no}" style="width:12px; height:12px"/>
				<span style="margin-left:5px">${list.continent_name}</span>
			</td>
			<td style="width:250px">
				<img src="${pageContext.request.contextPath}/img/country_img.do?no=${list.country_no}" style="width:12px; height:7px"/>
				<span style="margin-left:5px">${list.country_name}</span>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

<script>
$(function(){
	
	$('#continent_selectbox').change(function(){
		$('#continent_form').submit();
	});
	
	$('#continent_selectbox').change(function(){
		var no = $('#continent_selectbox').val();
		if(no == 0){
			window.location.href='main.do?menu=country';
		}
		else{
			$('#tbody').empty();
			$.post('rest_country_selectbox.json', {no:no}, function(data){
				var len = data.searchList.length;
				for(var i = 0; i < len; i++){
					$('#tbody').append(
						'<tr>'+
			 				'<td><img src="${pageContext.request.contextPath}/img/continent_img.do?no=' + data.searchList[i].continent_no + '" style="width:12px; height:12px"/><span style="margin-left:5px">' + data.searchList[i].continent_name +'</span></td>'+
			 				'<td><img src="${pageContext.request.contextPath}/img/country_img.do?no=' + data.searchList[i].country_no + '" style="width:12px; height:7px"/><span style="margin-left:5px">' + data.searchList[i].country_name + '</span></td>'+
		 				'</tr>'
					);
				}
			},'json');
		}
	});
	
});
</script>