

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class SIgnup
 */
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname=request.getParameter("username");
		String lname=request.getParameter("lastname");
		String dob=request.getParameter("dob");
		int eid = Integer.parseInt(request.getParameter("eid"));
		String designation=request.getParameter("designation");
		String mail=request.getParameter("mail");
		String contactNo=request.getParameter("contactNo");
		String address=request.getParameter("address");
		String language=request.getParameter("language");
		String url=request.getParameter("url");
		String file=request.getParameter("file");
		String password=request.getParameter("password");
		
		PrintWriter out = response.getWriter(); 
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection myconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/serprac","root","Root@123");
			PreparedStatement ps = myconn.prepareStatement("insert into userdetails(eid,fname,lname,dob,designation,email,cno,address,language,link,pic,password)values(?,?,?,?,?,?,?,?,?,?,?,?)");
			
			if(contactNo.length()!=10)
			{
				
				out.println("<script type=\"text/javascript\">"); 
				out.println("alert('check contact no 10 digits only...');"); 
				out.println("location='SignUp.jsp';"); 
				out.println("</script>");
			}else{
			ps.setInt(1, eid);
			ps.setString(2,fname);
			ps.setString(3, lname);
			ps.setString(4,dob);
			ps.setString(5,designation);
			ps.setString(6,mail);
			ps.setString(7,contactNo);
			ps.setString(8,address);
			ps.setString(9,language);
			ps.setString(10,url);
			ps.setString(11, file);
			ps.setString(12, password);
			ps.executeUpdate();
			PreparedStatement ps2 = myconn.prepareStatement("insert into users(username,password)values(?,?)");
			
			ps2.setString(1, fname);
			ps2.setString(2,password);
			ps2.executeUpdate();
			 RequestDispatcher rs2 = request.getRequestDispatcher("ProfilePage.jsp");
	            rs2.forward(request, response);
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	}
