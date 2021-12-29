package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserDAO;


@WebServlet("/signUp")
public class SignUpProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("u_id");
		String userPw = request.getParameter("u_pw");
		String userName = request.getParameter("u_name");
		String userBirth = request.getParameter("u_birth");
		String userGender = request.getParameter("u_gender");
		String userTel1 = request.getParameter("u_tel1");
		String userTel2 = request.getParameter("u_tel2");
		String userTel3 = request.getParameter("u_tel3");
		String userTel = userTel1 + "-" + userTel2 + "-" + userTel3;
		String userEmail1 = request.getParameter("u_email1");
		String userEmail2 = request.getParameter("u_email2");
		String userEmail = userEmail1 + "@" + userEmail2;
		
		HttpSession session = request.getSession();
		
		UserDAO dao = new UserDAO();
		
		try {
			dao.userInsert(userId, userPw, userName, userBirth, userGender, userTel, userEmail);
			dao.login(userId, userPw);
			session.setAttribute("u_id", userId);
			response.sendRedirect("/homepage2/home/homePage.jsp");
			
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

}
