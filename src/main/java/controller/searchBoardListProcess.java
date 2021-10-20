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
import service.UserDAO;


@WebServlet("/searchBoardList")
public class searchBoardListProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String opt = request.getParameter("opt");
		String val = request.getParameter("boardSearchVal");
		
		BoardDAO dao = new BoardDAO();
		
		List<BoardDTO> searchBoardList;
		
		
		try {
			searchBoardList = dao.searchBoardList(opt, val);
			request.setAttribute("searchBoardList", searchBoardList);
			request.setAttribute("searchOption", opt);
			request.setAttribute("searchValue", val);
				
			String page = "/board/search/searchBoardPage.jsp";
				
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
				
				
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

}
