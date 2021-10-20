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

import model.BoardDTO;
import model.UserDTO;
import service.BoardDAO;
import service.CommentDAO;
import service.UserDAO;


@WebServlet("/viewUserList")
public class ViewUserListProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UserDAO dao = new UserDAO();
		List<UserDTO> usersList;
		
		try {
			usersList = dao.viewUserList();
			request.setAttribute("usersList", usersList);
				
			String page = "/management/viewUserListPage.jsp";
				
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
				
				
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
