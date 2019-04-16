<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<jsp:include page="team_header.jsp"></jsp:include>

<style>
.table tr th {
	font-size:small;
}
.table tr td {
	font-size:small;
}
</style>

<div class="container">
	<table class="table table-borderd table-dark">
		<thead>
			<tr>
				<th colspan="6" style="text-align:center;"><h4 align="center">게시판</h4></th>
			</tr>
			<tr>
				<th colspan="6">
					<div class="form-inline">
						<sec:authorize access="isAnonymous()">
							<a href="insert.do" id="insert_support_login" class="btn btn-outline-light btn-sm">글쓰기</a>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<a href="insert.do" class="btn btn-outline-light btn-sm">글쓰기</a>
							<div style="width:20px"></div>
							<input type="button" class="btn btn-outline-light btn-sm" id="my_support" value="내가 쓴 글" />
							<div style="width:20px"></div>
							<a href="main.do" class="btn btn-outline-light btn-sm form-control form-control-sm">검색 초기화</a>
						</sec:authorize>
					</div>
				</th>
			</tr>
			<tr>
				<th colspan="6">
					<div class="form-inline">
						<select id="search_category" name="category" class='form-control form-control-sm'>
							<option value="0">카테고리</option>
							<c:forEach var="category" items="${category}">
								<option value="${category.category_no}">${category.category_name}</option>
							</c:forEach>
						</select>
						<div style="width:10px"></div>
						<select id="search_type" name="type" class='form-control form-control-sm'>
							<option value="support_title">제목</option>
							<option value="support_content">내용</option>
							<option value="support_t_c">제목+내용</option>
							<option value="support_writer">작성자</option>
						</select>
						<div style="width:10px"></div>
							<input type="text" id="search_text" name="text" class="form-control form-control-sm" style="width:250px"/>
						<div style="width:10px"></div>
						<input type="button" id="search_btn" class="btn btn-outline-light btn-sm form-control form-control-sm" value="검색" />
					</div>
				</th>
			</tr>
			<tr>
				<th style="text-align:center; width:5%">번호</th>
				<th style="text-align:center; width:15%">카테고리</th>
				<th style="text-align:center;">제목</th>
				<th style="text-align:center; width:20%">작성자</th>
				<th style="text-align:center; width:20%">등록일</th>
				<th style="text-align:center; width:10%">조회수</th>
			</tr>	
		</thead>
		<tbody id="search_support_tbody"></tbody>
	</table>
	
	<div class="row justify-content-center" id="pagination-div">
		<ul id="pagination" class="pagination-sm"></ul>
	</div>
</div>

<script src="${pageContext.request.contextPath}/resources/twbsPagination/jquery.twbsPagination.min.js"></script>
<script>
$(function(){
	
	$('#pagination').twbsPagination({
		totalPages: '${totpage}',
		visiblePages: '${totpage < 5 ? totpage : 5}',
		next: '>',
		prev: '<',
		onPageClick: function (event, page) {
			$.post('rest_supportlist_page.json', {page : page}, function(data){
				$('#search_support_tbody').empty();
				var len = data.supportList.length;
				if(len == 0){
					$('#search_support_tbody').append(
						'<tr>'+
							'<td colspan="6" style="font-size:large; font-weight:bold; text-align:center;">등록된 게시글이 없습니다.</td>'+
						'</tr>'
					);
				}
				else{
					for(var i = 0; i < len; i++){
						$('#search_support_tbody').append(
								'<tr>'+
									'<td style="text-align:center;">' + data.supportList[i].support_no + '</td>'+
									'<td style="text-align:center;">' + data.supportList[i].category_name + '</td>'+
									'<td>'+
										'<a href="${pageContext.request.contextPath}/support/select.do?no=' + data.supportList[i].support_no + '">'+
											'<span style="margin-left:30px">' + data.supportList[i].support_title + '</span>'+
										'</a>'+
									'</td>'+
									'<td style="text-align:center;">' + data.supportList[i].support_writer + '</td>'+
									'<td style="text-align:center;">' + data.supportList[i].support_date + '</td>'+
									'<td style="text-align:center;">' + data.supportList[i].support_hit + '</td>'+
								'</tr>'		
						);
					}
				}
			});
		}
	});
	
	$('#insert_support_login').click(function(){
		event.preventDefault();
		var yes = confirm('로그인된 회원만 글쓰기를 할 수 있습니다. 로그인하시겠습니까?');
		if(yes){
			$('#loginModal').modal('show');
		}
	});
	
	$('#my_support').click(function(){
		$.post('rest_mysupport.json', function(data){
			var len = data.mysupport.searchList.length;
			if(len == 0){
				alert('내가 쓴 게시글이 없습니다.');
				return false;
			}
			else {
				$('#pagination').twbsPagination('destroy');
				$('#pagination').twbsPagination({
			       	totalPages: data.mysupport.searchPage,
			   		visiblePages: data.mysupport.searchPage < 5 ? data.mysupport.searchPage : 5,
			   		next: '>',
			   		prev: '<',
			   		onPageClick: function (event, page) {
			   			$.post('rest_mysupport.json', {page : page}, function(data){
			   				$('#search_support_tbody').empty();
			   				var len2 = data.mysupport.searchList.length;
							for(var i = 0; i < len2; i++){
								$('#search_support_tbody').append(
									'<tr>'+
										'<td style="text-align:center;">' + data.mysupport.searchList[i].support_no + '</td>'+
										'<td style="text-align:center;">' + data.mysupport.searchList[i].category_name + '</td>'+
										'<td>'+
											'<a href="${pageContext.request.contextPath}/support/select.do?no=' + data.mysupport.searchList[i].support_no + '">'+
												'<span style="margin-left:30px">' + data.mysupport.searchList[i].support_title + '</span>'+
											'</a>'+
										'</td>'+
										'<td style="text-align:center;">' + data.mysupport.searchList[i].support_writer + '</td>'+
										'<td style="text-align:center;">' + data.mysupport.searchList[i].support_date + '</td>'+
										'<td style="text-align:center;">' + data.mysupport.searchList[i].support_hit + '</td>'+
									'</tr>'
								);
							}
			   			},'json');
			   		}
				});
			}
		},'json');
	});
	
	$('#search_btn').click(function(){
		var category = $('#search_category').val();
		var type = $('#search_type').val();
		var text = $('#search_text').val();
		$.post('rest_search_support.json', {category : category, type : type, text : text}, function(data){
			var len = data.search.searchList.length;
			if(len == 0){
				alert('검색된 게시글이 없습니다.');
				return false;
			}
			else{
				$('#search_support_tbody').empty();
				for(var i = 0; i < len; i++){
					$('#search_support_tbody').append(
							'<tr>'+
								'<td style="text-align:center;">' + data.search.searchList[i].support_no + '</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].category_name + '</td>'+
								'<td>'+
									'<a href="${pageContext.request.contextPath}/support/select.do?no=' + data.search.searchList[i].support_no + '">'+
										'<span style="margin-left:30px">' + data.search.searchList[i].support_title + '</span>'+
									'</a>'+
								'</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].support_writer + '</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].support_date + '</td>'+
								'<td style="text-align:center;">' + data.search.searchList[i].support_hit + '</td>'+
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
			   			$.post('rest_search_support.json', {category : category, type : type, text : text, page: page}, function(data){
			   				$('#search_support_tbody').empty();
			   				var len = data.search.searchList.length;
							for(var i = 0; i < len; i++){
								$('#search_support_tbody').append(
										'<tr>'+
											'<td style="text-align:center;">' + data.search.searchList[i].support_no + '</td>'+
											'<td style="text-align:center;">' + data.search.searchList[i].category_name + '</td>'+
											'<td>'+
												'<a href="${pageContext.request.contextPath}/support/select.do?no=' + data.search.searchList[i].support_no + '">'+
													'<span style="margin-left:30px">' + data.search.searchList[i].support_title + '</span>'+
												'</a>'+
											'</td>'+
											'<td style="text-align:center;">' + data.search.searchList[i].support_writer + '</td>'+
											'<td style="text-align:center;">' + data.search.searchList[i].support_date + '</td>'+
											'<td style="text-align:center;">' + data.search.searchList[i].support_hit + '</td>'+
										'</tr>'		
								);
							}
			   			});
			   		}
				});
			}
		});
	});
});
</script>