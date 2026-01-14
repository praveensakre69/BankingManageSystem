package Operations;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateAc extends HttpServlet
{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String firstName = req.getParameter("fn");
		
		
		String lastName =req.getParameter("ln");
		
		String dob = req.getParameter("dob");
		
		
		String gender = req.getParameter("gender");
		
		
		String mobile = req.getParameter("mobile");
		
		
		String email = req.getParameter("email");

		
		String address = req.getParameter("address");

		
		String pan = req.getParameter("pan");

		
		String aadhar = req.getParameter("aadhar");
		
				
		String accountType = req.getParameter("accountType");
	
				
					
		String deposit = req.getParameter("deposit");
		
					
		String nomineeName = req.getParameter("nomineeName");
	
		
		String nomineeRelation = req.getParameter("nomineeRelation");
		
				
		
		
		Connection con=null;
		PreparedStatement ps=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingmanagementsystem?user=root&password=root");
			
			String sql =
				    "INSERT INTO account_request " +
				    "(first_name, last_name, dob, gender, mobile, email, address, pan, aadhar, " +
				    "account_type, deposit, nominee_name, nominee_relation, status, request_date) " +
				    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'PENDING', CURDATE())";

			ps=  con.prepareStatement(sql);
			
			ps.setString(1, firstName);
			
			ps.setString(2, lastName);
			ps.setDate(3, Date.valueOf(dob));
			ps.setString(4, gender);
			ps.setString(5, mobile);
			ps.setString(6,email);
			ps.setString(7, address);
	        ps.setString(8, pan);
	        ps.setString(9, aadhar);
	        ps.setString(10, accountType);
	        ps.setBigDecimal(11, new BigDecimal(deposit));
	        ps.setString(12, nomineeName);
	        ps.setString(13, nomineeRelation);
			
	        System.out.println("before execute update");
			int rows = ps.executeUpdate();
			System.out.println("After execute update");
			
			
			if(rows >0)
			{
				req.setAttribute("msg", "Your account request has been submitted. Await admin approval.");
				RequestDispatcher rd=  req.getRequestDispatcher("request-success.jsp");
				rd.forward(req, resp);
				
			}
			else
			{
				req.setAttribute("msg", "Bank account request failed");
				RequestDispatcher rd = req.getRequestDispatcher("request-failed.jsp");
				rd.forward(req, resp);
				
				
			}
			
			
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			req.setAttribute("msg", "something went wrong");
			RequestDispatcher rd =  req.getRequestDispatcher("request-failed.jsp");
			rd.forward(req, resp);
		}
		finally {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	

}
