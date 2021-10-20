package model;

import java.sql.Timestamp;

public class BoardDTO {
	private String b_no;
	private String b_title;
	private String b_writer;
	private String b_pw;
	private String b_content;
	private Timestamp b_reg_date;
	private Timestamp b_update_date;
	private long diff_date_r;
	private long diff_date_u;
	private String b_views;
	private String u_id; 
	private String u_grade;
	private String u_name;
	private String c_cnt;
	

	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(String b_no) {
		this.b_no = b_no;
	}

	public String getB_no() {
		return b_no;
	}

	public void setB_no(String b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public String getB_pw() {
		return b_pw;
	}

	public void setB_pw(String b_pw) {
		this.b_pw = b_pw;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public Timestamp getB_reg_date() {
		return b_reg_date;
	}

	public void setB_reg_date(Timestamp b_reg_date) {
		this.b_reg_date = b_reg_date;
	}

	public Timestamp getB_update_date() {
		return b_update_date;
	}

	public void setB_update_date(Timestamp b_update_date) {
		this.b_update_date = b_update_date;
	}

	public String getB_views() {
		return b_views;
	}

	public void setB_views(String b_views) {
		this.b_views = b_views;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_grade() {
		return u_grade;
	}

	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getC_cnt() {
		return c_cnt;
	}

	public void setC_cnt(String c_cnt) {
		this.c_cnt = c_cnt;
	}

	public long getDiff_date_r() {
		return diff_date_r;
	}

	public void setDiff_date_r(long diff_date_r) {
		this.diff_date_r = diff_date_r;
	}

	public long getDiff_date_u() {
		return diff_date_u;
	}

	public void setDiff_date_u(long diff_date_u) {
		this.diff_date_u = diff_date_u;
	}

	@Override
	public String toString() {
		return "BoardDTO [b_no=" + b_no + ", b_title=" + b_title + ", b_writer=" + b_writer + ", b_pw=" + b_pw
				+ ", b_content=" + b_content + ", b_reg_date=" + b_reg_date + ", b_update_date=" + b_update_date
				+ ", diff_date_r=" + diff_date_r + ", diff_date_u=" + diff_date_u + ", b_views=" + b_views + ", u_id="
				+ u_id + ", u_grade=" + u_grade + ", u_name=" + u_name + ", c_cnt=" + c_cnt + "]";
	}

	

	

}
