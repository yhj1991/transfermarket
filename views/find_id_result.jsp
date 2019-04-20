<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<jsp:include page="header.jsp"></jsp:include>

<div style="height:30px"></div>

<div class="container" style="margin-top:50px;">
	<div class="row justify-content-center">
		<div style="width:450px;" align="center">
			<h1>TransferMarket</h1>
			<div class="login_body" style="margin-top:50px;">
				<span>회원님의 아이디</span>
				<div style="height:20px"></div>
				<input type="text" class="form-control" style="height:50px; text-align:center;" value="${find_id.mem_id}" readonly/>
				<div class="row" style="margin-top:20px;">
					<div class="col">
						<a href="${pageContext.request.contextPath}/login.do">
							<input type="button" style="height:50px;" class="btn btn-dark form-control" value="로그인" />
						</a>
					</div>
					<div class="col">
						<a href="${pageContext.request.contextPath}/join.do">
							<input type="button" style="height:50px;" class="btn btn-dark form-control" value="회원가입" />
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>