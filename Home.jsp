<%@page import="java.sql.ResultSet"%>
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
<style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        body{
            background-color: #86888b;
            color: #e3d6d6;
        }
        header{
            background-color: #0a2540;
            padding: 15px 40px;
        }

        .navbar{
            display: flex;
            justify-content: space-between;
            align-items: center;

        }
        .logo{
            color: #ffffff;
            font-size: 22px;
        }

        .nav-links{
            list-style:none;
            display: flex;
            gap: 30px;
        }
        .nav-links li{
            color: #ffffff;
            cursor: pointer;
            font-size: 15px;
        }

        .nav-links li:hover{
            text-decoration: underline;
        }


        main{
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
        }
        .profile-summery{
            /* border: 20px solid; */
            background-color: #ffffff;
            padding: 20px;
            border-radius: 6px;
            margin-bottom: 25px;
            border-left: 5px solid #0a2540;
        }

        .profile-summery h3{
            margin-bottom: 15px;
            color: #0a2540;
        }

        .profile-summery div{
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            row-gap: 10px;
        }

        .profile-section, 
         main section:not(.profile-summery):not(.profile-section){
            background-color: #ffffff;
            padding: 20px;
            border-radius: 6px;
            margin-bottom: 25px;
             border-left: 5px solid #0a2540;
        }
        .profile-section h3,
        main section h3{
            margin-bottom: 15px;
            color: #0a2540;

        }

        .profile-section div,
         main section div{
            display: grid;
            grid-template-columns: repeat(2,1fr);
            row-gap: 10px;
        }

        p{
            font-size: 14px;
            color: #333;
        }






    </style>
</head>
<body>

<%

	HttpSession sess = request.getSession();
	if (sess == null || sess.getAttribute("username") == null) {
	      response.sendRedirect("LoginPage.html");
	      return;
	  }
	
	String email = (String) sess.getAttribute("username");
	
	
	
	
	
	String firstName=null;
	String lastName = null;
	String em = null;
	String pass = null;
	String phoneNum = null;
	String address = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingmanagementsystem?user=root&password=root");
	PreparedStatement ps= con.prepareStatement("SELECT firstName,lastName,email,phoneNum,Address FROM createaccount where email=?");
	ps.setString(1, email);
	ResultSet rs= ps.executeQuery();
	if(rs.next())
	{
		firstName = rs.getString("firstName");
        lastName = rs.getString("lastName");
        phoneNum = rs.getString("phoneNum");
        address = rs.getString("Address");
        em = rs.getString("email");
	}
	

	
%>

	<header>
        <nav class="navbar">
             <h2 class="logo">Banking Solutions</h2>
           
            <ul class="nav-links">
                <li>Dashboard</li>
                <li><a href='Update.html'>Update</a></li>
                
            </ul>
        </nav>
    </header>
    
    <main>
        <section class="profile-summery">
            <h3>Customer Profile</h3>
            <div>
                <p><strong>Name:</strong><%=firstName %> <%=lastName %></p>
                <p><strong>Customer Id:</strong></p>
                <p><strong>Account Status:</strong></p>
            </div>
        </section>

        <section class="profile-section">
            <h3>Account Information</h3>
            <div>
                <p><strong>Account Number :</strong></p>
                <p><strong>Account Type :</strong></p>
                <p><strong>Branch :</strong></p>
                <p><strong>IFSC :</strong></p>
            </div>

        </section>

        <section>
            <h3>Contact Details</h3>
            
            <div>
                <p><strong>Email:</strong><%= em %></p>
                <p><strong>Mobile:</strong><%= phoneNum %></p>
                <p><strong>Address:</strong><%= address %></p>
            </div>
        </section>
    </main>
    
    
    




</body>
</html>