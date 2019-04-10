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

<sec:authentication property="principal.username" var="sec_id" />

<div style="height:20px"></div>
<div class="container">
	<form id="support_update_form" action="update.do" method="post">
		<table class="table table-dark table-bordered">
			<tr>
				<th colspan="2"><h4 style="text-align: center;">글 수정</h4></th>
			</tr>
			<tr>
				<td style="width:10%;">카테고리</td>
				<td>
					<select class="form-control form-control-sm" id="category" name="category" style="width:250px">
						<option value="0">카테고리</option>
						<c:forEach var="category" items="${category}">
							<option value="${category.category_no}" ${support.support_category == category.category_no ? 'selected' : ''}>${category.category_name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:10%;">글번호</td>
				<td style="font-weight:bold;">
					<input type="text" class="form-control form-control-sm" id="no" name="no" style="background-color:white;" value="${support.support_no}" readonly />
				</td>
			</tr>
			<tr>
				<td style="width:10%;">제목</td>
				<td style="font-weight:bold;">
					<input type="text" class="form-control form-control-sm" id="title" name="title" placeholder="제목을 입력하세요." value="${support.support_title}"/>
				</td>
			</tr>
			<tr>
				<td style="width:10%;">작성자</td>
				<td style="font-weight:bold;">
					<input type="text" class="form-control form-control-sm" style="background-color:white;"  value="${support.support_writer}" readonly />
				</td>
			</tr>
			<tr>
					<td style="width:10%; height:300px;">내용</td>
					<td style="font-size:medium;">
						<textarea class="form-control form-control-sm" id="content" name="content" placeholder="내용을 입력하세요." style="height:300px; resize:none;">${support.support_content}</textarea>
					</td>
				</tr>
				<tr>
					<td><a href="main.do" class="btn btn-outline-light form-control">취소</a></td>
					<td><input type="button" class="btn btn-outline-light form-control" id="support_update_btn" value="등록" /></td>
				</tr>
		</table>
	</form>
</div>

<script>
$(function(){
	$('#support_update_btn').click(function(){
		var cate = $('#category').val();
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
			$('#support_update_form').submit();
		}
	});
	
});
</script>
</body>
</html>	