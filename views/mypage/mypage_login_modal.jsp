<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<!-- 로그인 Modal -->
<form id="mypage_login_form" action="update_pw_login.do" method="post" style="margin:auto;">
	<div class="modal fade" id="mypage_loginModal" tabindex="-1" role="dialog" aria-labelledby="mypage_login_modal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="mypage_login_modal">로그인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="text" class="form-control" id="mypage_login_id" name="id" placeholder="아아디" />
						<div style="height:10px"></div>
					<input type="password" class="form-control" id="mypage_login_pw" name="pw" placeholder="비밀번호" />
						<div style="height:10px"></div>
					<input type="button" id="update_pw_login_btn" class="btn btn-dark form-control" value="로그인" />
				</div>
				<div class="modal-footer" style="display:inline;">
					<div style="float:right;">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<script>
$(function(){
	// MypageLoginForm
	$('#update_pw_login_btn').click(function(){
		var id = $('#mypage_login_id').val();
		var pw = $('#mypage_login_pw').val();
		if(!id){
			alert('아이디를 입력하세요.');
			$('#mypage_login_id').focus();
			return false;
		}
		else if(!pw){
			alert('비밀번호를 입력하세요.');
			$('#mypage_login_pw').focus();
			return false;
		}
		else{
			$('#mypage_login_form').submit();
		}
	});
});
</script>