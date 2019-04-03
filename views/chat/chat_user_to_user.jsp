<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1:1 대화방</title>
	<link href="${pageContext.request.contextPath}/resources/bootstrap-4.3.1/css/bootstrap.min.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/resources/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap-4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
	<div class="row">
		<div style="width:400px; height:380px; border: 1px solid #cccccc; border-radius:0.3em">
			<div id="out" style="height:270px; overflow:auto;"></div>
			<div style="height:120px;">
				<textarea class="form-control" style="height:80px; resize:none;" id="txt" placeholder="메시지 입력"></textarea>
				<input type="button" class="btn btn-dark form-control" id="btn" style="height:40px" value="전송" />
			</div>
		</div>
	</div>
</div>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="id"/>
</sec:authorize>
<script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
<script>
var client;
var topic = '<c:out value="${topic.topic}" />';
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
		console.log(arr[0]);
		console.log(arr[1]);
		console.log(arr[2]);
		console.log(arr[3]);
		console.log(arr[4]);
		$('#out').append('<a href="#" class="chat_user" style="color:black;">' + arr[3] + '</a>' + " : " + obj.payloadString + '<br />');
	}
}

function mySuccess(){
	console.log('success');
	client.subscribe("ds/class603/" + topic + "/#");
}

$(function(){
	$.post('http://211.110.165.201:3000/mqtt_server_info', {key:'ds603'}, function(data){
		if(data.ret == 'y'){
			setup(data.host, data.port, '${id}_' + Math.floor(Math.random()*1000));
		}
		else{
			alert('서버에 접속할 수 없습니다.')
		}	
	},'json');
	
	$('#btn').click(function(){
		var msg = $('#txt').val();
		message = new Paho.MQTT.Message(msg);
		message.destinationName = 'ds/class603/' + topic + '/${id}';
		client.send(message);
	});
});
</script>
</body>
</html>