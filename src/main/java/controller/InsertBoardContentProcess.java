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


@WebServlet("/insertBoardContent")
public class InsertBoardContentProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("u_id");
		String boardTitle = request.getParameter("b_title");
		String boardWriter = request.getParameter("b_writer");
		String boardPw = request.getParameter("b_pw");
		String boardContent = request.getParameter("b_content");
		
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
			dao.boardInsert(userId, checkBox, boardTitle, boardWriter, boardPw, boardContent);
			
			String page = "/viewBoardList";
			
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
