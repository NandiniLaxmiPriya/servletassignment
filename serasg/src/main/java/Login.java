

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//		if(username.equals("admin") && password.equals("admin"))
//		{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
//		session.setAttribute("username", username);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection myconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/serprac","root","Root@123");
			PreparedStatement ps = myconn.prepareStatement("select * from userdetails where fname=?");
//			ps.setInt(2, 4);
			ps.setString(1,username);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				System.out.println(rs.getString(1)+" "+rs.getString(2));
				session.setAttribute("username", username);
				session.setAttribute("designation", rs.getString(5));
				session.setAttribute("address", rs.getString(8));
				session.setAttribute("cno", rs.getString(7));
				session.setAttribute("mail", rs.getString(6));
				session.setAttribute("link", rs.getString(10));
				session.setAttribute("language", rs.getString(9));
				session.setAttribute("file", rs.getString(11));
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		response.sendRedirect("ProfilePage.jsp");
//			PrintWriter out = response.getWriter(); 
//			out.println("<script type=\"text/javascript\">"); 
//			out.println("alert('check contact no 10 digits only...');"); 
//			out.println("location='ProfilePage.html';"); 
//			out.println("console.log(document.getElementById('pname').innerHTML);"); 
//
//			out.println("</script>");
//		}
	}

}
