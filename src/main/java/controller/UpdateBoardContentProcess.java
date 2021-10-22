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
import service.BoardDAO;
import service.UserDAO;


@WebServlet("/updateBoardContent")
public class UpdateBoardContentProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardTitle = request.getParameter("b_title");
		String boardWriter = request.getParameter("b_writer");
		String boardPw = request.getParameter("b_pw");
		String boardContent = request.getParameter("b_content");
		
		String boardNo = request.getParameter("b_no");
		
		String checkBox = null;
		
		if(request.getParameter("checkbox") == null) {
			checkBox = "0";
		}else{
			checkBox = request.getParameter("checkbox");
		}
		
		BoardDAO dao = new BoardDAO();
		
		try {
			dao.boardUpdate(checkBox, boardTitle, boardWriter, boardPw, boardContent, boardNo);

			String page = "/viewBoardContent?b_no"+boardNo;
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
			
			
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String boardTitle = request.getParameter("b_title");
		String boardWriter = request.getParameter("b_writer");
		String boardPw = request.getParameter("b_pw");
		String boardContent = request.getParameter("b_content");
		
		String boardNo = request.getParameter("b_no");
		
		boardTitle = XssReplace(boardTitle);
		boardContent = XssReplace(boardContent);
		
		String checkBox = null;
		
		if(request.getParameter("checkbox") == null) {
			checkBox = "0";
		}else{
			checkBox = request.getParameter("checkbox");
		}
		
		BoardDAO dao = new BoardDAO();
		
		try {
			dao.boardUpdate(checkBox, boardTitle, boardWriter, boardPw, boardContent, boardNo);

			String page = "/viewBoardContent?b_no"+boardNo;
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
			
			
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	public static String XssReplace(String str) {
	      
      str = str.replaceAll("&", "&amp;");
      str = str.replaceAll("\"", "&quot;");
      str = str.replaceAll("'", "&apos;");
      str = str.replaceAll("<", "&lt;");
      str = str.replaceAll(">", "&gt;");
      str = str.replaceAll("\r", "<br>");
      str = str.replaceAll("\n", "<p>");

      return str;
   }

}
