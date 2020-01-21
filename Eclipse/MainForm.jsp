<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MAIN</title>

<script type="text/javascript">
	// 로그아웃 담당 JSP로 이동
	function LogoutPro() {
		location.href = "/book/LogoutPro.jsp";
	}
</script>
</head>
<body>
	<b><font size="5" color="skyblue">This is Main Screen</font></b>
	<br>
	<br>
	<%
		if (session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
		{
			// 로그인 화면으로 이동
			response.sendRedirect("/book/LoginForm.jsp");
		} else // 로그인 했을 경우
		{
	%>

	<h2>
		<font color="red"><%=session.getAttribute("sessionID")%></font> is
		Login
	</h2>

	<br>
	<br>
	<input type="button" value="LogOUT" onclick="LogoutPro()" />

	<%
		}
	%>
</body>
</html>