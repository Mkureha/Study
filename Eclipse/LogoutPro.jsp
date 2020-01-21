<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGOUT</title>
</head>
<body>
	<%
		session.invalidate(); // 모든세션정보 삭제
		response.sendRedirect("/book/LoginForm.jsp"); // 로그인 화면으로 다시 돌아간다.
	%>
</body>
</html>