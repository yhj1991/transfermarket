<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<jsp:include page="../header.jsp"></jsp:include>

<style>
.mypage_div {
	background-color: #343a40;
	border: 0.4px solid #cccccc;
	height: 150px;
}
</style>

<div style="height:100px"></div>

<div class="container">
	<div class="row">
		<div class="col-sm-3 mypage_div">
			<div style="margin-top:10px">
				<h4 style="text-align:center; color:white;">비밀번호 변경</h4>
			</div>
			<div style="margin-top:10px" align="center">
				<a href="update_pw.do" id="mypage_login_btn" class="btn btn-outline-light">변경하러 가기</a>
			</div>
		</div>
		<div class="col-sm-3 mypage_div" style="margin-left:30px">
			<div style="margin-top:10px">
				<h4 style="text-align:center; color:white;">회원정보 변경</h4>
			</div>
			<div style="margin-top:10px" align="center">
				<a href="update_member.do" class="btn btn-outline-light">변경하러 가기</a>
			</div>
		</div>
		<div class="col-sm-3 mypage_div" style="margin-left:30px">
			<div style="margin-top:10px">
				<h4 style="text-align:center; color:white;">회원탈퇴</h4>
			</div>
			<div style="margin-top:10px" align="center">
				<a href="delete_member.do" class="btn btn-outline-light">탈퇴하러 가기</a>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>