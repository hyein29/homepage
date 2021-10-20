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
import service.BoardDAO;
import service.CommentDAO;
import service.UserDAO;


@WebServlet("/viewBoardList")
public class ViewBoardListProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BoardDAO dao = new BoardDAO();
		List<BoardDTO> boardList;

		
		try {
			boardList = dao.viewBoardList();
			request.setAttribute("boardList", boardList);
				
			String page = "/board/view/viewBoardPage.jsp";
				
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
				
				
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
