<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	HttpSession sess =  request.getSession();
	
	if(sess == null) {
	    response.sendRedirect("LoginPage.html");
	    return;
	}
	
	String email = (String) session.getAttribute("username");
	System.out.println("this is  email from delete account "+email);
	
	if (email == null) {
	    response.sendRedirect("LoginPage.html");
	    return;
	}
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingmanagementsystem?user=root&password=root");
	PreparedStatement ps = con.prepareStatement("delete from createaccount where email = ?");
	
	ps.setString(1, email);
	 int rows = ps.executeUpdate();
	 System.out.println(rows);
	 if(rows>0)
	 {
		 
		 response.sendRedirect("LoginPage.html");
	 }
	 else
	 {
		 PrintWriter pw= response.getWriter();
		 pw.println("<html><body><p>not deleted</p></body></html>");
	 }



%>

</body>
</html>