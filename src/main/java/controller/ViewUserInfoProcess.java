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


@WebServlet("/viewUserInfo")
public class ViewUserInfoProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("u_id");
//		String userGrade = (String) session.getAttribute("u_grade");
		
		
		String page = "";
		
		if(request.getParameter("modify") != null) {
			page = "/userInfo/updateUserInfoPage.jsp";
		}else {
			if(request.getParameter("write") != null) {
				page = "/board/insert/insertBoardContentPage.jsp";
			}else {
				page = "/userInfo/viewUserInfoPage.jsp";
			}
		}
		
		
		UserDAO dao = new UserDAO();
		
		List<UserDTO> userList;
		
		try {
//			userList = dao.viewUserinfo(userId, userGrade);
			userList = dao.viewUserinfo(userId);
			request.setAttribute("userList", userList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
