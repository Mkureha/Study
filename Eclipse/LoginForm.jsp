<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOOK LIBARAY SYSTEM</title>

<script type="text/javascript">
function checkValue()
{
	inputForm = eval("document.loginInfo");
	if(!inputForm.id.value)
		{
		alert("Please,Input The id");
		inputForm.id.focus();
		return false;
		}
	if(!inputForm.password.value)
		{
		alert("Please,Input THe password");
		inputForm.password.focus();
		return false;
		}
	}
</script>
</head>
<body>
	<h1>BOOK LIBARAY LOGIN</h1>
	<div id="wrap">
		<form name="loginInfo" method="post" action=""
			onsubmit="return checkValue()">
			<br>
			<br>
			<table>
				<tr>
					<td bgcolor="skyblue">E-Mail</td>
					<td><input type="text" name="id" maxlength="50"></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">Password</td>
					<td><input type="password" name="password" maxlength="50"></td>
				</tr>
			</table>
			<br> <input type="submit" value="Login" />
		</form>
		<%
			String msg = request.getParameter("msg");

			if (msg != null && msg.equals("0")) {
				out.println("<br>");
				out.println("<font color='red' size='5'>Please, Check Your Password.</font>");
			} else if (msg != null && msg.equals("-1")) {
				out.println("<br>");
				out.println("<font color='red' size='5'>Please, Check Your E-mail.</font>");
			}
		%>
	</div>
</body>
</html>