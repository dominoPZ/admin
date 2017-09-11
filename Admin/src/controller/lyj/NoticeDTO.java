package controller.lyj;

public class NoticeDTO {
	
	// 공지사항
	private String n_no;
	private String n_title;
	private String n_content;
	private java.sql.Date n_date;
	private String n_img;
	private String n_type;
	private String n_count;

	public String getN_no() {
		return n_no;
	}

	public void setN_no(String n_no) {
		this.n_no = n_no;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public java.sql.Date getN_date() {
		return n_date;
	}

	public void setN_date(java.sql.Date n_date) {
		this.n_date = n_date;
	}

	public String getN_img() {
		return n_img;
	}

	public void setN_img(String n_img) {
		this.n_img = n_img;
	}

	public String getN_type() {
		return n_type;
	}

	public void setN_type(String n_type) {
		this.n_type = n_type;
	}

	public String getN_count() {
		return n_count;
	}

	public void setN_count(String n_count) {
		this.n_count = n_count;
	}

	
}
