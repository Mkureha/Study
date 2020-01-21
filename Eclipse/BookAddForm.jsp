<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Add</title>
</head>
<body>
	<h1>Book Add</h1>
	<form action="<%=request.getContextPath()%>/book/BookAdd.jsp"
		method="post">
		<div>BookNum :</div>
		<div>
			<input name="BookNum" id="BookNum" type="text" />
		</div>
		<div>BookTitle :</div>
		<div>
			<input name="BookTitle" id="BookTitle" type="text" />
		</div>
		<div>Book_color1 :</div>
		<div>
			<textarea name="Book_color1" id="Book_color1" rows="5" cols="50"></textarea>
		</div>
		<div>Book_color2 :</div>
		<div>
			<textarea name="Book_color2" id="Book_color2" rows="5" cols="50"></textarea>
		</div>
		<div>BookPW :</div>
		<div>
		    <input name="BookPW" id="BookPW" type="password" />
		</div>
		<div>
			<input type="submit" value="OK" /> <input type="reset" value="reset" />
		</div>
	</form>
</body>
</html>