package controller.dto;

import java.util.List;

public class PizzaMenuListDTO {
	
	private String id;
	private String p_no;
	private String p_name;
	private String p_img;
	private String p_lprice;
	private String p_sprice;
	private String d_price;
	private List<P_nutrientDTO> list;
	private String p_kind;
	private String p_topping;
	private String p_origin;
	private String p_himg;
	private String p_dimg;
	private String p_detail;
	
	
	public String getP_kind() {
		return p_kind;
	}
	public void setP_kind(String p_kind) {
		this.p_kind = p_kind;
	}
	public String getP_topping() {
		return p_topping;
	}
	public void setP_topping(String p_topping) {
		this.p_topping = p_topping;
	}
	public String getP_origin() {
		return p_origin;
	}
	public void setP_origin(String p_origin) {
		this.p_origin = p_origin;
	}
	public String getP_himg() {
		return p_himg;
	}
	public void setP_himg(String p_himg) {
		this.p_himg = p_himg;
	}
	public String getP_dimg() {
		return p_dimg;
	}
	public void setP_dimg(String p_dimg) {
		this.p_dimg = p_dimg;
	}
	public String getP_detail() {
		return p_detail;
	}
	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getP_lprice() {
		return p_lprice;
	}
	public void setP_lprice(String p_lprice) {
		this.p_lprice = p_lprice;
	}
	public String getP_sprice() {
		return p_sprice;
	}
	public void setP_sprice(String p_sprice) {
		this.p_sprice = p_sprice;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public String getD_price() {
		return d_price;
	}
	public void setD_price(String d_price) {
		this.d_price = d_price;
	}
	public List<P_nutrientDTO> getList() {
		return list;
	}
	public void setList(List<P_nutrientDTO> list) {
		this.list = list;
	}
	

	
	

}
