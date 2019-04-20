<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<jsp:include page="../header.jsp"></jsp:include>

<div class="container" style="margin-top:-10px;">
	<div class="row jusitfy-content-center">
		<div class="col">
			<a href="#" data-toggle="dropdown" data-target="#" id="drop_team" aria-haspopup="true" aria-expanded="false">나의 소속팀</a>
			<div class="dropdown-menu"  aria-labelledby="drop_team" >
				<a class="dropdown-item" href="myteam.do?menu=1">내 정보</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="myteam.do?menu=2">팀 정보</a>
				<a class="dropdown-item" href="myteam.do?menu=3">팀 기록실</a>
				<a class="dropdown-item" href="myteam.do?menu=4">팀 게시판</a>
				<div class="dropdown-divider"></div>
				<span class="dropdown-item disabled">팀 관리자 메뉴</span>
				<a class="dropdown-item" href="#">팀 정보수정</a>
				<a class="dropdown-item" href="#">팀 전술설정</a>
				<a class="dropdown-item" href="#">팀 선수관리</a>
			</div>
		</div>
		<div class="col">
			<a href="#" data-toggle="dropdown" data-target="#" id="drop_team2" aria-haspopup="true" aria-expanded="false">나의 소속리그</a>
			<div class="dropdown-menu" aria-labelledby="drop_team2">
				<a class="dropdown-item" href="#">리그 목록</a>
				<a class="dropdown-item" href="#">리그 참가신청</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#">소속리그 정보</a>
				<a class="dropdown-item" href="#">소속리그 기록실</a>
			</div>
		</div>
		<div class="col">
			<a href="#" data-toggle="dropdown" data-target="#" id="drop_team3" aria-haspopup="true" aria-expanded="false">경기신청</a>
			<div class="dropdown-menu" aria-labelledby="drop_team3">
				<a class="dropdown-item" href="#">친선경기 신청</a>
				<a class="dropdown-item" href="#">친선경기 등록</a>
			</div>
		</div>
		<div class="col">
			<a href="#" data-toggle="dropdown" data-target="#" id="drop_team4" aria-haspopup="true" aria-expanded="false">팀 구인</a>
			<div class="dropdown-menu" aria-labelledby="drop_team4">
				<a class="dropdown-item" href="find.do?menu=1">팀 목록</a>
				<a class="dropdown-item" href="find.do?menu=2">구인 게시판</a>
			</div>
		</div>
	</div>
</div>

<div style="border-bottom:0.4px solid #eeeeee; margin-top:10px;'"></div>

<div style="height:30px;"></div>