package controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import controller.dto.SalDTO;
import controller.dto.SalUserDTO;
import controller.dto.StoreDTO;
import controller.dto.ToppingDTO;

public class StoreDAO {
	
	//멤버변수]
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public StoreDAO(ServletContext context) {
		try {
			Context ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/domino");
			conn = source.getConnection();	
		} 
		catch (NamingException e) {e.printStackTrace();}
		catch (SQLException e) {e.printStackTrace();}
		
	}
	
	public void close(){
		try{
			
		if(conn!=null)
			conn.close();
		if(psmt!=null)
			psmt.close();
		if(rs!=null)
			rs.close();
		}catch (Exception e) {
		}
		
	}///close
	
	public int insert(StoreDTO dto){
		int i = 0;
		try{
		String sql = "insert into STORES VALUES(seq_stores_st_no.nextval,?,?,?,?,?,?,?,?)";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, dto.getSt_name());
		psmt.setString(2, dto.getSt_id());
		psmt.setString(3, dto.getSt_pass());
		psmt.setString(4, dto.getSt_tel());
		psmt.setString(5, dto.getSt_post());
		psmt.setString(6, dto.getSt_addr().replace("%&@#*^$@!", "<br/>"));
		psmt.setString(7,dto.getSt_parkin());
		psmt.setString(8, dto.getSt_time());
		
		i = psmt.executeUpdate();
		if(i==1){
		}
		}catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
		return i;
	}
	

	
	public List<SalUserDTO> printsal(String no) {
		List list = new Vector<>();
		PreparedStatement psmt2;
		ResultSet rs2;
		PreparedStatement psmt3;
		ResultSet rs3;
		PreparedStatement psmt4;
		ResultSet rs4;
		
		try{
		String sql = "select sa_no,name,tel,sa_addr,TO_char(sa_date,'yyyy/mm/dd hh24:mi:ss'),sa_pro from sales s join customer c on c.id = s.id where sa_pro != '주문 상태 - 종료' AND st_no ="+no;
		System.out.println(no);
		
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		while(rs.next()){
			SalUserDTO dto = new SalUserDTO();
			List<SalDTO> list2 = new Vector();
			dto.setNo(rs.getString(1));
			dto.setAddr(rs.getString(4).replace("%&@#*^$@!", "<br/>"));
			dto.setPro(rs.getString(6));
			dto.setName(rs.getString(2));
			dto.setS_date(rs.getString(5));
			dto.setTel(rs.getString(3));
			String sql2 = "select menu_name,menu_qty,menu_size,menu_price,sm_no,menu_kind,menu_no from sales s join sales_menu sm on sm.sa_no = s.sa_no where s.sa_no='"+rs.getString(1)+"'";
			psmt2 = conn.prepareStatement(sql2);
			rs2 = psmt2.executeQuery();
			while(rs2.next()){
				List<ToppingDTO> list3 = new Vector();
				SalDTO sdto = new SalDTO();
				sdto.setName(rs2.getString(1));
				sdto.setQty(rs2.getString(2));
				sdto.setSize(rs2.getString(3));
				sdto.setPrice(rs2.getString(4));
				
				if(rs2.getString(6).equals("1")){
					sql = "select dough_name from dough d join pizza_dough p on p.dough_no = d.dough_no where p_no = '"+rs2.getString(7)+"'";
					psmt4 = conn.prepareStatement(sql);
					rs4 = psmt4.executeQuery();
					if(rs4.next())
					sdto.setDoughname(rs4.getString(1));
				}
				
				
				String sql3 = "select t_name,t_size from s_topping st join topping_size ts on st.ts_no = ts.ts_no join topping t on t.t_code = ts.t_code where st.sm_no = '"+rs2.getString(5)+"'";
				psmt3 = conn.prepareStatement(sql3);
				rs3 = psmt3.executeQuery();
				while(rs3.next()){
					ToppingDTO tdto = new ToppingDTO();
					tdto.setTname(rs3.getString(1));
					tdto.setTsize(rs3.getString(2));
					list3.add(tdto);
				}
				sdto.setTopping(list3);
				list2.add(sdto);
			}
			dto.setSdto(list2);
			
			list.add(dto);
		}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int login(String type,String id, String pass, HttpSession session) {
		String sql="";
		System.out.println(type+id+pass);
		if(type.equals("admin"))
			sql="select count(*) from admin_tab where ad_id=? and ad_pass=?";
		else sql = "select st_no,st_name from stores where st_id=? and st_pass=?";
		try{
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, pass);
		rs = psmt.executeQuery();
		boolean bo = rs.next();
		if(bo) {
			
		System.out.println(rs.getString(1));
		System.out.println(bo);
		if(type.equals("mgr")){
			session.setAttribute("Sno", rs.getString(1));
			session.setAttribute("Sname", rs.getString(2));
			
		}
		
		
		if(type.equals("admin")){
			System.out.println("??");
			return 1;
		}
		else if(type.equals("mgr")){
			System.out.println("!!!");
			return 2;
		}
		}
		}catch (Exception e) {
		}
		return 0;
	}
	
	
	
	

	public int proupdate(String no, int po) {
		int i = 0;
		String pou="";
		if(po==1)
			pou="주문 상태 - 승인";
		else if(po==2)
			pou="주문 상태 - 배달중";
			else if(po==3)
				pou="주문 상태 - 종료";
		String sql = "update sales set sa_pro=? where sa_no = ?";
		try{
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, pou);
		psmt.setString(2, no);
			
		i = psmt.executeUpdate();
		}catch (Exception e) {
		}
		
		
		return i;
	}

	
	
	
	public List sallist(String st_no,String sa_no,String date1,String date2, String col2, String ser) {
		List<SalUserDTO> list = new Vector();
		
		PreparedStatement psmt0;
		ResultSet rs0;
		PreparedStatement psmt2;
		ResultSet rs2;
		PreparedStatement psmt3;
		ResultSet rs3;
		PreparedStatement psmt4;
		ResultSet rs4;
		
		try{
		String sql0 = "select s.sa_no from sales s join sales_menu sm on s.sa_no = sm.sa_no where sa_pro='주문 상태 - 종료' and st_no = "+st_no+ " ";
		if(col2.length()>0&&ser.length()>0) {
			sql0 += " and " + col2 ;
			if(col2.equals("MENU_NAME LIKE"))
				sql0 += " ('%"+ser+"%') ";
			else
				sql0 += " "+ser+" ";
		}
		sql0 += " group by s.sa_no ";
		System.out.println("sa주기용"+sql0);
		psmt0 = conn.prepareStatement(sql0);
		rs0 = psmt0.executeQuery();
		while(rs0.next()) {
		System.out.println("sa = "+rs0.getString(1));
		String sql = "select sa_no,name,tel,sa_addr,sa_date from sales s join customer c on c.id=s.id where sa_no = "+rs0.getString(1)+" ";
		
		if(date1.length()>0&&date2.length()>0){
			sql+=" and sa_date between '"+date1+"' and to_date('"+date2+"','YYYY-MM-DD')+1";
		}
		System.out.println(sql);
		
		if(sa_no.length()>0)
			sql += "and sa_no ='"+sa_no+"'";
			
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		while(rs.next()){
			SalUserDTO dto = new SalUserDTO();
			List list2 = new Vector<>();
			dto.setNo(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setTel(rs.getString(3));
			dto.setAddr(rs.getString(4).replace("%&@#*^$@!", "<br/>"));
			dto.setS_date(rs.getString(5));
			System.out.println(rs.getString(5)+"@@");
			sql = "select * from sales_menu where sa_no="+rs.getString(1);
			psmt2 = conn.prepareStatement(sql);
			rs2 = psmt2.executeQuery();
			while(rs2.next()){
				SalDTO dto2 = new SalDTO();
				List list3 = new Vector<>();
				dto2.setName(rs2.getString(5));
				dto2.setPrice(rs2.getString(8));
				dto2.setQty(rs2.getString(6));
				dto2.setSize(rs2.getString(7));
				dto2.setKind(rs2.getString(4));
				dto2.setSm_no(rs2.getString(1));
				dto2.setMenu_no(rs2.getString(3));
				System.out.println(rs2.getString(3)+"$$");
				if(rs2.getString(4).equals("1")){
					sql = "select dough_name from dough d join pizza_dough p on p.dough_no = d.dough_no where p_no = '"+rs2.getString(3)+"'";
					psmt4 = conn.prepareStatement(sql);
					rs4 = psmt4.executeQuery();
					if(rs4.next()) {
					dto2.setDoughname(rs4.getString(1));
					}
				}
				
				
				
				
				String col="";
				String from = "";
				String where="";
				if(rs2.getString(4).equals("1")){//피자
					if(rs2.getString(7).equals("L")){
						col=" P_LPRICE+D_PRICE ";
					}/// 피자 - 라지
					else
						col=" P_SPRICE+D_PRICE ";
					where = " p.p_no ";
					from=" PIZZA P join PIZZA_DOUGH D on P.P_NO = D.P_NO ";
				}/// 피자
				else{
					col = rs2.getString(4).equals("2") ? " S_PRICE " : rs2.getString(4).equals("3") ? " D_PRICE " : rs2.getString(4).equals("4") ? " PC_PRICE " : " SC_PRICE " ;
					from = rs2.getString(4).equals("2") ? " SIDE " : rs2.getString(4).equals("3") ? " DRINK " : rs2.getString(4).equals("4") ? " PICKLE " : " SAUCE "  ;
					where = rs2.getString(4).equals("2") ? " s_no " : rs2.getString(4).equals("3") ? " dr_no " : rs2.getString(4).equals("4") ? " pc_no " : " sc_no "  ;					
				}
				sql = "select "+col+" from "+from+" where "+ where +" = '"+rs2.getString(3) +"'";
				psmt4 = conn.prepareStatement(sql);
				System.out.println("!!!@@@@"+sql);
				rs4 = psmt4.executeQuery();
				if(rs4.next())
				dto2.setOrgprice(rs4.getString(1));
				
				sql = "select t_name,t_size,t_price from s_topping st join topping_size ts on st.ts_no = ts.ts_no join topping t on t.t_code = ts.t_code where st.sm_no = '"+rs2.getString(1)+"'";
				psmt3 = conn.prepareStatement(sql);
				rs3 = psmt3.executeQuery();
				
				while(rs3.next()){
					ToppingDTO dto3 = new ToppingDTO();
					dto3.setTname(rs3.getString(1));
					dto3.setTsize(rs3.getString(2));
					dto3.setTprice(rs3.getString(3));
					list3.add(dto3);
				}
				
				dto2.setTopping(list3);
				list2.add(dto2);
			}
			
			dto.setSdto(list2);
			list.add(dto);
			
			
		}
		}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return list;
		
	}

	public int update(StoreDTO dto, String no) {
		String sql = "update stores set st_tel = ?, st_parkin=?, st_time =? where st_no = ?";
		int i = 0;
		try{
			
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, dto.getSt_tel());
		psmt.setString(2, dto.getSt_parkin());
		psmt.setString(3, dto.getSt_time());
		psmt.setString(4, no);
		i = psmt.executeUpdate();
		
		}catch (Exception e) {
		}
		
		
		
		return i;
	}
	
	public StoreDTO printStore(String no){
		StoreDTO dto = new StoreDTO();
		String sql = "select st_tel,st_parkin,st_time from stores where st_no ='"+no+"'";
		try{
			
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		rs.next();
		dto.setSt_tel(rs.getString(1));
		dto.setSt_parkin(rs.getString(2));
		dto.setSt_time(rs.getString(3));
		}catch (Exception e) {
		}
		
		return dto;
	}

	public List<StoreDTO> storeser(String ser, String sertxt) {
		List<StoreDTO> dtos = new Vector<StoreDTO>();
		StoreDTO dto = new StoreDTO();
		System.out.println(ser+sertxt);
		String sql="";
		if(sertxt==null||sertxt.length()>0)
			sql="SELECT ST_NAME,ST_ID,ST_PASS,ST_TEL,ST_PARKIN,ST_TIME,ST_NO FROM STORES";
			else
		sql = "SELECT ST_NAME,ST_ID,ST_PASS,ST_TEL,ST_PARKIN,ST_TIME,ST_NO FROM STORES WHERE "+ser+" like '%"+sertxt+"%'";		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()){
				dto = new StoreDTO();
				dto.setSt_name(rs.getString(1));
				dto.setSt_id(rs.getString(2));
				dto.setSt_pass(rs.getString(3));
				dto.setSt_tel(rs.getString(4));
				dto.setSt_parkin(rs.getString(5));
				dto.setSt_time(rs.getString(6));
				dto.setSt_no(rs.getString(7));
				dtos.add(dto);
			}
		}catch (Exception e) {
		}
		
		return dtos;
	}
	
	

	public StoreDTO storeedt(String no) {
		StoreDTO dto = new StoreDTO();
		String sql = "SELECT ST_NAME,ST_ID,ST_PASS,ST_TEL,ST_PARKIN,ST_TIME,ST_NO FROM STORES WHERE st_no= '"+no+"'";		
		try {
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		while(rs.next()){
		dto = new StoreDTO();
		dto.setSt_name(rs.getString(1));
		dto.setSt_id(rs.getString(2));
		dto.setSt_pass(rs.getString(3));
		dto.setSt_tel(rs.getString(4));
		dto.setSt_parkin(rs.getString(5));
		dto.setSt_time(rs.getString(6));
		dto.setSt_no(rs.getString(7));
		}
		}catch (Exception e) {
		}
		
		return dto;
	}

	public int storeedit(StoreDTO dto) {
		int i =0;
		String sql = "UPDATE STORES SET ST_ID=?, ST_PASS=?, ST_TIME=?, ST_TEL=?,ST_PARKIN=?,ST_NAME=? where st_no=?";
		try {
			
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, dto.getSt_id());
		psmt.setString(2, dto.getSt_pass());
		psmt.setString(3, dto.getSt_time());
		psmt.setString(4, dto.getSt_tel());
		psmt.setString(5, dto.getSt_parkin());
		psmt.setString(6, dto.getSt_name());
		psmt.setString(7, dto.getSt_no());
		i = psmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return i;
	}

	public List<Map> printrating() {
		List list = new Vector<Map>();
		//String sql = "select R.R_NO,R.R_NAME,R.R_TARGET,C.C_NAME,C.C_NO FROM RATING R JOIN RATING_CUPPON RC ON RC.R_NO=R.R_NO JOIN SAILE_COUPON C ON C.C_NO = RC.C_NO";
		String sql = "select * from rating";
		try {
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		PreparedStatement psmt2;
		ResultSet rs2;
		while(rs.next()){
			Map map = new HashMap<>();
			List list2 = new Vector<>();
			map.put("rno", rs.getString(1));
			map.put("rname", rs.getString(2));
			map.put("rtar", rs.getString(3));
			psmt2 = conn.prepareStatement("select C.C_NO,C.C_NAME FROM RATING_CUPPON RC JOIN SAILE_COUPON C ON C.C_NO = RC.C_NO WHERE R_NO=?");
			psmt2.setString(1, rs.getString(1));
			rs2 = psmt2.executeQuery();
			while(rs2.next()) {
				Map map2 = new HashMap<>();
				map2.put("cno", rs2.getString(1));
				map2.put("cname", rs2.getString(2));
				list2.add(map2);
			}
			map.put("clist", list2);
			list.add(map);
		}
		
		}catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return list;
	}

	public Map viewrating(String rno) {
		Map map = new HashMap<>();
		String sql = "select * from rating where r_no = ?";
		try {
			
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, rno);
		rs = psmt.executeQuery();
		if(rs.next()) {
			
		map.put("rno", rs.getString(1));
		map.put("rname", rs.getString(2));
		map.put("rtar", rs.getString(3));
		
		}
		
		
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return map;
	}

	public List<Map> printrc(String rno) {
		List list = new Vector<>();
		String sql = "select rc.c_no,c.c_name from rating_cuppon rc join rating r on r.r_no=rc.r_no join saile_coupon c on c.c_no = rc.c_no where r.r_no=?";
		try {
			System.out.println("???");
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, rno);
		rs=psmt.executeQuery();
		while(rs.next()) {
			Map map = new HashMap<>();
			map.put("cno", rs.getString(1));
			map.put("cname", rs.getString(2));
			
			list.add(map);
			System.out.println(rs.getString(1)+"!!");
		}
		
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	public List<Map> printsc(String whr) {
		List list = new Vector<Map>();
		String sql = "select c_name,c_no from saile_coupon where c_no not in ("+whr+")";
		try {
			
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		while(rs.next()) {
			Map map = new HashMap<>();
			map.put("cname", rs.getString(1));
			map.put("cno", rs.getString(2));
			list.add(map);
		}
		
		}catch (Exception e) {
		}
		
		return list;
	}

	public int ratingupdate(String rno, String rname, String rtar) {
		int i=0;
		String sql = "update rating set r_name=?,r_target=? where r_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, rname);
			psmt.setString(2, rtar);
			psmt.setString(3, rno);
			i = psmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return i;
	}

	public int deletecr(String rno) {
		int k = 0;
		String sql = "delete rating_cuppon where r_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, rno);
			k = psmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return k;
	}

	public int setcr(String rno, String coupon) {
		int l = 0;
		String sql = "INSERT INTO RATING_CUPPON VALUES(SEQ_RATING_CUPPON_RC_NO.NEXTVAL,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, rno);
			psmt.setString(2, coupon);
			l = psmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return l;
	}

	public String ratingInsert(String rno, String rname, String rtar) {
		
		int i =0;
		System.out.println(rname);
		System.out.println(rtar);
		String sql = "INSERT INTO RATING VALUES(SEQ_RATING_R_NO.NEXTVAL,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, rname);
			psmt.setString(2, rtar);
			i = psmt.executeUpdate();
			if(i==1) {
			sql = "select SEQ_RATING_R_NO.CURRVAL FROM DUAL";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			rno = rs.getString(1);
			System.out.println(rno);
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return rno;
	}

	public int ratingdelete(String rno) {
		int i = 0;
		String sql = "DELETE RATING WHERE R_NO = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, rno);
			i = psmt.executeUpdate();
			System.out.println("ASDASASF");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return i;
	}

	public List<Map> printsaile(String col, String ser) {
		List list = new Vector<>();
		String sql = "select * from saile_coupon";
		if(col!=null&&col.length()>0)
			sql += " where "+col+" like ('%"+ser+"%')";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Map map= new HashMap<>();
				map.put("no", rs.getString(1));
				map.put("name", rs.getString(2));
				map.put("saile", rs.getString(3));
				map.put("con", rs.getString(4));
				list.add(map);
			}
			
		}catch (Exception e) {
		}
		
		return list;
	}

	public int saileedit(String no, String name, String saile, String con) {
		int i =0;
		String sql = "UPDATE SAILE_COUPON SET C_NAME=?,C_SAILE=?,C_CON=? WHERE C_NO=?";
		try {
		psmt = conn.prepareStatement(sql);
		psmt.setString(4, no);
		psmt.setString(1, name);
		psmt.setString(2, saile);
		psmt.setString(3, con);
		i = psmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return i;
	}

	public int sailedelete(String no) {
		int i = 0;
		String sql = "DELETE SAILE_COUPON WHERE C_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			i = psmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
				
		return i;
	}

	public int saileInsert(String name, String saile, String con) {
		int i=0;
		String sql = "INSERT INTO SAILE_COUPON VALUES(SEQ_SAILE_COUPON_C_NO.NEXTVAL,?,?,?)";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, saile);
			psmt.setString(3, con);
			i = psmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return i;
	}

	public List<Map> printRatingList() {
		List<Map> list=new Vector<Map>();
		String sql = "select r_no,r_name,r_target from rating";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Map map = new HashMap<>();
				map.put("r_no", rs.getString(1));
				map.put("r_name", rs.getString(2));
				map.put("r_target", rs.getString(3));
				System.out.println("ss");
				list.add(map);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int stoDelete(String no) {
		int i=0;
		String sql = "DELETE STORES WHERE ST_NO = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			i = psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public List<Map> salescon() {return null;}
	
	
	

}
