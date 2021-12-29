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


@WebServlet("/deleteBoardComment")
public class DeleteBoardCommentProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String boardNo = request.getParameter("b_no");
		String deleteCommentNo = request.getParameter("c_no");
		String commentNo = deleteCommentNo.substring(6);
		
		CommentDAO dao = new CommentDAO();
		
		try {
			dao.commentDelete(commentNo);
			
			response.sendRedirect("/homepage2/viewBoardContent?b_no="+boardNo);
			
//			String page = "/viewBoardContent?b_no"+boardNo;
//			
//			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
//			dispatcher.forward(request, response);
			
		} catch (SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

}
