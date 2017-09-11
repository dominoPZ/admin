package controller.dto;

public class SalesListDTO {

	/*
		판매일
		구매번호 (여러개 주문한 통합 번호 ex)피자+스파게티
		매장 일련번호(매장 지점 풍선도움말)
		일련번호
		구매한 메뉴명
		주문 수량
		주문 사이즈
		메뉴 가격
		총 금액""
		주문한 주소 (구매자가 주문한 주소)
		주문 상태
	 */
	
	/*
SELECT TO_CHAR(SA_DATE,'YYYY/MM/DD HH24:MI:SS') SA_DATE, 
S.SA_NO, ST_NO, SM_NO, MENU_NAME, MENU_QTY, MENU_SIZE, MENU_PRICE, 
(SELECT SUM(MENU_PRICE)
FROM SALES S JOIN SALES_MENU SM ON S.SA_NO = SM.SA_NO WHERE ID='KIM') TOTAL_PRICE, -> X
SA_ADDR, SA_PRO 
FROM SALES S JOIN SALES_MENU SM ON S.SA_NO = SM.SA_NO
WHERE ID=’KIM‘;

	 */
	
	private String sa_date;
	private String sa_no; 
	private String st_no;
	private String sm_no;
	private String menu_name;
	private String menu_qty;
	private String menu_size;
	private String menu_price;
	private String sa_addr;
	private String sa_pro;
	
	//효율성 위함
	private String id;
	private String st_name;
	
	public String getSa_no() {
		return sa_no;
	}
	public void setSa_no(String sa_no) {
		this.sa_no = sa_no;
	}
	public String getSt_no() {
		return st_no;
	}
	public void setSt_no(String st_no) {
		this.st_no = st_no;
	}
	public String getSa_addr() {
		return sa_addr;
	}
	public void setSa_addr(String sa_addr) {
		this.sa_addr = sa_addr;
	}
	public String getSa_date() {
		return sa_date;
	}
	public void setSa_date(String sa_date) {
		this.sa_date = sa_date;
	}
	public String getSa_pro() {
		return sa_pro;
	}
	public void setSa_pro(String sa_pro) {
		this.sa_pro = sa_pro;
	}
	public String getSm_no() {
		return sm_no;
	}
	public void setSm_no(String sm_no) {
		this.sm_no = sm_no;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_qty() {
		return menu_qty;
	}
	public void setMenu_qty(String menu_qty) {
		this.menu_qty = menu_qty;
	}
	public String getMenu_size() {
		return menu_size;
	}
	public void setMenu_size(String menu_size) {
		this.menu_size = menu_size;
	}
	public String getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}	
	
}
