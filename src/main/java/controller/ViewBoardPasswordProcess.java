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


@WebServlet("/viewBoardPassword")
public class ViewBoardPasswordProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardNo = request.getParameter("b_no");
		
		HttpSession session = request.getSession();
		String userGrade = "";
		
		if(session.getAttribute("u_grade") == null) {
			userGrade = "";
		}else {
			userGrade = (String) session.getAttribute("u_grade");
		}
		
		BoardDAO dao = new BoardDAO();
		
		List<BoardDTO> boardContentList;
		
		
		if(userGrade.equals("admin")) {
			try {
				
				boardContentList = dao.boardViewContent(boardNo);
				request.setAttribute("boardContentList", boardContentList);
					
				String page = "/viewBoardContent?b_no="+boardNo;
				RequestDispatcher dispatcher = request.getRequestDispatcher(page);
				dispatcher.forward(request, response);
					
			} catch (NamingException | SQLException e) {
				e.printStackTrace();
			}
				
		}else {
			try {
				boardContentList = dao.boardViewContent(boardNo);
				request.setAttribute("boardContentList", boardContentList);
					
				String page = "/board/viewContent/viewBoardPasswordPage.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(page);
				dispatcher.forward(request, response);
					
			} catch (NamingException | SQLException e) {
				e.printStackTrace();
			}
		}

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
