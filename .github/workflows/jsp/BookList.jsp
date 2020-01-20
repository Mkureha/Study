<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOOK LIST</title>
</head>
<body>
<h1>BOOK LIST</h1>
<%
int currentPage = 1;
if(request.getParameter("currentPage") != null) {
currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

int totalRowCount = 0;

String dbUrl = "jdbc:mysql://localhost:3306/tosyo";
String dbUser = "root";
String dbPw = "gngs1234";
Connection connection = null;
PreparedStatement totalStatement = null;
PreparedStatement listStatement = null;
ResultSet totalResultSet = null;
ResultSet listResultSet = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
    
    String totalSql = "SELECT COUNT(*) FROM tosyo_master";
    totalStatement = connection.prepareStatement(totalSql);
    totalResultSet = totalStatement.executeQuery();
    if(totalResultSet.next()) {
        totalRowCount = totalResultSet.getInt(1);
    }
%>
<div>Total Row CNT : <%=totalRowCount%></div>
<%
int pagePerRow = 10;
String listSql = "SELECT tosyo_num, tosyo_name, tosyo_daibunrui, tosyo_cyubunrui FROM tosyo_master ORDER BY tosyo_num DESC LIMIT ?, ?";
listStatement = connection.prepareStatement(listSql);
listStatement.setInt(1, (currentPage-1)*pagePerRow);
listStatement.setInt(2, pagePerRow);
listResultSet = listStatement.executeQuery();
%>
<table border="1">
<thead>
<tr>
<th>BookName</th>
<th>Book_Color1</th>
<th>Book_Color2</th>
</tr>
</thead>
<tbody>
<%
while(listResultSet.next()) {
%>
<tr>
<td>
<a href="<%=request.getContextPath()%>/book/BookView.jsp?BookNum=<%=listResultSet.getString("tosyo_num")%>">
<%=listResultSet.getString("tosyo_name")%>
</a>
</td>
<td><%=listResultSet.getString("tosyo_daibunrui")%></td>
<td><%=listResultSet.getString("tosyo_cyubunrui")%></td>
</tr>
<%
}
%>
</tbody>
</table>
<div>
<a href="<%=request.getContextPath()%>/book/BookAddForm.jsp">Input The New Book Info</a>
</div>
<%
int lastPage = totalRowCount/pagePerRow;
if(totalRowCount%pagePerRow != 0) {
lastPage++;
}
%>
<div>
<%
if(currentPage>1) {
%>
<a href="<%=request.getContextPath()%>/book/BookList.jsp?currentPage=<%=currentPage-1%>">Previous</a>
<%
}
if(currentPage < lastPage) {
%>
<a href="<%=request.getContextPath()%>/book/BookList.jsp?currentPage=<%=currentPage+1%>">Next</a>
<%
}
%>
</div>
<%
} catch(Exception e) {
e.printStackTrace();
out.print("Load Error!");
} finally {
try {totalResultSet.close();} catch(Exception e){}
try {listResultSet.close();} catch(Exception e){}
try {totalStatement.close();} catch(Exception e){}
try {listStatement.close();} catch(Exception e){}
try {connection.close();} catch(Exception e){}
}
%>

</body>
</html>
