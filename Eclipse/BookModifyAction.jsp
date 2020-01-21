<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
<title>BOOK MODIFY ACTION</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
if(request.getParameter("BookNum") == null || request.getParameter("BookPW") == null) {
	response.sendRedirect(request.getContextPath()+"/book/BookList.jsp");
} else {
	String BookNum = request.getParameter("BookNum");
	System.out.println("BookModifyAction param BookNum :"+BookNum);
	String Book_Title = request.getParameter("Book_Title");
	System.out.println("BookMOdifyAction param Book_Title :"+Book_Title);
	String Book_Color1 = request.getParameter("Book_Color1");
	System.out.println("BookModifyAction param Book_Color1 :"+Book_Color1);
	String Book_Color2 = request.getParameter("Book_Color2");
	System.out.println("BookMOdifyAction param Book_Color2 :"+Book_Color2);
	String BookPW = request.getParameter("BookPW");
	System.out.println("BookModifyAction param BookPW :"+BookPW);
	
	String dbUrl = "jdbc:mysql://localhost:3306/tosyo";
	String dbUser = "root";
	String dbPw = "gngs1234";
	Connection connection = null;
	PreparedStatement statement = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
		String selectSql = "UPDATE tosyo_master SET tosyo_name=?, tosyo_daibunrui=?, tosyo_cyubunrui=? WHERE tosyo_num=? AND tosyo_pw=?";
		statement = connection.prepareStatement(selectSql);
		statement.setString(1, Book_Title);
		statement.setString(2, Book_Color1);
		statement.setString(3, Book_Color2);
		statement.setString(4, BookNum);
		statement.setString(5, BookPW);
		statement.executeUpdate();
		response.sendRedirect(request.getContextPath()+"/book/BookView.jsp?BookNum="+BookNum);
	} catch(Exception e) {
		e.printStackTrace();
		out.print("BOOK MODIFY ERROR!");
	} finally {
		try {statement.close();} catch(Exception e){}
		try {connection.close();} catch(Exception e){}
	}
}
%>
</body>
</html>