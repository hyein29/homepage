package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserDAO;


@WebServlet("/login2")
public class LoginProcess2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userId = request.getParameter("u_id");
		String userPw = request.getParameter("u_pw");
		
		System.out.println("userId========== "+userId);
		System.out.println("userPw========== "+userPw);
		
		UserDAO dao = new UserDAO();
		
		try {
			String result = dao.login(userId, userPw);
			/* response.getWriter().print(result); */
			
			
			if(result.equals("1")) {
				
				/*
				 * request.setCharacterEncoding("utf-8");
				 * response.setCharacterEncoding("utf-8");
				 * 
				 * PrintWriter out = response.getWriter();
				 * 
				 * out.println("<html>"); out.println("<head><title></title></head>");
				 * out.println("<body>"); out.println("<script>");
				 * 
				 * 
				 * out.println("alert('아이디가 없습니다.')");
				 * 
				 * 
				 * out.println("</script>"); out.println("</body></html>");
				 */
			
				response.sendRedirect("/homepage2/home/homePage.jsp");
			}
			
//			response.sendRedirect();
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
