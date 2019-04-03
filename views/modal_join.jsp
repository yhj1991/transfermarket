<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- 회원가입 Modal -->
<form id="join_form" style="margin:auto;">
	<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="joinModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="joinModalLabel">회원가입</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div>
						<div>
							<span style="font-size:small;">회원유형 ( ※ 감독 및 구단의 계정생성시 관리자의 승인이 필요합니다. )</span>
						</div>
						<div class="form-inline">
							<input type="checkbox" name="jointype" value="1" checked/><label style="margin-left:5px">일반</label>
							<div style="width:20px"></div>
							<input type="checkbox" name="jointype" value="2" /><label style="margin-left:5px">감독</label>
							<div style="width:20px"></div>
							<input type="checkbox" name="jointype" value="3" /><label style="margin-left:5px">구단</label>
						</div>
					</div>
					<hr />
					<div style="margin-top:10px">
						<input type="text" class="form-control" name="id" placeholder="아아디" data-error="#id_error" />
							<div id="id_error" style="color:red;"></div>
							<div style="height:10px"></div>
						<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호" data-error="#pw_error" />
							<div  style="color:red;"id="pw_error"></div>
							<div style="height:10px"></div>
						<input type="password" class="form-control" name="pw1" placeholder="비밀번호 확인" data-error="#pw1_error" />
							<div  style="color:red;"id="pw1_error"></div>
							<div style="height:10px"></div>
						<input type="text" class="form-control" name="name" placeholder="이름" data-error="#name_error" />
							<div  style="color:red;"id="name_error"></div>
							<div style="height:10px"></div>
						<input type="text" class="form-control" name="tel" placeholder="전화번호 ex) 010-1234-5678" data-error="#tel_error" />
							<div  style="color:red;"id="tel_error"></div>
							<div style="height:10px"></div>
						<input type="text" class="form-control" name="email" placeholder="이메일 ex) email@email.com" data-error="#email_error" />
							<div  style="color:red;"id="email_error"></div>
							<div style="height:10px"></div>
						<input type="submit" class="btn btn-dark form-control" value="회원가입" />
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</form>

<script>
$(function(){
	
	$('input[name="jointype"]').click(function(){
		$('input[name="jointype"]').prop('checked', false);
		$(this).prop('checked', true);
		console.log($(this).val());
	});
	
	//jquery validate
	$('#join_form').validate({
		submitHandler:function(form){
			var yes = confirm('회원가입 하시겠습니까?');
			if(yes){
				event.preventDefault();
				$.ajax({
					url: "rest_join.json", 
					type: "POST",             
					data: $('#join_form').serialize(),
					cache: false,             
					processData:false,      
					success: function(data){
						if(data.ret == 1){
							if(data.jointype == 1){
								alert('회원가입이 완료되었습니다. 로그인 후 이용해주세요.');
								$('#joinModal').modal('hide');
								window.location.reload();
							}
							else if(data.jointype == 2 && data.jointype == 3){
								alert('가입신청이 되었습니다.');
								$('#joinModal').modal('hide');
								window.location.reload();
							}
						}
						else{
							alert('회원가입에 실패했습니다. 다시 진행해주세요.');
						}
					}
				});
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
			},
			pw1 : {
				required : true,
				equalTo : "#pw"
			},
			name : {
				required : true
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
			id : {
				required : '아이디를 입력하세요.'
			},
			pw : {
				required : '비밀번호를 입력하세요.'
			},
			pw1 : {
				required : '비밀번호 확인란을 입력해주세요.',
				equalTo : '비밀번호가 일치하지 않습니다.'
			},
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