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
		HttpSession s = request.getSession();
		 
		
		  if (s == null || s.getAttribute("username") == null) {
	           response.sendRedirect("LoginPage.html");
	           return;
	       }
		  
		  String email = (String) s.getAttribute("username");
		  System.out.println(email+"in updateservlet");
		
		String firstName = request.getParameter("fn");
		String lastName = request.getParameter("ln");
		String phoneNum = request.getParameter("ph");
		String Address = request.getParameter("add");
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver class loaded and register");
		Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingmanagementsystem?user=root&password=root");
		System.out.println("connection established");
	    
		PreparedStatement ps=  con.prepareStatement("update createaccount set  firstName=?,lastName=?,phoneNum=?,address=? where email=?");
		ps.setString(1, firstName);
		ps.setString(2, lastName);
		ps.setString(3, phoneNum);
		ps.setString(4, Address);
		ps.setString(5, email);
		
		int rows = ps.executeUpdate();
		if(rows>0)
		{
			 response.sendRedirect("home");
		}
		else
		{
			PrintWriter pw =  response.getWriter();
			pw.println("<html><body><h1>Updation failed</h1></body></html>");
		}
		
		System.out.println("statement");
	
%>
	
	
	
</body>
</html>