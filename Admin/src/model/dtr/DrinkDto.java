package model.dtr;

public class DrinkDto {

	//맴버변수
	String dr_no;
	String d_name;
	String d_price;
	String d_img;
	
	//GetSet
	
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_price() {
		return d_price;
	}
	public void setD_price(String d_price) {
		this.d_price = d_price;
	}
	public String getD_img() {
		return d_img;
	}
	public void setD_img(String d_img) {
		this.d_img = d_img;
	}
	public String getDr_no() {
		return dr_no;
	}
	public void setDr_no(String dr_no) {
		this.dr_no = dr_no;
	}
	
}
