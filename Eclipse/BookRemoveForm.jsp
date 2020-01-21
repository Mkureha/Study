<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOOK REMOVE FORM</title>
</head>
<body>
	<%
		if (request.getParameter("BookNum") == null) {
			response.sendRedirect(request.getContextPath() + "/book/BookList.jsp");
		} else {
	%>
	<form action="<%=request.getContextPath()%>/book/BookRemoveAction.jsp"
		method="post">
		<input name="BookNum"
			value="<%=request.getParameter("BookNum")%>" type="hidden"/>
		<div>Input Password :</div>
		<div>
			<input name="BookPW" type="password">
		</div>
		<div>
			<input type="submit" value="delete" /> <input type="reset"
				value="reset" />
		</div>
	</form>
	<%
}
%>
</body>
</html>