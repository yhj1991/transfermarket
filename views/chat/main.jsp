<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<jsp:include page="../header.jsp"></jsp:include>

<div class="container">
	<h3>채팅</h3>
	<div class="row">
		<div style="width:300px; height:600px; border: 1px solid #cccccc; border-radius:0.3em">
			<div id="out" style="height:450px; overflow:auto;"></div>
			<div style="height:150px;">
				<textarea class="form-control" style="height:110px; resize:none;" id="txt" placeholder="메시지 입력"></textarea>
				<input type="button" class="btn btn-dark form-control" id="btn" style="height:40px" value="전송" />
			</div>
		</div>
		
		<div style="width:5px"></div>
		
		<div style="width:300px; height:600px; border: 1px solid #cccccc; border-radius:0.3em">
			<div id="users_count" style="height:30px;"></div>
			<div id="users" style="height:570px; border-top:0.4px solid #cccccc"></div>
		</div>
	</div>
</div>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="id"/>
</sec:authorize>

<script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
<script>
$('#txt').focus();
var client;
function setup(h,p,c){
	client = new Paho.MQTT.Client(h,p,c);
	client.onConnectionLost = myConnectionLost;
	client.onMessageArrived = myMessageArrived;
	var options = {
		timeout : 3,
		onSuccess : mySuccess
	};
	client.connect(options);
}

function myConnectionLost(obj){
	console.log('disconnection',obj);
}

function myMessageArrived(obj){
	console.log('messageArrived', obj);
	if(true){
		window.open("chat_user_to_user.do?id1=${id}&id2=" + id, "test", "width=400,height=400");
	}
	var idx_in = obj.destinationName.lastIndexOf('server/in');
	var idx_out = obj.destinationName.lastIndexOf('server/out');
	
	if( (idx_in > -1) || (idx_out > -1) ) {
		var json_obj = JSON.parse(obj.payloadString);
	    var json_obj_len = json_obj.length;
		$('#users').empty();
		$('#users_count').empty();
		
		for(var i=0;i<json_obj_len;i++){
			$('#users').append(
					'<div class="dropdown">'+
						'<a href="#" class="dropdown-toggle chat_users" style="color:black;" id="dropdownUsers" data-toggle="dropdown"'+ 
									'aria-haspopup="true" aria-expanded="false">' + json_obj[i].client_id + '</a>'+
						'<div class="dropdown-menu" aria-labelledby="dropdownUsers">'+
							'<a href="#" class="dropdown-item menu1">회원정보</a>'+
							'<a href="#" class="dropdown-item menu2">1:1 대화</a>'+
						'</div>'+
					'</div>'
			);
		}
		// 채팅방 사용자 인원표시
		$('#users_count').append(
			'<span> 총 사용자 : ' + json_obj_len + '명</span>'		
		);
	}
	else { 
		// ds/class603/a
		var arr = (obj.destinationName).split("/");
		$('#out').append('<a href="#" class="chat_user" style="color:black;">' + arr[3] + '</a>' + " : " + obj.payloadString + '<br />');
	}
}

function mySuccess(){
	console.log('success');
	client.subscribe('ds/class603/main/#');
}

$(function(){
	$.post('http://211.110.165.201:3000/mqtt_server_info', {key:'ds603'}, function(data){
		if(data.ret == 'y'){
			setup(data.host, data.port, '${id}');
		}
		else{
			alert('서버에 접속할 수 없습니다.')
		}	
	},'json');
	
	$('#btn').click(function(){
		var msg = $('#txt').val();
		message = new Paho.MQTT.Message(msg);
		message.destinationName = "ds/class603/main/${id}";
		client.send(message);
		$('#txt').val('');
		$('#txt').focus();
	});
});

$(document).on('click', '.menu1', function(){
	var idx = $(this).index('.menu1');
	var id = $('.chat_users').eq(idx).text();
	window.open("member_info.do?id=" + id, "test", "width=400,height=400" );
});

$(document).on('click', '.menu2', function(){
	var idx = $(this).index('.menu2');
	var id = $('.chat_users').eq(idx).text();
	var user = '${id}';
	// if(user == id){
	var msg = '<a href="chat_user_to_user.do" style="color:black;">1:1 대화요청이 왔습니다.</a>';
	message = new Paho.MQTT.Message(msg);
	message.destinationName = "ds/class603/main/server";
	client.send(message);
	// }
	window.open("chat_user_to_user.do?id1=${id}&id2=" + id, "test", "width=400,height=400");	
});

</script>
</body>
</html>
