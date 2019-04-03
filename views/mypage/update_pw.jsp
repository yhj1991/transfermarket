<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<jsp:include page="../header.jsp"></jsp:include>

<form id="update_pw_form" action="update_pw.do" method="post">
	<div class="container">
		<h4>비밀번호 변경</h4>
		<div style="font-weight:bold; font-size:large; margin-top:10px; width:400px">
			테스트용 계정/암호<br /><br />일반로그인 : {test1, 1}, 관리자로그인 : {admin, 1}
		</div>
		<div style="height:30px"></div>
		<table class="tabel table-hover table-dark table-sm" style="width:500px">
			<tr>
				<td>기존 비밀번호</td>
				<td>
					<input type="password" class="form-control form-control-sm" style="background-color:white;" name="old_pw" placeholder="기존 비밀번호" data-error="#old_pw_div" />
					<div id="old_pw_div" style="color:red; font-size:small;"></div>
				</td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td>
					<input type="password"  class="form-control form-control-sm" name="new_pw" placeholder="새 비밀번호" data-error="#new_pw_div" />
					<div id="new_pw_div" style="color:red; font-size:small;"></div>
				</td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td>
					<input type="password"  class="form-control form-control-sm" name="new_pw1" placeholder="새 비밀번호 확인" data-error="#new_pw1_div" />
					<div id="new_pw1_div" style="color:red; font-size:small;"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" class="form-control btn btn-outline-light" value="변경" />
				</td>
			</tr>
		</table>
	</div>
</form>

<script>
$(function(){
	$('#update_pw_form').validate({
		submitHandler : function(form){
			var yes = confirm('비밀번호를 변경 하시겠습니까?');
			if(yes){
				return true;
			}
			else{
				return false;
			}
		},
		rules : {
			old_pw : {
				required : true
			},
			new_pw : {
				required : true
			},
			new_pw1 : {
				required : true,
				equalTo : $('input[name="new_pw"]')
			}
		},
		messages : {
			old_pw : {
				required : '기존 비밀번호를 입력하세요.'
			},
			new_pw : {
				required : '새 비밀번호를 입력하세요.'
			},
			new_pw1 : {
				required : '새 비밀번호 확인을 입력하세요.',
				equalTo : '비밀번호가 일치하지 않습니다.'
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