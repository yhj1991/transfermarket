<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<jsp:include page="../header.jsp"></jsp:include>

<form id="update_member_form" action="update_member.do" method="post">
	<div class="container">
		<h4>회원정보 변경</h4>
		<table class="tabel table-hover table-dark table-sm" style="width:500px">
			<tr>
				<td>아이디</td>
				<td><input type="text" class="form-control form-control-sm" style="background-color:white;" name="id" placeholder="아이디" value="${member.mem_id}" readonly /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text"  class="form-control form-control-sm" name="name" placeholder="이름" value="${member.mem_name}" data-error="#update_member_name"/>
					<div id="update_member_name" style="color:red;"></div>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text"  class="form-control form-control-sm" name="tel" placeholder="전화번호" value="${member.mem_tel}" data-error="#update_member_tel"/>
					<div id="update_member_tel" style="color:red;"></div>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text"  class="form-control form-control-sm" name="email" placeholder="이메일" value="${member.mem_email}" data-error="#update_member_email"/>
					<div id="update_member_email" style="color:red;"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="form-control btn btn-outline-light" id="update_btn" value="변경" /></td>
			</tr>
		</table>
	</div>
</form>

<script>
$(function(){
	$('#update_member_form').validate({
		submitHandler:function(form){
			var yes = confirm('정보를 변경 하시겠습니까?');
			if(yes){
				return true;
			}
			else{
				return false;
			}
		},
		rules : {
			name : {
				required : true,
			},
			tel : {
				required : true
			},
			email : {
				required : true,
				email : true
			}
		},
		messages : {
			name : {
				required : '이름을 입력하세요.'
			},
			tel : {
				required : '전화번호를 입력하세요.'
			},
			email : {
				required : '이메일을 입력하세요.',
				email : '유효한 이메일 형식이 아닙니다.'
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