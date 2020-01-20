<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String BookNum = request.getParameter("BookNum");
		System.out.println("param BookNum:" + BookNum);
		String BookTitle = request.getParameter("BookTitle");
		System.out.println("param BookTitle:" + BookTitle);
		String Book_color1 = request.getParameter("Book_color1");
		System.out.println("param Book_color1:" + Book_color1);
		String Book_color2 = request.getParameter("Book_color2");
		System.out.println("param Book_color2:" + Book_color2);

		String dbUrl = "jdbc:mysql://localhost:3306/tosyo";
		String dbUser = "root";
		String dbPw = "gngs1234";
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			String sql = "INSERT INTO tosyo_master(tosyo_num, tosyo_name, tosyo_daibunrui, tosyo_cyubunrui) VALUE(?, ?, ?, ?)";
			statement = connection.prepareStatement(sql);
			statement.setString(1, BookNum);
			statement.setString(2, BookTitle);
			statement.setString(3, Book_color1);
			statement.setString(4, Book_color2);
			statement.executeUpdate();
			//  response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			out.print("Input Error");
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
	%>
</body>
</html>
