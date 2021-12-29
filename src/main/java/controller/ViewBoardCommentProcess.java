package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.CommentDTO;
import service.CommentDAO;


@WebServlet("/viewBoardComment")
public class ViewBoardCommentProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession();
		
		
		String userGrade = "";
		
		if(session.getAttribute("u_grade")!=null) {
			userGrade = (String) session.getAttribute("u_grade");
		}
		
		
		
		String boardNo = request.getParameter("b_no");
		
		CommentDAO dao = new CommentDAO();
		
		List<CommentDTO> boardCommentList;
		
		try {
			boardCommentList = dao.viewCommentList(boardNo, userGrade);
			String boardCommentListToJson = new Gson().toJson(boardCommentList);
						
			response.getWriter().println(boardCommentListToJson);
			
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
