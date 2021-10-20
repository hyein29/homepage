package model;

public class UserDTO {
	private String u_no;
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_birth;
	private String u_gender;
	private String u_tel;
	private String u_email;
	private String u_grade;
	private String u_reg_date;
	private String b_writer_name;

	public UserDTO() {
		// TODO Auto-generated constructor stub
	}

	public UserDTO(String u_id) {
		this.u_id = u_id;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_birth() {
		return u_birth;
	}

	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public String getU_tel() {
		return u_tel;
	}

	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_grade() {
		return u_grade;
	}

	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}

	public String getU_reg_date() {
		return u_reg_date;
	}

	public void setU_reg_date(String u_reg_date) {
		this.u_reg_date = u_reg_date;
	}

	public String getB_writer_name() {
		return b_writer_name;
	}

	public void setB_writer_name(String b_writer_name) {
		this.b_writer_name = b_writer_name;
	}

	@Override
	public String toString() {
		return "UserDTO [u_no=" + u_no + ", u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_birth="
				+ u_birth + ", u_gender=" + u_gender + ", u_tel=" + u_tel + ", u_email=" + u_email + ", u_grade="
				+ u_grade + ", u_reg_date=" + u_reg_date + ", b_writer_name=" + b_writer_name + "]";
	}

	

}
