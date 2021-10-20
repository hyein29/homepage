package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.BoardDTO;
import model.UserDTO;


public class UserDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	
	public void userInsert(String userId, String userPw, String userName, String userBirth, String userGender, String userTel, String userEmail) throws NamingException, SQLException {
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
			conn = ds.getConnection();

			String sql = "insert into user(u_id, u_pw, u_name, u_birth, u_gender, u_tel, u_email) values (?, ?, ?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			pstmt.setString(3, userName);
			pstmt.setString(4, userBirth);
			pstmt.setString(5, userGender);
			pstmt.setString(6, userTel);
			pstmt.setString(7, userEmail);

			pstmt.executeUpdate();			

		} catch (SQLException ex) {
			System.out.println("회원가입 실패");
		} finally {
			pstmt.close();
			conn.close();
		}
	}


	public int idChecker(String userId) throws NamingException, SQLException {
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
			conn = ds.getConnection();
			
			String sql = "select * from user where u_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return 1;
			} else if (userId.equals("")) {
				return 2;
			} else {
				return 0;
			}
		} catch (Exception e) {
			System.out.println("아이디 비교 실패");
			
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return -1;
	}
	
	
	public String login(String userId, String userPw) throws NamingException, SQLException {
		
		String res = "";
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
			conn = ds.getConnection();
			
			
			String sql = "select * from user where u_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				if(userId.equals(rs.getString("u_id"))){
					if(userPw.equals(rs.getString("u_pw"))) {
						res = "success";
						return res;
					}else {
						res = "wrongPw";
						return res;
					}
				}
			}else {
				res = "wrongId";
				return res;
			}	
			
		} catch (Exception e) {
			System.out.println("로그인 실패");
			
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
	    }
		return res;
	}
	
	
	public List<UserDTO> viewUserinfo(String userId) throws SQLException {
		
		List<UserDTO> userList = new ArrayList<UserDTO>();
		
		try {
			
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
			conn = ds.getConnection();
			
			String sql = "select * from user where u_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				UserDTO dto = new UserDTO();
				
				dto.setU_no(rs.getString("u_no"));
				dto.setU_id(rs.getString("u_id"));
				dto.setU_pw(rs.getString("u_pw"));
				dto.setU_name(rs.getString("u_name"));
				dto.setU_birth(rs.getString("u_birth"));
				dto.setU_gender(rs.getString("u_gender"));
				dto.setU_tel(rs.getString("u_tel"));
				dto.setU_email(rs.getString("u_email"));
				dto.setU_grade(rs.getString("u_grade"));
				dto.setU_reg_date(rs.getString("u_reg_date"));
				
				
				if(rs.getString("u_grade").equals("admin")) {
					dto.setB_writer_name(rs.getString("u_name")+"(관리자)");
				}else {
					dto.setB_writer_name(rs.getString("u_name"));
				}
				
				userList.add(dto);
				
			}

		} catch (Exception e) {
			System.out.println("viewUserinfo 실패");
			
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
	    }
		
		
		return userList;
	}
	
	public void userUpdate(String userId, String userPw, String userName, String userBirth, String userGender, String userTel, String userEmail) throws NamingException, SQLException {
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
			conn = ds.getConnection();

			String sql = "update user set u_pw=?, u_name=?, u_birth=?, u_gender=?, u_tel=?, u_email=? where u_id=?";

			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userPw);
			pstmt.setString(2, userName);
			pstmt.setString(3, userBirth);
			pstmt.setString(4, userGender);
			pstmt.setString(5, userTel);
			pstmt.setString(6, userEmail);
			pstmt.setString(7, userId);

			pstmt.executeUpdate();
			
			
			
			pstmt.close();
			conn.close();
			
			conn = null;
			pstmt = null;
			
			conn = ds.getConnection();
			
			String sql_u = "update board set b_writer = '" + userName + "' where u_id = '" + userId + "'";
			
			pstmt = conn.prepareStatement(sql_u);
			
			pstmt.executeUpdate();	
			

		} catch (SQLException ex) {
			System.out.println("회원정보수정 실패");
		} finally {
			pstmt.close();
			conn.close();
		}
	}
	
	
	public void userUpdate(String userId, String userGrade) throws NamingException, SQLException {
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
			conn = ds.getConnection();

			String sql = "update user set u_grade=? where u_id=?";

			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userGrade);
			pstmt.setString(2, userId);

			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			

		} catch (SQLException ex) {
			System.out.println("등급 수정 실패");
		} finally {
			pstmt.close();
			conn.close();
		}
	}
	
	
	public void userDelete(String userId) throws NamingException, SQLException {
		
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
			conn = ds.getConnection();
			
			
			String sql = "delete from user where u_id=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			pstmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.out.println("회원탈퇴 실패");
			
		} finally {
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
	    }
		
	}
	
	
	public List<UserDTO> viewUserList() throws NamingException, SQLException {
		
		List<UserDTO> userList = new ArrayList<UserDTO>();
		
		try{
			Context init = new InitialContext();
		    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
		    conn = ds.getConnection();
			
			String sql = "select * from user order by u_no desc";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				UserDTO dto = new UserDTO();
				
				dto.setU_no(rs.getString("u_no"));
				dto.setU_id(rs.getString("u_id"));
				dto.setU_pw(rs.getString("u_pw"));
				dto.setU_name(rs.getString("u_name"));
				dto.setU_birth(rs.getString("u_birth"));
				dto.setU_gender(rs.getString("u_gender"));
				dto.setU_tel(rs.getString("u_tel"));
				dto.setU_email(rs.getString("u_email"));
				dto.setU_grade(rs.getString("u_grade"));
				dto.setU_reg_date(rs.getString("u_reg_date"));
				
				userList.add(dto);
			}
		}catch(SQLException ex){
			System.out.println("userList select 실패");
		}finally{
			rs.close();
			pstmt.close();
			conn.close();
		}
		return userList;
	}
	
	

}
