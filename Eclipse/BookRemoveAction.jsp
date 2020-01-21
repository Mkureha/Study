<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOOK REMOVE ACTION</title>
</head>
<body>
	<%
		if (request.getParameter("BookNum") == null || request.getParameter("BookPW") == null) {
			response.sendRedirect(request.getContextPath()+"/book/BookList.jsp");
		} else {
			String BookNum = request.getParameter("BookNum");
			System.out.println("BookNum :" + BookNum);
			String BookPW = request.getParameter("BookPW");
			System.out.println("BookPW :" + BookPW);
			String dbUrl = "jdbc:mysql://localhost:3306/tosyo";
			String dbUser = "root";
			String dbPw = "gngs1234";
			Connection connection = null;
			PreparedStatement statement = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
				String sql = "DELETE FROM tosyo_master WHERE tosyo_num=? AND tosyo_pw=?";
				statement = connection.prepareStatement(sql);
				statement.setString(1, BookNum);
				statement.setString(2, BookPW);
				if (statement.executeUpdate() == 1) {
					response.sendRedirect(request.getContextPath()+"/book/BookList.jsp");
				} else {
					response.sendRedirect(request.getContextPath()+"/book/BookRemoveForm.jsp?BookNum="+BookNum);
				}
			} catch (Exception e) {
				e.printStackTrace();
				out.print("BOOK REMOVE ERROR!");
			} finally {
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