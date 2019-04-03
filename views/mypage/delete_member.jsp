<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<jsp:include page="../header.jsp"></jsp:include>

<form id="delete_member_form" action="delete_member.do" method="post">
	<div class="container">
		<h4>회원탈퇴</h4>
		<table class="tabel table-hover table-dark table-sm" style="width:500px">
			<tr>
				<td colspan="2">탈퇴를 위해 현재 로그인한 계정으로 인증을 합니다.</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" class="form-control form-control-sm" style="background-color:white;" name="id" placeholder="아이디" data-error="#delete_login_id" />
					<div id="delete_login_id" style="color:red; font-size:small;"></div>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password"  class="form-control form-control-sm" name="pw" placeholder="비밀번호" data-error="#delete_login_pw" />
					<div id="delete_login_pw" style="color:red; font-size:small;"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" class="form-control btn btn-outline-light" value="확인" />
				</td>
			</tr>
		</table>
	</div>
</form>

<script>
$(function(){
	$('#delete_member_form').validate({
		submitHandler : function(form){
			var yes = confirm('정말 탈퇴하시겠습니까?');
			if(yes){
				return true;
			}
			else{
				return false;
			}
		},
		rules : {
			id : {
				required : true
			},
			pw : {
				required : true
			}
		},
		messages : {
			id : {
				required : '아이디를 입력하세요.'
			},
			pw : {
				required : '비밀번호를 입력하세요.'
			}
		},
		errorPlacement : function(error, element){
			var a = $(element).data('error');
			$(a).append(error);
		}
	});
});
</script>

<jsp:include page="../footer.jsp"></jsp:include>