package Operations;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAcc extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String un=req.getParameter("un");
		
		String pass=req.getParameter("ps");
		
		
		String unDb=null;
		String passDb=null;
		
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingmanagementsystem?user=root&password=root");
			
			PreparedStatement ps= con.prepareStatement("SELECT email,pass FROM createaccount where email=?");
			ps.setString(1, un);
			ResultSet rs= ps.executeQuery();
			while(rs.next())
			{
				unDb=rs.getString(1);
				passDb= rs.getString(2);
			}
			
		
			
			if(un.equals(unDb)&&pass.equals(passDb))
			{
				
				 HttpSession session = req.getSession();
		         session.setAttribute("username", un);
		         resp.sendRedirect("Home.html");
		        				
			}
			else
			{
				if(!un.equals(unDb))
				{
					
					PrintWriter pw= resp.getWriter();
					pw.write("<html><p>enter valid mail</p></html>");
					
				}
				else if(!pass.equals(passDb))
				{
					PrintWriter pw= resp.getWriter();
					pw.write("<html><p>enter valid pass</p></html>");
				}
				

				RequestDispatcher rd=req.getRequestDispatcher("LoginPage.html");
				rd.include(req, resp);
				
			}
		}
			
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
	}
	

}
