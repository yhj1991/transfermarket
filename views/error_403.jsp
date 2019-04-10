<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>접근할 수 없는 페이지</title>
</head>
<body>
	<div align="center">
		접근할 수 없는 페이지입니다.<br />
		<a href="${pageContext.request.contextPath}/main.do">TransferMarket 홈으로</a>
	</div>
</body>
</html>