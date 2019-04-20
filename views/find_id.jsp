<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<jsp:include page="header.jsp"></jsp:include>

<div style="height:30px"></div>

<div class="container" style="margin-top:20px;">
	<h1 style="text-align:center;">아이디 찾기</h1>
	<div style="height:50px;"></div>
	<div class="row justify-content-center">
		<div class="col">
			<form id="find_email_form" action="find_id.do" method="post">
				<div class="row justify-content-center">
					<div style="width:450px;" align="center">
						<h3>이메일로 찾기</h3>
						<div class="login_body" style="margin-top:50px;">
							<input type="text" class="form-control" style="height:50px;" id="find_email1" name="name" placeholder="이름" />
							<div style="height:20px"></div>
							<input type="text" class="form-control" style="height:50px;" id="find_email2" name="email" placeholder="이메일 ex) email@email.com" />
							<div style="height:20px"></div>
							<input type="button" class="btn btn-dark form-control find_btn" style="height:50px;" id="mem_email" value="이메일로 찾기" />
						</div>
						<div style="border:1px solid #eeeeee; margin-top:30px;"></div>
						<div class="login_footer form-inline row justify-content-center" style="margin-top:10px;">
							<a href="#" class="find_general">
								<span style="font-size:small; color:black;">일반회원</span>
							</a>
							<span style="color:black; margin-left:10px; margin-right:10px;">│</span>
							<a href="#" class="find_admin">
								<span style="font-size:small; color:black;">관리자</span>
							</a>
						</div>
					</div>
				</div>
			</form>
		</div>
		
		<div class="col">
			<form id="find_tel_form" action="find_id.do" method="post">
				<div class="row justify-content-center">
					<div style="width:450px;" align="center">
						<h3>전화번호로 찾기</h3>
						<div class="login_body" style="margin-top:50px;">
							<input type="text" class="form-control" style="height:50px;" id="find_tel1" name="name" placeholder="이름" />
							<div style="height:20px"></div>
							<input type="text" class="form-control" style="height:50px;" id="find_tel2" name="tel" placeholder="전화번호 ex) 010-1234-5678" />
							<div style="height:20px"></div>
							<input type="button" class="btn btn-dark form-control find_btn" style="height:50px;" id="mem_tel" value="전화번호로 찾기" />
						</div>
						<div style="border:1px solid #eeeeee; margin-top:30px;"></div>
						<div class="login_footer form-inline row justify-content-center" style="margin-top:10px;">
							<a href="#" class="find_general">
								<span style="font-size:small; color:black;">일반회원</span>
							</a>
							<span style="color:black; margin-left:10px; margin-right:10px;">│</span>
							<a href="#" class="find_admin">
								<span style="font-size:small; color:black;">관리자</span>
							</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
$(function(){
	$('.find_btn').click(function(){
		var btn = $(this).attr('id');
		if(btn == 'mem_email'){
			var name = $('#find_email1').val();
			var email = $('#find_email2').val();
			if(!name){
				alert('이름을 입력하세요.');
				$('#find_email1').focus();
				return false;
			}
			else if(!email){
				alert('이메일을 입력하세요.');
				$('#find_email2').focus();
				return false;
			}
			else {
				$('#find_email_form').submit();
			}
		}
		else if(btn == 'mem_tel'){
			var name = $('#find_tel1').val();
			var tel = $('#find_tel2').val();
			if(!name){
				alert('이름을 입력하세요.');
				$('#find_tel1').focus();
				return false;
			}
			else if(!tel){
				alert('전화번호를 입력하세요.');
				$('#find_tel2').focus();
				return false;
			}
			else {
				$('#find_tel_form').submit();
			}
		}
	});
	
	$('.find_general').click(function(){
		var idx = $(this).index('.find_general');
		if(idx == 0){
			$('#find_email1').val('홍길동');
			$('#find_email2').val('member@member.com');
		}
		else {
			$('#find_tel1').val('홍길동');
			$('#find_tel2').val('010-1234-5678');
		}
	});
	
	$('.find_admin').click(function(){
		var idx = $(this).index('.find_admin');
		if(idx == 0){
			$('#find_email1').val('관리자');
			$('#find_email2').val('admin@admin.com');
		}
		else {
			$('#find_tel1').val('관리자');
			$('#find_tel2').val('010-1234-5678');
		}
	});
});
</script>