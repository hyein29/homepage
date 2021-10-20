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


@WebServlet("/insertBoardComment")
public class InsertBoardCommentProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("u_id");
		String commentWriter = request.getParameter("c_writer");
		String commentContent = request.getParameter("c_content");
		String boardNo = request.getParameter("b_no");
		System.out.println(userId+ commentWriter+ commentContent+ boardNo);
		
		
		CommentDAO dao = new CommentDAO();
		
		try {
			dao.commentInsert(userId, commentWriter, commentContent, boardNo);
			
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
