<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<jsp:include page="../header.jsp"></jsp:include>

<div style="height:10px"></div>

<style>
.table tr th {
	font-size:small;
}
.table tr td {
	font-size:small;
}
</style>

<div style="height:20px"></div>
<form id="support_insert_form" action="insert.do" method="post">
	<div class="container">
		<table class="table table-sm table-dark table-borderless">
			<tr>
				<th><h4 style="text-align: center;">고객센터 글쓰기</h4></th>
			</tr>
			<tr>
				<td>
					<select id="category" name="category" class="form-control form-control-sm" style="width:200px">
						<option value="0">카테고리</option>
						<c:forEach var="category" items="${category}">
							<option value="${category.category_no}" >${category.category_name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="title" name="title" class="form-control form-control-sm" placeholder="제목을 입력해주세요."/>
				</td>
			</tr>
			<tr>
				<td>
					<textarea class="form-control form-control-sm" id="content" name="content" style="height:300px; resize:none;" placeholder="내용을 입력하세요."></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<div style="height:10px;"></div>
					<input type="button" class="btn btn-outline-light form-control" id="support_insert_btn" value="등록" />
				</td>
			</tr>
		</table>
	</div>
</form>

<script>
$(function(){
	// 등록
	$('#support_insert_btn').click(function(){
		var cate = $('#cate').val();
		var title = $('#title').val();
		var text = $('#content').val();
		if(cate == 0){
			alert("카테고리를 선택해주세요.");
			return false;
		}
		else if(!title){
			alert("제목을 입력해주세요.");
			return false;
		}
		else if(!text){
			alert("내용을 입력해주세요.");
			return false;
		}
		else{
			$('#support_insert_form').submit();
		}
	});
});
</script>

</body>
</html>	