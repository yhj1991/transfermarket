<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<style>
.table tr th {
	vertical-align:middle;
}
.table tr td {
	vertical-align:middle;
}
</style>

<jsp:include page="team_header.jsp"></jsp:include>

<div style="height:30px"></div>

<div class="container">
	<div class="player_div1">
		<%-- 
		<c:if test="${sec_id eq mem.mem_id}">
			<a href="#"><input type="button" class="btn btn-dark" value="정보수정" /></a>
		</c:if>
		<div style="height:30px"></div>
		 --%>
		<table class="table table-dark table-borderless">
			<tr>
				<td rowspan="3" style="width:10%; height:150px; text-align:center;">
					<img src="${pageContext.request.contextPath}/img/mem_img.do?id=${member.mem_id}"/>
				</td>
			</tr>
			<tr>
				<td width="65%"><span style="font-size:xx-large; font-weight:bold;">${member.mem_name}</span></td>
			</tr>
			<tr>
				<td>${member.mem_position1} - ${member.mem_position2}</td>
			</tr>
		</table>
	</div>
	
	<div class="player_div2">
		<table class="table table-sm table-dark table-bordered">
			<tr style="height:10%">
				<th colspan="6" style="font-size:x-large;">선수 정보</th>
			</tr>
			<tr style="height:10%">
				<td colspan="2" style="width:30%; text-align:center;"><span style="font-size:small; font-weight:bold;">상세정보</span></td>
				<td colspan="2" style="width:35%; text-align:center;"><span style="font-size:small; font-weight:bold;">포지션 : ${member.mem_position1} - ${member.mem_position2}</span></td>
				<td colspan="2" style="width:35%; text-align:center;"><span style="font-size:small; font-weight:bold;">공격포인트 득점 / 도움 (최근 5경기)</span></td>
			</tr>
			<tr style="height:10%">
				<td style="width:10%">지역</td>
				<td style="width:20%">
					<span style="margin-left:5px;">${member.mem_addr}</span>
				</td>
				<td colspan="2" rowspan="6" style="border-top:none; text-align:center;">
					<img src="${pageContext.request.contextPath}/img/position_img.do?position2=${member.mem_position2}" />
				</td>
				<td colspan="2" rowspan="3" style="border-top:none; width:200px;">
					<canvas id="myChart1"></canvas>
				</td>
			</tr>
			<tr style="height:10%">
				<td>소속팀</td>
				<td>
					<a href="${pageContext.request.contextPath}/detail/team.do?no=${member.team_no}">
						<img src="${pageContext.request.contextPath}/img/team_img.do?no=${member.team_no}" style="width:18px; height:24px;"/>
						<span style="margin-left:5px;">${member.team_name}</span>
					</a>
				</td>
			</tr>
			<tr style="height:10%">
				<td>등번호</td>
				<td><span style="margin-left:5px;">${member.mem_backnum}</span></td>
			</tr>
			<tr style="height:10%">
				<td>생년월일</td>
				<td><span style="margin-left:5px;">${member.mem_birth}</span></td>
				<td colspan="2" rowspan="3" style="border-top:none;">
					<canvas id="myChart2"></canvas>
				</td>
			</tr>
			<tr style="height:10%">
				<td>나이</td>
				<td><span style="margin-left:5px;">${member.mem_age}</span></td>
			</tr>
			<tr style="height:10%">
				<td>사용하는 발</td>
				<td><span style="margin-left:5px;">${member.mem_foot}</span></td>
			</tr>
		</table>
	</div>
	<div class="player_div3">
		<table class="table table-dark table-bordered">
			<tr>
				<td style="width:32%; text-align:center;">최근 경기</td>
				<td style="width:17%; text-align:center;">경기수</td>
				<td style="width:17%; text-align:center;">득점</td>
				<td style="width:17%; text-align:center;">도움</td>
				<td style="width:17%; text-align:center;">분당 공격포인트</td>
			</tr>
			<tr>
				<td style="text-align:center;">vs OOO팀</td>
				<td style="text-align:center;">6</td>
				<td style="text-align:center;">1</td>
				<td style="text-align:center;">2</td>
				<td style="text-align:center;">6*90/(1+2)(분)</td>
			</tr>
			<tr>
				<td style="text-align:center;">Laliga</td>
				<td style="text-align:center;">26</td>
				<td style="text-align:center;">2</td>
				<td style="text-align:center;">3</td>
				<td style="text-align:center;">26*90/(2+3)(분)</td>
			</tr>
			<tr>
				<td style="text-align:center;">총</td>
				<td style="text-align:center;">32</td>
				<td style="text-align:center;">3</td>
				<td style="text-align:center;">5</td>
				<td style="text-align:center;">32*90/(3+5)(분)</td>
			</tr>
		</table>
	</div>
	
	<input type="text" id="sample6_postcode" placeholder="우편번호">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" id="sample6_address" placeholder="주소"><br>
	<input type="text" id="sample6_detailAddress" placeholder="상세주소">
	<input type="text" id="sample6_extraAddress" placeholder="참고항목">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
};

$(function(){
	Chart.defaults.global.defaultFontColor = 'white';
	new Chart($('#myChart1'),{
		type : 'line',
		data : {
				labels : ['3월17일', '3월24일', '3월31일', '4월7일', '4월14일'],
				datasets : [{
								label : '득점', 
								data : [3, 1, 4, 2, 5], 
								fill : false, 
								borderColor : 'rgb(75, 192, 192)', 
								lineTension : 0.3
								}]
				},
		options : {
			maintainAspectRatio: false
		}
	});
	
	new Chart($('#myChart2'),{
		type : 'line',
		data : {
				labels : ['3월17일', '3월24일', '3월31일', '4월7일', '4월14일'],
				datasets : [{
								label : '도움', 
								data : [1, 0, 3, 2, 1], 
								fill : false, 
								borderColor : 'rgba(153, 102, 255, 1)', 
								lineTension : 0.3
								}]
				},
		options : {
			maintainAspectRatio: false
		}
	});
});
</script>

<jsp:include page="../footer.jsp"></jsp:include>
