package controller.lyj;

public class EventDTO {
	
	// 이벤트
	private String e_no;
	private String e_title;
	private java.sql.Date e_sdate;
	private java.sql.Date e_edate;
	private String e_timg;
	private String e_cimg;
	
	public String getE_no() {
		return e_no;
	}

	public void setE_no(String e_no) {
		this.e_no = e_no;
	}

	public String getE_title() {
		return e_title;
	}

	public void setE_title(String e_title) {
		this.e_title = e_title;
	}

	public java.sql.Date getE_sdate() {
		return e_sdate;
	}

	public void setE_sdate(java.sql.Date e_sdate) {
		this.e_sdate = e_sdate;
	}

	public java.sql.Date getE_edate() {
		return e_edate;
	}

	public void setE_edate(java.sql.Date e_edate) {
		this.e_edate = e_edate;
	}

	public String getE_timg() {
		return e_timg;
	}

	public void setE_timg(String e_timg) {
		this.e_timg = e_timg;
	}

	public String getE_cimg() {
		return e_cimg;
	}

	public void setE_cimg(String e_cimg) {
		this.e_cimg = e_cimg;
	}

}
