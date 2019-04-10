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

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="sec_id" />
</sec:authorize>

<div style="height:20px"></div>
<div class="container">
	<table class="table table-dark table-bordered">
		<tr>
			<th colspan="2"><h4 style="text-align: center;">${support.support_title}</h4></th>
		</tr>
		<tr>
			<td colspan="2">
				<div class="row form-inline">
					<div class="col">
						<a href="main.do" class="btn btn-outline-light btn-sm" style="margin-right:10px;">게시판 홈</a>
						<c:if test="${prev != 0}">
							<a href="${pageContext.request.contextPath}/support/select.do?no=${prev}" class="btn btn-outline-light btn-sm" style="margin-right:5px;">이전글</a>
						</c:if>
						<c:if test="${next != 0}">
							<a href="${pageContext.request.contextPath}/support/select.do?no=${next}" class="btn btn-outline-light btn-sm">다음글</a>
						</c:if>
					</div>
					<div class="col" align="right">
						<c:if test="${sec_id eq support.support_writer}">
							<a href="${pageContext.request.contextPath}/support/update.do?no=${support.support_no}" class="btn btn-outline-light btn-sm">수정</a>
							<a href="${pageContext.request.contextPath}/support/delete.do?no=${support.support_no}" class="btn btn-outline-light btn-sm" style="margin-left:10px" onclick="confirm('정말 삭제하시겠습니까?')">삭제</a>
						</c:if>
					</div>
				</div>
				<div style="height:30px;"></div>
			</td>
		</tr>
		<tr>
			<td style="width:10%;">카테고리</td>
			<td style="font-weight:bold;">
				<span>${support.category_name}</span>
			</td>
		</tr>
		<tr>
			<td style="width:10%;">글번호</td>
			<td style="font-weight:bold;">
				<span id="support_no">${support.support_no}</span>
			</td>
		</tr>
		<tr>
			<td style="width:10%;">조회수</td>
			<td style="font-weight:bold;">
				<span>${support.support_hit}</span>
			</td>
		</tr>
		<tr>
			<td style="width:10%;">제목</td>
			<td style="font-weight:bold;">
				<span>${support.support_title}</span>
			</td>
		</tr>
		<tr>
			<td style="width:10%;">작성자</td>
			<td style="font-weight:bold;">
				<span>${support.support_writer}</span>
			</td>
		</tr>
		<tr>
			<td style="width:10%; height:300px;">내용</td>
			<td style="font-size:medium;">
				<span>${support.support_content}</span>
			</td>
		</tr>
	</table>
	
	<table class="table table-dark table-bordered">
		<thead>
			<tr>
				<td colspan="2">댓글</td>
			</tr>
		</thead>
		<tbody id="comment_tbody">
			<c:if test="${empty comment}">
				<tr>
					<td colspan="2" style="border:none; border-top:none; padding-left:15px; padding-bottom:10px">등록된 댓글이 없습니다. 댓글을 등록해보세요.</td>
				</tr>
			</c:if>
			<c:if test="${!empty comment}">
			<c:forEach var="comment" items="${comment}">
				<tr>
					<td colspan="2">
						<table class="table table-borderless table-dark comment_table" style="margin:auto; table-layout:fixed;">
							<tr>
								<td colspan="2" style="padding-bottom:0px; padding-top:0px">
									${comment.comment_depth > 0 ? '&nbsp;&nbsp;└>':''}
									<input type="hidden" class="comment_no" value="${comment.comment_no}" />
									<input type="hidden" class="comment_depth" value="${comment.comment_depth}" />
									<span style="font-weight:bold;" class="comment_writer">${comment.comment_writer}</span>
									<span style="margin-left:10px;">${comment.comment_date}</span>
									<sec:authorize access="isAuthenticated()">
										<span style="margin-left:10px;">
											<a href="#" class="recomment_btn">답댓글</a>
											<c:if test="${sec_id eq comment.comment_writer}">
												/ <a href="#" class="recomment_update_btn">수정</a>
												/ <a href="#" class="recomment_delete_btn">삭제</a>
											</c:if>
										</span>
									</sec:authorize>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="overflow:hidden; word-wrap:break-word;">
								<c:if test="${comment.comment_depth == 0}">
									<span>${comment.comment_text}</span>
								</c:if>
								<c:if test="${comment.comment_depth > 0}">
									<span style="font-weight:bold; margin-left:28px;">${comment.parent_writer}</span>
									<span style="margin-left:10px;">${comment.comment_text}</span>
								</c:if>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</c:forEach>
			</c:if>
			<sec:authorize access="isAnonymous()">
			<tr>
				<td><textarea class="form-control" style="height:50px; resize:none;" id="comment_text1" name="comment" placeholder="댓글을 입력하세요" readonly></textarea></td>
				<td style="width:10%; text-align:center; vertical-align:middle;"></td>
			</tr>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
			<tr>
				<td><textarea class="form-control" style="height:50px; resize:none;" id="comment_text2" name="comment" placeholder="댓글을 입력하세요"></textarea></td>
				<td style="width:10%; text-align:center; vertical-align:middle;"><input type="button" class="btn btn-outline-light" id="comment_insert_btn" value="등록" /></td>
			</tr>
			</sec:authorize>
		</tbody>
	</table>
</div>

<script>
$(function(){
	
	// 비로그인 댓글쓰기 클릭
	$('#comment_text1').click(function(){
		var yes = confirm('로그인이 필요한 기능입니다. 로그인하시겠습니까?');
		if(yes){
			$('#loginModal').modal('show');
		}
		else{
			return false;
		}
	});
	
	// 댓글등록
	$(document).on('click', '#comment_insert_btn', function(){
		var no = $('#support_no').text();
		var text = $('#comment_text2').val();
		if(text == ""){
			alert('댓글을 입력 후 등록해주세요.');
			return false;
		}
		else{
			$.post('rest_insert_comment.json', {no:no, text:text}, function(data){
				if(data.ret == 1){
					alert('댓글이 등록되었습니다.');
					window.location.reload();
				}
			},'json'); 
		}
	});
	
	// 답댓글
	$(document).on('click', '.recomment_btn', function(){
		event.preventDefault();
		$('#recomment_insert_btn').parent().parent().remove();
		var idx = $(this).index('.recomment_btn');
		$('.comment_table').eq(idx).append(
			'<tr>'+
				'<td colspan="2" style="padding-right:0px">'+
					'<div class="form-inline">'+
						'<textarea class="form-control" style="width:90%; height:50px; resize:none;" id="recomment_text" name="recomment" placeholder="답댓글을 입력하세요"></textarea>'+
						'<input type="button" class="btn btn-outline-light btn-sm" style="margin-left:10px;" id="recomment_insert_btn" value="등록" />'+
						'<input type="button" class="btn btn-outline-light btn-sm" style="margin-left:5px;" id="recomment_close_btn" value="취소" />'+
					'</div>'+
				'</td>'+
			'</tr>'
		);
		
		// 답댓글 등록
		$(document).on('click', '#recomment_insert_btn', function(){
			event.preventDefault();
			var supno = $('#support_no').text();
			var text = $('#recomment_text').val();
			var parno = $('.comment_no').eq(idx).val();
			var parw = $('.comment_writer').eq(idx).text();
			var depth = $('.comment_depth').eq(idx).val();
			$.post('rest_insert_recomment.json', {supno : supno, text : text, parno : parno, parw : parw, depth : depth}, function(data){
				if(data == 1){
					alert('댓글이 등록되었습니다.');
					window.location.reload();
				}
			},'json');
		});
		
		// 답댓글 취소
		$(document).on('click', '#recomment_close_btn', function(){
			event.preventDefault();
			$(this).parent().parent().remove();
		});
	});
	
});
</script>
</body>
</html>	