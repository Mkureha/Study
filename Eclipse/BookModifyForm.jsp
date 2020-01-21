<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta meta-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOOK MODIFY FORM</title>
</head>
<body>
<h1>BOOK MODIFY</h1>
<%
if(request.getParameter("BookNum") == null) {
	response.sendRedirect(request.getContextPath()+"/book/BookList.jsp");
} else {
	String BookNum = request.getParameter("BookNum");
	System.out.println("BookModify param BookNum:"+BookNum);
	String Book_Title = "";
	String Book_Color1 = "";
	String Book_Color2 = "";
	
	String dbUrl = "jdbc:mysql://localhost:3306/tosyo";
	String dbUser = "root";
	String dbPw = "gngs1234";
	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
		String selectSql = "SELECT tosyo_name, tosyo_daibunrui, tosyo_cyubunrui FROM tosyo_master WHERE tosyo_num=?";
		statement = connection.prepareStatement(selectSql);
		statement.setString(1, BookNum);
		resultSet = statement.executeQuery();
		if(resultSet.next()) {
			Book_Title = resultSet.getString("tosyo_name");
			Book_Color1 = resultSet.getString("tosyo_daibunrui");
			Book_Color2 = resultSet.getString("tosyo_cyubunrui");
		} else {
			response.sendRedirect(request.getContextPath()+"book/BookList.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.print("BOOK MODIFy FROM ERROR!");
	} finally {
		try {resultSet.close();} catch(Exception e){}
		try {statement.close();} catch(Exception e){}
		try {connection.close();} catch(Exception e){}
	}
%>
<form action="<%=request.getContextPath()%>/book/BookModifyAction.jsp" method="post">
<div>BookNum</div>
<div><input name="BookNum" value="<%=BookNum%>" type="text" readonly="readonly"/></div>
<div>Confirm Password : </div>
<div><input name="BookPW" id="BookPW" type="password"/></div>
<div>Book_Title :</div>
<div><input name="Book_Title" value="<%=Book_Title%>" id="Book_Title" type="text"/></div>
<div>Book_Color1 :</div>
<div><textarea name="Book_Color1" id="Book_Color1" rows="5" cols="50"><%=Book_Color1%></textarea></div>
<div>Book_Color2 :</div>
<div><textarea name="Book_Color2" id="Book_Color2" rows="5" cols="50"><%=Book_Color2%></textarea></div>
<div>
<input type="Submit" value="Modify"/>
<input type="reset" value="reset"/>
</div>
</form>
<%
}
%>
</body>
</html>