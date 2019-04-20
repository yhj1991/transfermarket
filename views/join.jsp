<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<jsp:include page="header.jsp"></jsp:include>

<div style="height:30px"></div>

<div class="container" style="margin-top:20px;">
	<h1 style="text-align:center;">TransferMarket</h1>
	<div style="height:20px;"></div>
	<h4 style="text-align:center;">회원 가입</h4>
	<form id="join_form" action="join.do" method="post">
		<div class="row justify-content-center">
			<div style="width:450px;" align="center">
				<div style="margin-top:20px;">
					<div style="text-align:left;">※ 기본정보(필수입력)</div>
					<input type="text" class="form-control" style="height:50px;" name="id" placeholder="아이디" data-error="#id_error" />
					<div id="id_error" style="color:red; margin-bottom:10px;"></div>
					<input type="password" class="form-control" style="height:50px;" id="pw" name="pw" placeholder="비밀번호" data-error="#pw_error" />
					<div id="pw_error" style="color:red; margin-bottom:10px;"></div>
					<input type="password" class="form-control" style="height:50px;" name="pw1" placeholder="비밀번호 확인" data-error="#pw1_error" />
					<div id="pw1_error" style="color:red; margin-bottom:10px;"></div>
					<input type="text" class="form-control" style="height:50px;" name="name" placeholder="이름" data-error="#name_error" />
					<div id="name_error" style="color:red; margin-bottom:10px;"></div>
					<input type="text" class="form-control" style="height:50px;" name="tel" placeholder="전화번호 ex) 010-1234-5678" data-error="#tel_error" />
					<div id="tel_error" style="color:red; margin-bottom:10px;"></div>
					<input type="text" class="form-control" style="height:50px;" name="email" placeholder="이메일 ex) email@email.com" data-error="#email_error" />
					<div id="email_error" style="color:red; margin-bottom:10px;"></div>
				</div>
				<input type="submit" class="btn btn-dark form-control" style="height:50px; margin-left:-15px; margin-right:-15px;" value="회원가입" />
			</div>
		</div>
	</form>
</div>

<script>
$(function(){
	//jquery validate
	$('#join_form').validate({
		submitHandler:function(form){
			var yes = confirm('가입하시겠습니까?');
			console.log(form);
			if(yes){
				form.submit();
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