package model;


public class CommentDTO {
	private String c_no;
	private String c_writer;
	private String c_content;
	private String c_reg_date;
	private String c_update_date;
	private String b_no;
	private String u_id;
	private String u_name;


	public CommentDTO() {
		// TODO Auto-generated constructor stub
	}

	public CommentDTO(String c_no) {
		this.c_no = c_no;
	}

	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getC_writer() {
		return c_writer;
	}

	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	
	public String getC_reg_date() {
		return c_reg_date;
	}

	public void setC_reg_date(String c_reg_date) {
		this.c_reg_date = c_reg_date;
	}

	public String getC_update_date() {
		return c_update_date;
	}

	public void setC_update_date(String c_update_date) {
		this.c_update_date = c_update_date;
	}

	public String getB_no() {
		return b_no;
	}

	public void setB_no(String b_no) {
		this.b_no = b_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	@Override
	public String toString() {
		return "CommentDTO [c_no=" + c_no + ", c_writer=" + c_writer + ", c_content=" + c_content + ", c_reg_date="
				+ c_reg_date + ", c_update_date=" + c_update_date + ", b_no=" + b_no + ", u_id=" + u_id + ", u_name="
				+ u_name + "]";
	}

	
	
}
