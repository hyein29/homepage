package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDTO;
import service.UserDAO;


@WebServlet("/updateUserInfo")
public class UpdateUserInfoProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("u_id");
		String userGrade = request.getParameter("u_grade");
		
		UserDAO dao = new UserDAO();
		
		try {
			dao.userUpdate(userId, userGrade);
			response.sendRedirect("/homepage2/viewUserList");
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("u_id");
		String userPw = request.getParameter("u_pw");
		
		String userName = request.getParameter("u_name");
		
		String userBirth1 = request.getParameter("u_birth1");
		String userBirth2 = request.getParameter("u_birth2");
		String userBirth3 = request.getParameter("u_birth3");
		String userBirth = userBirth1 + "/" + userBirth2 + "/" + userBirth3;
		
		String userGender = request.getParameter("u_gender");
		
		String userTel1 = request.getParameter("u_tel1");
		String userTel2 = request.getParameter("u_tel2");
		String userTel3 = request.getParameter("u_tel3");
		String userTel = userTel1 + "-" + userTel2 + "-" + userTel3;
		
		String userEmail = request.getParameter("u_email");
		
		UserDAO dao = new UserDAO();
		
		try {
			dao.userUpdate(userId, userPw, userName, userBirth, userGender, userTel, userEmail);
			response.sendRedirect("/homepage2/viewUserInfo");
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
