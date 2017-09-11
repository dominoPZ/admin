package controller.dto;

import java.sql.Date;
import java.util.List;

public class SalDTO {
	

	private String qty;
	private String name;
	private String size;
	private String price;
	private List<ToppingDTO> topping;
	private String kind;
	private String sm_no;
	private String menu_no;
	private String orgprice;
	private String doughname;
	
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getSm_no() {
		return sm_no;
	}
	public void setSm_no(String sm_no) {
		this.sm_no = sm_no;
	}
	public String getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(String menu_no) {
		this.menu_no = menu_no;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
		

	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}

	public List<ToppingDTO> getTopping() {
		return topping;
	}
	public void setTopping(List<ToppingDTO> topping) {
		this.topping = topping;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getOrgprice() {
		return orgprice;
	}
	public void setOrgprice(String orgprice) {
		this.orgprice = orgprice;
	}
	public String getDoughname() {
		return doughname;
	}
	public void setDoughname(String doughname) {
		this.doughname = doughname;
	}
	
	
	
	
}
