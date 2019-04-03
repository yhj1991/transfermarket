<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Transfer Market</title>
	<script src="${pageContext.request.contextPath}/resources/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap-4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<script>
	$(function(){
		alert('${msg}');
		window.location.replace('${url}');
	});
</script>

</body>
</html>
