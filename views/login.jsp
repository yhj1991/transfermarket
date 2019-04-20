<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<jsp:include page="header.jsp"></jsp:include>

<div style="height:30px"></div>

<div class="container" style="margin-top:50px;">
	<form id="login_form" action="login_post.do" method="post">
		<div class="row justify-content-center">
			<div style="width:450px;" align="center">
				<h1>TransferMarket</h1>
				<div class="login_body" style="margin-top:50px;">
					<input type="text" class="form-control" style="height:50px;" id="login_id" name="id" placeholder="아이디" />
					<div style="height:20px"></div>
					<input type="password" class="form-control" style="height:50px;" id="login_pw" name="pw" placeholder="비밀번호" />
					<div style="height:20px"></div>
					<input type="button" id="login_btn" style="height:50px;" class="btn btn-dark form-control" value="로그인" />
				</div>
				<div style="border:1px solid #eeeeee; margin-top:30px;"></div>
				<div class="login_footer form-inline row justify-content-center" style="margin-top:10px;">
					<a href="${pageContext.request.contextPath}/find_id.do">
						<span style="font-size:small; color:black;">아이디찾기</span>
					</a>
					<span style="color:black; margin-left:10px; margin-right:10px;">│</span>
					<a href="${pageContext.request.contextPath}/join.do">
						<span style="font-size:small; color:black;">회원가입</span>
					</a>
				</div>
				<div style="border:1px solid #eeeeee; margin-top:20px;"></div>
				<div style="height:20px;"></div>
				<span style="text-align:center;font-size:small;">빠른 로그인 버튼</span>
				<div class="login_footer form-inline row justify-content-center" style="margin-top:10px;">
					<a href="#" id="general_text1">
						<span style="font-size:small; color:black;">일반회원(차단회원)</span>
					</a>
					<span style="color:black; margin-left:10px; margin-right:10px;">│</span>
					<a href="#" id="general_text2">
						<span style="font-size:small; color:black;">일반회원</span>
					</a>
					<span style="color:black; margin-left:10px; margin-right:10px;">│</span>
					<a href="#" id="admin_text">
						<span style="font-size:small; color:black;">관리자</span>
					</a>
				</div>
			</div>
		</div>
	</form>
</div>

<script>
$(function(){
	$('#login_id').focus();
	// LoginForm
	$('#login_btn').click(function(){
		var id = $('#login_id').val();
		var pw = $('#login_pw').val();
		console.log(id);
		console.log(pw);
		if(!id){
			alert('아이디를 입력하세요.');
			$('#login_id').focus();
			return false;
		}
		else if(!pw){
			alert('비밀번호를 입력하세요.');
			$('#login_pw').focus();
			return false;
		}
		else{
			$('#login_form').submit();
		}
	});
	
	$('#find_member_id').click(function(){
		$('#login_modal_body').empty();
		$('#login_modal_footer').remove();
		$('#loginModalLabel').text('아이디 찾기');
		$('#login_modal_body').append(
				'<h4>이메일로 찾기</h4>'+
				'<a href="#" class="test_find_btn" value="1">테스트해보기</a>'+
				'<input type="text" class="form-control find_text1" placeholder="이름" />'+
					'<div style="height:10px"></div>'+
				'<input type="text" class="form-control find_text2" placeholder="이메일 ex)email@email.com" />'+
					'<div style="height:10px"></div>'+
				'<input type="button" class="btn btn-dark form-control find_btn" id="mem_email" value="찾기" />'+	
				'<hr />'+
				'<h4>전화번호로 찾기</h4>'+
				'<a href="#" class="test_find_btn" value="2">테스트해보기</a>'+
				'<input type="text" class="form-control find_text1" placeholder="이름" />'+
					'<div style="height:10px"></div>'+
				'<input type="text" class="form-control find_text2" placeholder="전화번호 ex) 010-1234-5678" />'+
					'<div style="height:10px"></div>'+
				'<input type="button" class="btn btn-dark form-control find_btn" id="mem_tel" value="찾기" />'
		);
	});
	
	$(document).on('click', '#login_modal_close', function(){
		window.location.reload();
	});
	
	$(document).on('click', '.test_find_btn', function(){
		var idx = $(this).index('.test_find_btn');
		var type = $(this).attr('value');
		console.log(idx);
		console.log(type);
		$('.find_text1').eq(idx).attr('value', 'aa');
		if(type == 1){
			$('.find_text2').eq(idx).attr('value', 'aa@test.com');
		}
		else {
			$('.find_text2').eq(idx).attr('value', '010-1234-5678');
		}
	});
	
	$(document).on('click', '.find_btn', function(){
		var idx = $(this).index('.find_btn');
		var text1 = $('.find_text1').eq(idx).val();
		var text2 = $('.find_text2').eq(idx).val();
		var type = $(this).attr('id');

		if(!text1 || !text2){
			alert('모든 항목을 입력하세요.');
			return false;
		}
		$.post('rest_find_member.json', {name : text1, text : text2, type : type}, function(data){
			if(!data.mem){
				alert('일치하는 회원이 없습니다.');
				return false;
			}
			else {
				$('#login_modal_body').empty();
				$('#login_modal_body').append(
					'회원님의 아이디 : <span style="font-size:large; font-weight:bold;">' + data.mem.mem_id + '</span>'		
				);
			}
		},'json');
	});
	
	$('#general_text1').click(function(){
		$('#login_id').attr('value', 'test');
		$('#login_pw').attr('value', '1');
		// $('#login_btn').click();
	});
	
	$('#general_text2').click(function(){
		$('#login_id').attr('value', 'member');
		$('#login_pw').attr('value', '1');
		// $('#login_btn').click();
	});
	
	$('#admin_text').click(function(){
		$('#login_id').attr('value', 'admin');
		$('#login_pw').attr('value', '1');
		// $('#login_btn').click();
	});
});
</script>