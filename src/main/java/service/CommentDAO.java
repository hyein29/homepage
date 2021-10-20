package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.BoardDTO;
import model.CommentDTO;
import model.UserDTO;


public class CommentDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	public List<CommentDTO> viewCommentList(String boardNo, String userGrade) throws NamingException, SQLException {
		
		List<CommentDTO> commentList = new ArrayList<CommentDTO>();
		
		
		try{
			Context init = new InitialContext();
		    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
		    conn = ds.getConnection();
			
			String sql = "select * from comment c join user u on c.u_id = u.u_id where b_no = ? order by c_no desc";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()){
				
				CommentDTO dto = new CommentDTO();
				
				dto.setC_no(rs.getString("c_no"));
				dto.setC_writer(rs.getString("c_writer"));
				dto.setC_content(rs.getString("c_content"));
				dto.setC_reg_date(rs.getString("c_reg_date"));
				dto.setC_update_date(rs.getString("c_update_date"));
				dto.setB_no(rs.getString("b_no"));
				dto.setU_id(rs.getString("u_id"));
				
				if(userGrade.equals("admin")) {
					dto.setU_name(rs.getString("u_name")+"(관리자)");
				}else {
					dto.setU_name(rs.getString("u_name"));
				}
				
				commentList.add(dto);
			}
			
		}catch(SQLException ex){
			System.out.println("comment select 실패");
		}finally{
			rs.close();
			pstmt.close();
			conn.close();
		}
		return commentList;
		
	}
	
	
	
	
	public void boardViewContent(String boardNo, String boardViews) throws NamingException, SQLException {
		
	}
	
	
	public void updateViews(String boardViews, String boardNo) throws NamingException, SQLException {
		
	}
	
	
	
	
	
	public void commentInsert(String userId, String commentWriter, String commentContent, String boardNo) throws NamingException, SQLException {
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
			conn = ds.getConnection();

			String sql = "insert into comment(c_writer, c_content, b_no, u_id) values (?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
				
			pstmt.setString(1, commentWriter);
			pstmt.setString(2, commentContent);
			pstmt.setString(3, boardNo);
			pstmt.setString(4, userId);

			pstmt.executeUpdate();
				
			
		} catch (SQLException ex) {
			System.out.println("댓글 등록 실패");
		} finally {
			pstmt.close();
			conn.close();
		}
	}
	
	
	
	public void searchBoardList(String searchOpt, String searchVal) throws NamingException, SQLException {
		
		
	}

	
	public void commentDelete(String commentNo) throws SQLException, NamingException {
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
			conn = ds.getConnection();

			String sql = "delete from comment where c_no = " + commentNo;
			
			pstmt = conn.prepareStatement(sql);

			pstmt.executeUpdate();
				
		} catch (SQLException ex) {
			System.out.println("댓글 삭제 실패");
		} finally {
			pstmt.close();
			conn.close();
		}
		
	}
	
	public void commentUpdate(String commentContent, String commentNo) throws NamingException, SQLException {
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
			conn = ds.getConnection();

			String sql = "update comment set c_content = ?, c_update_date = now() where c_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, commentContent);
			pstmt.setString(2, commentNo);

			pstmt.executeUpdate();
				
		} catch (SQLException ex) {
			System.out.println("댓글 수정 실패");
		} finally {
			pstmt.close();
			conn.close();
		}
		
		
		
		
	}
	
//	public String countComment(String boardNo) throws NamingException, SQLException {
//		
//		String comment_cnt = "0";
//		
//		try{
//			Context init = new InitialContext();
//		    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
//		    conn = ds.getConnection();
//			
//			String sql = "select count(*) from comment where b_no = ?";
//			
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setString(1, boardNo);
//			
//			rs = pstmt.executeQuery();
//
//			while(rs.next()) {
//				comment_cnt = rs.getString("count(*)");
//				System.out.println("comment_cnt = "+ comment_cnt);
//			}
//			
//			
//			
//		}catch(SQLException ex){
//			System.out.println("comment count 실패");
//		}finally{
//			rs.close();
//			pstmt.close();
//			conn.close();
//		}
//		
//		return comment_cnt;
//		
//	}

	

}
