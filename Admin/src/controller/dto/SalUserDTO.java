package controller.dto;

import java.sql.Date;
import java.util.List;

public class SalUserDTO {
	
	private String no;
	private String name;
	private String addr;
	private String s_date;
	private String pro;
	private List<SalDTO> sdto;
	private String tel;
	private String id;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getPro() {
		return pro;
	}
	public void setPro(String pro) {
		this.pro = pro;
	}
	public List<SalDTO> getSdto() {
		return sdto;
	}
	public void setSdto(List<SalDTO> sdto) {
		this.sdto = sdto;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
