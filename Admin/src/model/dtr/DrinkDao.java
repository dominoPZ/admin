package model.dtr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class DrinkDao {

	//맴버변수
	private Connection conn;
	private PreparedStatement psmt;
	 
	//커넥션툴
	public DrinkDao(ServletContext context) {
	      try {
	          Context ctx = new InitialContext();
	          DataSource source=(DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/domino");
	         
	          conn = source.getConnection();   
	       } 
	       catch (NamingException e) {e.printStackTrace();}
	       catch (SQLException e) {
	    	   
	    	   e.printStackTrace();
	    	   }
	       
	    }
	
	public int insert(DrinkDto dto) {
		int affected=0;
		String sql = "INSERT INTO DRINK VALUES(SEQ_DRINK_DR_NO.NEXTVAL,?,?,?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1,dto.getD_name());
			psmt.setString(2,dto.getD_price());
			psmt.setString(3,dto.getD_img());
			
			affected = psmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return affected;
	}
	
}
