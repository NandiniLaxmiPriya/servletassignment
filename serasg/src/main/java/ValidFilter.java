

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet Filter implementation class ValidFilter
 */
public class ValidFilter extends HttpFilter implements Filter {
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		String password = request.getParameter("password");
		boolean set = false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection myconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/serprac","root","Root@123");
			PreparedStatement ps = myconn.prepareStatement("select * from users");
//			ps.setInt(2, 4);
//			ps.setString(1,"orange");
			PrintWriter out = response.getWriter(); 

			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				System.out.println(rs.getString(1)+" "+rs.getString(2));
				if(password.equals(rs.getString(2)))
				{
				set = true;	
				break;
				}
			}
			if(set)
			{
				chain.doFilter(request, response);
				
			}else {
				out.println("<script type=\"text/javascript\">"); 
				out.println("alert('user doesnot exists..');"); 
				out.println("</script>");
				 RequestDispatcher rs2 = request.getRequestDispatcher("index.jsp");
		            rs2.include(request, response);
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}


}
