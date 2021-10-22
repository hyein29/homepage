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
import service.UserDAO;


@WebServlet("/viewBoardContent")
public class ViewBoardContentProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardNo = request.getParameter("b_no");
		
		BoardDAO dao = new BoardDAO();
		
		List<BoardDTO> boardContentList;
		
		String page = "";
		
		if(request.getParameter("update") != null) {
			page = "/board/update/updateBoardContentPage.jsp";
		}else {
			if(request.getParameter("updateComment") != null) {
				page = "/board/viewContent/comment/commentUpdatePage.jsp";
			}
			page = "/board/viewContent/viewBoardContentPage.jsp";
		}
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("u_id");
		
		UserDAO user_dao = new UserDAO();
		
		List<UserDTO> userList;
		
		try {
			userList = user_dao.viewUserinfo(userId);
			request.setAttribute("userList", userList);
			
			boardContentList = dao.boardViewContent(boardNo);
			request.setAttribute("boardContentList", boardContentList);
				
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
				
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardNo = request.getParameter("b_no");
		
		BoardDAO dao = new BoardDAO();
		
		List<BoardDTO> boardContentList;
		
		String page = "";
		
		if(request.getParameter("update") != null) {
			page = "/board/update/updateBoardContentPage.jsp";
		}else {
			if(request.getParameter("updateComment") != null) {
				page = "/board/viewContent/comment/commentUpdatePage.jsp";
			}
			page = "/board/viewContent/viewBoardContentPage.jsp";
		}
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("u_id");
		
		UserDAO user_dao = new UserDAO();
		
		List<UserDTO> userList;
		
		try {
			userList = user_dao.viewUserinfo(userId);
			request.setAttribute("userList", userList);
			
			boardContentList = dao.boardViewContent(boardNo);
			request.setAttribute("boardContentList", boardContentList);
				
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
				
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}
