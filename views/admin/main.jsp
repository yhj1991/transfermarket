<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<jsp:include page="../header.jsp"></jsp:include>

<link href="${pageContext.request.contextPath}/resources/sidebar.css" rel="stylesheet" />

<div id="wrapper">
	<!-- Sidebar -->
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand">
				<a href="main.do">
					<i class="fas fa-lock" style="margin-right:5px"></i>
					<span style="font-size:small;">관리자 페이지</span>
				</a>
			</li>
			<li>
				<a href="#member" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="member">
					<i class="fas fa-user" style="width:30px"></i><span style="font-size:small;">회원 관리</span>
				</a>
				<div class="collapse" id="member">
					<a href="main.do?menu=member&detail=1" id="member1" class="dropdown-item"><i class="fas fa-user" style="margin-right:5px"></i><span style="font-size:small;">전체회원</span></a>
					<a href="main.do?menu=member&detail=2" id="member2" class="dropdown-item"><i class="fas fa-user" style="margin-right:5px"></i><span style="font-size:small;">생존회원</span></a>
					<a href="main.do?menu=member&detail=3" id="member3" class="dropdown-item"><i class="fas fa-user-times" style="margin-right:5px"></i><span style="font-size:small;">차단회원</span></a>
					<a href="main.do?menu=member&detail=4" id="member4" class="dropdown-item"><i class="fas fa-user-plus" style="margin-right:5px"></i><span style="font-size:small;">가입신청<span style="font-size:xx-small;">(감독/클럽 회원)</span></span></a>
				</div>
			</li>
			<li>
				<a href="#match" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="#match">
					<i class="fas fa-sitemap" style="width:30px"></i><span style="font-size:small;">경기일정 관리</span>
				</a>
				<div class="collapse" id="match">
					<a href="main.do?menu=match&detail=1" id="match1" class="dropdown-item"><i class="fas fa-sitemap" style="margin-right:5px"></i><span style="font-size:small;">리그</span></a>
					<a href="main.do?menu=match&detail=2" id="match2" class="dropdown-item"><i class="fas fa-sitemap" style="margin-right:5px"></i><span style="font-size:small;">챔피언스리그</span></a>
				</div>
			</li>
			<li>
				<a href="#player" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="player">
					<i class="far fa-address-card" style="width:30px"></i><span style="font-size:small;">선수 관리</span>
				</a>
				<div class="collapse" id="player">
					<a href="main.do?menu=player&detail=1" id="player1" class="dropdown-item"><i class="far fa-address-card" style="margin-right:5px"></i><span style="font-size:small;">선수 목록</span></a>
					<a href="main.do?menu=player&detail=2" id="player2" class="dropdown-item"><i class="far fa-address-card" style="margin-right:5px"></i><span style="font-size:small;">선수 등록</span></a>
				</div>
			</li>
			<li>
				<a href="#coach" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="coach">
					<i class="far fa-address-card" style="width:30px"></i><span style="font-size:small;">감독 관리</span>
				</a>
				<div class="collapse" id="coach">
					<a href="main.do?menu=coach&detail=1" id="coach1" class="dropdown-item"><i class="far fa-address-card" style="margin-right:5px"></i><span style="font-size:small;">감독 목록</span></a>
					<a href="main.do?menu=coach&detail=2" id="coach2" class="dropdown-item"><i class="far fa-address-card" style="margin-right:5px"></i><span style="font-size:small;">감독 등록</span></a>
				</div>
			</li>
			<!-- 
			<li>
				<a href="#tm_data" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="tm_data">
					<i class="fas fa-futbol"style="width:30px"></i><span style="font-size:small;">클럽/리그/국가 관리</span>
				</a>
				<div class="collapse" id="tm_data">
					<a href="main.do?menu=tm_data&detail=1" id="tm_data1" class="dropdown-item"><i class="fas fa-futbol" style="margin-right:5px"></i><span style="font-size:small;">클럽 관리</span></a>
					<a href="main.do?menu=tm_data&detail=2" id="tm_data2" class="dropdown-item"><i class="fas fa-futbol" style="margin-right:5px"></i><span style="font-size:small;">리그 관리</span></a>
					<a href="main.do?menu=tm_data&detail=3" id="tm_data3" class="dropdown-item"><i class="fas fa-futbol" style="margin-right:5px"></i><span style="font-size:small;">국가 관리</span></a>
				</div>
			</li>
			<li>
				<a href="#">
					<i class="fas fa-clipboard-list"></i>
					<i class="fas fa-futbol"></i>
					<i class="fas fa-sitemap"></i>
					<i class="fas fa-user-lock"></i>
					<i class="fas fa-user-plus"></i>
					<i class="far fa-calendar-alt"></i>
					<i class="fas fa-user-times"></i>
				</a>
			</li>
			 -->
		</ul>
	</div>

	<!-- Page content -->
		<div class="page-content inset">
			<c:if test="${empty param.menu}">
				<div class="row justify-content-center">
					<div class="col-md-4">
						<table class="table table-dark table-sm">
							<tr>
								<td colspan="4" style="text-align:center;">신규 가입회원(최근 1주)</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:right; font-size:small;"><a href="main.do?menu=member&detail=2" style="color:white;">전체보기</a></td>
							</tr>
							<tr>
								<td style="text-align:center; font-size:small; width:20%">등급</td>
								<td style="text-align:center; font-size:small; width:35%">아이디</td>
								<td style="text-align:center; font-size:small; width:30%">가입일</td>
								<td style="text-align:center; font-size:small; width:15%">#</td>
							</tr>
							<c:forEach var="member1" items="${main.member1}" end="5">
							<tr>
								<td style="text-align:center; font-size:small;">${member1.authority}</td>
								<td style="text-align:center; font-size:small;">${member1.mem_id}</td>
								<td style="text-align:center; font-size:small;">${member1.mem_date}</td>
								<td style="text-align:center; font-size:small;">#</td>
							</tr>
							</c:forEach>
							<tr>
								<td colspan="4" style="text-align:center;">총 ${main.count1.count}건</td>
							</tr>
						</table>
					</div>
					<div class="col-md-4">
						<table class="table table-dark table-sm">
							<tr>
								<td colspan="4" style="text-align:center;">신규 가입신청(구단/감독)</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:right; font-size:small;"><a href="main.do?menu=member&detail=4" style="color:white;">전체보기</a></td>
							</tr>
							<tr>
								<td style="text-align:center; font-size:small; width:20%">등급</td>
								<td style="text-align:center; font-size:small; width:35%">아이디</td>
								<td style="text-align:center; font-size:small; width:30%">신청일</td>
								<td style="text-align:center; font-size:small; width:15%">#</td>
							</tr>
							<c:forEach var="member2" items="${main.member2}" end="5">
							<tr>
								<td style="text-align:center; font-size:small;">${member2.authority}</td>
								<td style="text-align:center; font-size:small;">${member2.mem_id}</td>
								<td style="text-align:center; font-size:small;">${member2.mem_date}</td>
								<td style="text-align:center; font-size:small;">#</td>
							</tr>
							</c:forEach>
							<tr>
								<td colspan="4" style="text-align:center;">총 ${main.count2.count}건</td>
							</tr>
						</table>
					</div>
					
					<div class="col-md-4">
						<table class="table table-dark table-sm">
							<tr>
								<td colspan="4" style="text-align:center;">최근 탈퇴회원</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align:right; font-size:small;"><a href="#" style="color:white;">전체보기</a></td>
							</tr>
							<tr>
								<td style="text-align:center; font-size:small; width:20%">등급</td>
								<td style="text-align:center; font-size:small; width:35%">아이디</td>
								<td style="text-align:center; font-size:small; width:30%">탈퇴일</td>
								<td style="text-align:center; font-size:small; width:15%">#</td>
							</tr>
							<c:forEach var="member3" items="${main.member3}" end="5">
							<tr>
								<td style="text-align:center; font-size:small;">${member3.authority}</td>
								<td style="text-align:center; font-size:small;">${member3.mem_id}</td>
								<td style="text-align:center; font-size:small;">${member3.del_date}</td>
								<td style="text-align:center; font-size:small;">#</td>
							</tr>
							</c:forEach>
							<tr>
								<td colspan="4" style="text-align:center;">총 ${main.count3.count}건</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="chart-container">
					<canvas id="myChart"></canvas>
				</div>
			</c:if>
		
			<c:if test="${!empty param.menu}">
				<jsp:include page="menu_${param.menu}.jsp"></jsp:include>
			</c:if>
		</div>
</div>

<script>
$(function(){
	var query = new URLSearchParams(window.location.search);
	var menu = query.get('menu');
	var detail = query.get('detail');
	$('#'+menu).attr('class', 'collapse.show');
	$('#'+menu+detail).attr('class', 'dropdown-item active');
});
</script>

<jsp:include page="../footer.jsp"></jsp:include>