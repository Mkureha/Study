<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.member.model.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGIN</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

			String EMail = request.getParameter("id");
			String pw = request.getParameter("password");

			jsp.member.model.MemberDAO dao = jsp.member.model.MemberDAO.getInstance();
			int check = dao.loginCheck(id, pw);

			String msg = "";

			if (check == 1) {
		session.setAttribute("sessionID", id);
		msg = "/book/MainForm.jsp";
			} else if (check == 0) {
		msg = "/book/LoginForm.jsp?msg=0";
			} else {
		msg = "/book/LoginForm.jsp?msg=1";
			}
			response.sendRedirect(msg);
	%>
</body>
</html>