<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOOK INFO VIEW</title>
</head>
<body>
	<h1>BOOK INFO</h1>
	<%
		if (request.getParameter("BookNum") == null) {
			response.sendRedirect(request.getContextPath() + "/book/BookList.jsp");
		} else {
			String BookNum = (request.getParameter("BookNum"));
			System.out.println("BookNum :"+BookNum);
			String dbUrl = "jdbc:mysql://localhost:3306/tosyo";
			String dbUser = "root";
			String dbPw = "gngs1234";
			Connection connection = null;
			PreparedStatement statement = null;
			ResultSet resultSet = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
				String sql = "SELECT tosyo_name, tosyo_daibunrui, tosyo_cyubunrui FROM tosyo_master WHERE tosyo_num=?";
				statement = connection.prepareStatement(sql);
				resultSet = statement.executeQuery();
				if (resultSet.next()) {
	%>
	<div>BookNum :</div>
	<div><%=resultSet.getString("tosyo_num")%></div>
	<div>Book_Title :</div>
	<div><%=resultSet.getString("tosyo_name")%></div>
	<div>Book_Color1 :</div>
	<div><%=resultSet.getString("tosyo_daibunrui")%></div>
	<div>Book_Color2 :</div>
	<div><%=resultSet.getString("tosyo_cyubunrui")%></div>
	<div>
		<a href="">UPDATE</a> <a href="">DELETE</a>
	</div>
	<%
		}
			} catch (Exception e) {
				e.printStackTrace();
				out.println("BOOK VIEW ERROR!");
			} finally {
				try {
					resultSet.close();
				} catch (Exception e) {
				}
				try {
					statement.close();
				} catch (Exception e) {
				}
				try {
					connection.close();
				} catch (Exception e) {
				}
			}
		}
	%>
</body>
</html>
