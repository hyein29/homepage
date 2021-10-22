package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDTO;
import model.UserDTO;
import service.UserDAO;


@WebServlet("/login")
public class LoginProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("u_id");
		String userPw = request.getParameter("u_pw");
		
		HttpSession session = request.getSession();
		
		UserDAO dao = new UserDAO();
		List<UserDTO> userList = new ArrayList<UserDTO>();
		
		try {
			String result = dao.login(userId, userPw);
			
			 if(result.equals("success")) { 
				 userList = dao.viewUserinfo(userId);
				 String userGrade = userList.get(0).getU_grade();
				 session.setAttribute("u_id", userId);
				 session.setAttribute("u_grade", userGrade);
				 
				 response.getWriter().print(result);
				 
			 }else {
				 response.getWriter().print(result);
			 }
			
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
