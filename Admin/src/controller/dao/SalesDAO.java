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

import controller.dto.P_nutrientDTO;
import controller.dto.PizzaMenuListDTO;
import controller.dto.SalDTO;
import controller.dto.SalUserDTO;
import controller.dto.StoreDTO;
import controller.dto.ToppingDTO;

public class SalesDAO {
	
	//멤버변수]
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public SalesDAO(ServletContext context) {
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

	public List<Map> pizzaGraph(String whe) {
		//반환을 위한 list
		List<Map> list = new Vector<>();
		
		// sql문------------
		// SELECT 절
		String sql = " SELECT SM.MENU_NAME,COUNT(SM.MENU_NAME),SUM(MENU_PRICE) FROM SALES S JOIN SALES_MENU SM ON SM.SA_NO = S.SA_NO ";
		// WHERE 절
		sql +=" WHERE MENU_KIND='1' ";
		sql += whe; // 값이 있을경우 AND BTW~~~~ 가 붙음
		sql +=" GROUP BY SM.MENU_NAME ";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Map map = new HashMap<>();
				map.put("name", rs.getString(1));
				map.put("count",""+rs.getString(2)+"");
				map.put("price", rs.getString(3));
				list.add(map);
			}//while
		}catch (Exception e) {e.printStackTrace();}
		return list;
	}

	public List<Map> sotresList(String string) {
		//list 생성
		List<Map> list = new Vector<>();
		String sql = "SELECT ST_NO,ST_NAME FROM STORES";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Map map = new HashMap<>();
				map.put("st_name", rs.getString(2));
				map.put("st_no", rs.getString(1));
				list.add(map);
			}//while
		}catch (Exception e) {e.printStackTrace();}
		return list;
	}

	public Map storeOne(String st_no) {
		//list 생성
		Map map = new HashMap<>();
		String sql = "SELECT ST_NO,ST_NAME FROM STORES WHERE ST_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, st_no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				map.put("st_name", rs.getString(2));
				map.put("st_no", rs.getString(1));
			}//while
		}catch (Exception e) {e.printStackTrace();}
		return map;
	}

	
	public List<Map> timeSales(String whe) {
		List list = new Vector<>();
		String sql = " SELECT MENU_NAME,MENU_PRICE,TO_CHAR(SA_DATE,('HH24:MI')) "+
		" FROM SALES S JOIN SALES_MENU SM ON SM.SA_NO = S.SA_NO "+
		" WHERE MENU_KIND=1 ";
		sql+=whe;
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Map map = new HashMap<>();
				map.put("name", rs.getString(1));
				map.put("price", rs.getString(2));
				map.put("time", rs.getString(3));
				list.add(map);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		}
	
	
	
	
	

}
