package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.BoardDTO;
import model.UserDTO;


public class BoardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public List<BoardDTO> viewBoardList() throws NamingException, SQLException {
		
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		try{
			Context init = new InitialContext();
		    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
		    conn = ds.getConnection();
			
//			String sql = "select * from board b join user u on b.u_id = u.u_id order by b_reg_date desc";
			String sql = "select *, count(c_no) from board b left join comment c on b.b_no = c.b_no left join user u on u.u_id = b.u_id group by b.b_no order by b.b_no desc";
			
			
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				BoardDTO dto = new BoardDTO();
				
				dto.setB_no(rs.getString("b_no"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_writer(rs.getString("b_writer"));
				dto.setB_pw(rs.getString("b_pw"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_reg_date(rs.getTimestamp("b_reg_date"));
				dto.setB_update_date(rs.getTimestamp("b_update_date"));
				dto.setB_views(rs.getString("b_views"));
				dto.setU_id(rs.getString("u_id"));
				
				dto.setU_grade(rs.getString("u_grade"));
				
				if(rs.getString("u_grade").equals("admin")) {
					dto.setU_name(rs.getString("u_name")+"(관리자)");
				}else {
					dto.setU_name(rs.getString("u_name"));
				}
				dto.setC_cnt(rs.getString("count(c_no)"));
				
				Date now = new Date();
				
				dto.setDiff_date_r(now.getTime()-rs.getTimestamp("b_reg_date").getTime());
				
				boardList.add(dto);
				
			}
			
		}catch(SQLException ex){
			System.out.println("board select 실패");
		}finally{
			rs.close();
			pstmt.close();
			conn.close();
		}
		return boardList;
	}
	
	
	public List<BoardDTO> viewBoardList(String boardNo) throws NamingException, SQLException {
		
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		try{
			Context init = new InitialContext();
		    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
		    conn = ds.getConnection();
			
			String sql = "select * from board b join user u on b.u_id = u.u_id where b_no=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, boardNo);
			
			rs = pstmt.executeQuery();
			
//			String grade = rs.getString("u_grade");
//			System.out.println(grade);
			
			while(rs.next()){
				
				BoardDTO dto = new BoardDTO();
				
				dto.setB_no(rs.getString("b_no"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_writer(rs.getString("b_writer"));
				dto.setB_pw(rs.getString("b_pw"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_reg_date(rs.getTimestamp("b_reg_date"));
				dto.setB_update_date(rs.getTimestamp("b_update_date"));
				
				dto.setB_views(rs.getString("b_views"));
				dto.setU_id(rs.getString("u_id"));
				
				dto.setU_grade(rs.getString("u_grade"));
				
				if(rs.getString("u_grade").equals("admin")) {
					dto.setU_name(rs.getString("u_name")+"(관리자)");
				}else {
					dto.setU_name(rs.getString("u_name"));
				}
				
				boardList.add(dto);
			}
			
		}catch(SQLException ex){
			System.out.println("board select 실패");
		}finally{
			rs.close();
			pstmt.close();
			conn.close();
		}
		return boardList;
	}
	
	
	public List<BoardDTO> boardViewContent(String boardNo) throws NamingException, SQLException {
		
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		try{
			Context init = new InitialContext();
		    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
		    conn = ds.getConnection();
		    
			/*
			 * String sql_u = "update board set b_views=b_views+1 where b_no = ?";
			 * 
			 * pstmt = conn.prepareStatement(sql_u);
			 * 
			 * pstmt.setString(1, boardNo);
			 * 
			 * pstmt.executeUpdate();
			 * 
			 * 
			 * 
			 * pstmt.close(); conn.close();
			 * 
			 * conn = null; pstmt = null;
			 * 
			 * conn = ds.getConnection();
			 */
		    
			String sql = "select * from board b join user u on b.u_id = u.u_id where b_no=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				BoardDTO dto = new BoardDTO();
				
				dto.setB_no(rs.getString("b_no"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_writer(rs.getString("b_writer"));
				dto.setB_pw(rs.getString("b_pw"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_reg_date(rs.getTimestamp("b_reg_date"));
				dto.setB_update_date(rs.getTimestamp("b_update_date"));
				dto.setB_views(rs.getString("b_views"));
				dto.setU_id(rs.getString("u_id"));
				
				dto.setU_grade(rs.getString("u_grade"));
				
				if(rs.getString("u_grade").equals("admin")) {
					dto.setU_name(rs.getString("u_name")+"(관리자)");
				}else {
					dto.setU_name(rs.getString("u_name"));
				}
				
				boardList.add(dto);
				
			}
			
		}catch(SQLException ex){
			System.out.println("board content select 실패");
		}finally{
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
		}
		return boardList;
	}
	
	public void updateBoardViews(String boardNo) throws NamingException, SQLException {
		try{
			Context init = new InitialContext();
		    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
		    conn = ds.getConnection();
		    
		    String sql_u = "update board set b_views=b_views+1 where b_no = ?";
			
			pstmt = conn.prepareStatement(sql_u);
			
			pstmt.setString(1, boardNo);
			
			pstmt.executeUpdate();
			
			
		}catch(SQLException ex){
			System.out.println("updateBoardViews 실패");
			
		}finally{
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
		}
		
	}
	
	public void boardInsert(String userId, String checkBox, String boardTitle, String boardWriter, String boardPw, String boardContent) throws NamingException, SQLException {
		

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
			conn = ds.getConnection();

			if(checkBox.equals("1")) {
				String sql = "insert into board(b_title, b_writer, b_pw, b_content, u_id) values (?, ?, ?, ?, ?)";

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, boardTitle);
				pstmt.setString(2, boardWriter);
				pstmt.setString(3, boardPw);
				pstmt.setString(4, boardContent);
				pstmt.setString(5, userId);

				pstmt.executeUpdate();
				
			}else if(checkBox.equals("0")) {

				String sql = "insert into board(b_title, b_writer, b_content, u_id) values (?, ?, ?, ?)";

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, boardTitle);
				pstmt.setString(2, boardWriter);
				pstmt.setString(3, boardContent);
				pstmt.setString(4, userId);

				pstmt.executeUpdate();
				
			}
		} catch (SQLException ex) {
			System.out.println("게시물 등록 실패");
		} finally {
			pstmt.close();
			conn.close();
		}
	}
	
	
	
	public List<BoardDTO> searchBoardList(String searchOpt, String searchVal) throws NamingException, SQLException {
		
		List<BoardDTO> searchBoardList = new ArrayList<BoardDTO>();
		
		try{
			Context init = new InitialContext();
		    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
		    conn = ds.getConnection();
			
		    String sql = "select *, count(c_no) from board b left join comment c on b.b_no = c.b_no left join user u on u.u_id = b.u_id where " + searchOpt + " like '%" + searchVal + "%' group by b.b_no order by b.b_no desc";
		    
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()){
				
				BoardDTO dto = new BoardDTO();
				
				dto.setB_no(rs.getString("b_no"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_writer(rs.getString("b_writer"));
				dto.setB_pw(rs.getString("b_pw"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_reg_date(rs.getTimestamp("b_reg_date"));
				dto.setB_update_date(rs.getTimestamp("b_update_date"));
				dto.setB_views(rs.getString("b_views"));
				dto.setU_id(rs.getString("u_id"));
				dto.setU_grade(rs.getString("u_grade"));
				
				if(rs.getString("u_grade").equals("admin")) {
					dto.setU_name(rs.getString("u_name")+"(관리자)");
				}else {
					dto.setU_name(rs.getString("u_name"));
				}
				dto.setC_cnt(rs.getString("count(c_no)"));
				
				Date now = new Date();
				
				dto.setDiff_date_r(now.getTime()-rs.getTimestamp("b_reg_date").getTime());
				
				searchBoardList.add(dto);
			}
			
		}catch(SQLException ex){
			System.out.println("board search 실패");
		}finally{
			rs.close();
			pstmt.close();
			conn.close();
		}
		return searchBoardList;
	}

	
	public void boardDelete(String boardNo) throws SQLException {
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
			conn = ds.getConnection();
			
			String sql = "delete from board where b_no=" + boardNo;
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.executeUpdate();
			
			init(conn, pstmt, rs);
			
			
		} catch (Exception e) {
			System.out.println("게시물 삭제 실패");
			
		} finally {
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
	    }
		
	}
	
	public void boardUpdate(String checkBox, String boardTitle, String boardWriter, String boardPw, String boardContent, String boardNo) throws NamingException, SQLException {
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
			conn = ds.getConnection();
			
			if(checkBox.equals("1")) {
				String sql = "update board set b_title=?, b_writer=?, b_pw=?, b_content=?, b_update_date=now() where b_no=?";

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, boardTitle);
				pstmt.setString(2, boardWriter);
				pstmt.setString(3, boardPw);
				pstmt.setString(4, boardContent);
				pstmt.setString(5, boardNo);

				pstmt.executeUpdate();
				
			}else if(checkBox.equals("0")) {

				String sql = "update board set b_title=?, b_writer=?, b_pw=null, b_content=?, b_update_date=now() where b_no=?";

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, boardTitle);
				pstmt.setString(2, boardWriter);
				pstmt.setString(3, boardContent);
				pstmt.setString(4, boardNo);

				pstmt.executeUpdate();
				
			}
			
			

//			if(checkBox.equals("1")) {
//				String sql = "update board set b_title=?, b_writer=?, b_pw=?, b_content=? where b_no=?";
//
//				pstmt = conn.prepareStatement(sql);
//				
//				pstmt.setString(1, boardTitle);
//				pstmt.setString(2, boardWriter);
//				pstmt.setString(3, boardPw);
//				pstmt.setString(4, boardContent);
//				pstmt.setString(5, boardNo);
//
//				pstmt.executeUpdate();
//				
//			}else if(checkBox.equals("0")) {
//
//				String sql = "update board set b_title=?, b_writer=?, b_content=? where b_no=?";
//
//				pstmt = conn.prepareStatement(sql);
//				
//				pstmt.setString(1, boardTitle);
//				pstmt.setString(2, boardWriter);
//				pstmt.setString(3, boardContent);
//				pstmt.setString(4, boardNo);
//
//				pstmt.executeUpdate();
//				
//			}
			
		} catch (SQLException ex) {
			System.out.println("게시물 수정 실패");
		} finally {
			pstmt.close();
			conn.close();
		}
		
	}
	
	public void init(Connection conn, PreparedStatement pstmt, ResultSet rs) throws SQLException {

      int count = 0;
      String sql = "select count(*) as 'count' from board";

      try {
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            count = rs.getInt("count");
         }

         String sqlList[] = { "SET @CNT = 0",
               "UPDATE board SET board.b_no = @CNT:=@CNT+1", 
               "ALTER TABLE board AUTO_INCREMENT=" + (count + 1) };

         for (int i = 0; i < 3; i++) {
            pstmt = conn.prepareStatement(sqlList[i]);
            pstmt.executeUpdate();
         }

      } finally {
         if (rs != null) {
            rs.close();
         }
      }
   }

}
