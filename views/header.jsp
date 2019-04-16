<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<html>
<head>
	<title>Transfer Market</title>
	<link href="${pageContext.request.contextPath}/resources/bootstrap-4.3.1/css/bootstrap.min.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/resources/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap-4.3.1/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/fontawesome-5.5.0/js/all.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery-validate/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery-validate/additional-methods.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery-validate/messages_ko.min.js"></script>
</head>
<body>

<!-- 최상단 NavBar -->
<div id="nav" style="padding:0px; background-color:#084B8A; border-bottom:0.4px solid #eeeeee">
	<div class="row justify-content-end" style="width:80%; height:40px;">
		<a href="#" class="form-inline" id="login_admin" style="font-size:small; margin-right:15px; color:white;">관리자로그인</a>
		
		<div style="width:100px"></div>
		
		<sec:authorize access="isAuthenticated()">
			<div class="form-inline" style="font-size:small; font-weight:bold; margin-right:25px; color:white;">
				<sec:authentication property="principal.username" var="sec_id"/>${sec_id} 회원님
			</div>
		</sec:authorize>
		
		<a href="${pageContext.request.contextPath}/main.do" class="form-inline" style="font-size:small; margin-right:15px; color:white;">홈</a>
		<sec:authorize access="isAnonymous()">
			<a href="#" class="form-inline" style="font-size:small; margin-right:15px; color:white;" id="login_modal_btn">로그인</a>
			<a href="#" class="form-inline" style="font-size:small; margin-right:15px; color:white;" id="join_modal_btn">회원가입</a>
		</sec:authorize>
		
		<sec:authorize access="isAuthenticated()">
			<%-- <a href="${pageContext.request.contextPath}/team/main.do" class="form-inline" style="font-size:small; margin-right:15px; color:white;">소속팀</a> --%>
			<a href="${pageContext.request.contextPath}/logout.do" class="form-inline" style="font-size:small; margin-right:15px; color:white;">로그아웃</a>
			<a href="${pageContext.request.contextPath}/mypage/main.do" class="form-inline" style="font-size:small; margin-right:15px; color:white;">마이페이지</a>
		</sec:authorize>
		<a href="${pageContext.request.contextPath}/support/main.do" class="form-inline" style="font-size:small; margin-right:15px; color:white;">게시판</a>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<a href="${pageContext.request.contextPath}/admin/main.do" class="form-inline" style="font-size:small; margin-right:15px; color:white;">관리자페이지</a>
		</sec:authorize>
		<a href="${pageContext.request.contextPath}/chat/main.do" class="form-inline" style="font-size:small; margin-right:15px; color:white;">채팅페이지</a>
	</div>
</div>

<form id="form" action="${pageContext.request.contextPath}/login_post.do" method="post">
	<input type="hidden" name="id" id="login_click_id" value="" />
	<input type="hidden" name="pw" id="login_click_pw" value="" />
</form>

<jsp:include page="modal_login.jsp"></jsp:include>

<jsp:include page="modal_join.jsp"></jsp:include>

<script>
$(function(){
	// Navbar
	$(document).ready(function() {
	   	var stickyNavTop = $('#nav').offset().top;
	   	
	   	var stickyNav = function(){
		    var scrollTop = $(window).scrollTop();
		    if (scrollTop > stickyNavTop) { 
		        $('#nav').addClass('sticky-top');
		    } else {
		        $('#nav').removeClass('sticky-top'); 
		    }
		};
		stickyNav();
		$(window).scroll(function() {
			stickyNav();
		});
	});
	
	$('#join_modal_btn').click(function(){
		$('#joinModal').modal({
			backdrop:'static',
			keyboard:false
		});
	});
	
	$('#login_modal_btn').click(function(){
		$('#loginModal').modal({
			backdrop:'static',
			keyboard:false
		});
	});
	
	$('#login_admin').click(function(){
		$('#login_click_id').attr('value', 'admin');
		$('#login_click_pw').attr('value', '1');
		$('#form').submit();
	});
});
</script>
