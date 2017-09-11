package model.dtr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class ToppingDao {

	//멤버변수]
	   private Connection conn;
	   private PreparedStatement psmt,t_s_psmt;
	   private ResultSet rs;
		//톰캣이 만들어 놓은 커넥션을 커넥션 풀에서 가져다 쓰기]
		public ToppingDao(ServletContext context) {
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
		
		
		public int insert(ToppingDto dto) {
			int affected=0;
			String sql="INSERT INTO TOPPING  VALUES(SEQ_TOPPING_T_CODE.NEXTVAL,?,?,?)";
			String t_s_sql = "INSERT INTO TOPPING_SIZE VALUES(SEQ_TOPPING_SIZE_TS_NO.NEXTVAL,SEQ_TOPPING_T_CODE.CURRVAL,?,?,?)";	
			try {
				
				
				psmt = conn.prepareStatement(sql);
				
				
				psmt.setString(1,dto.getT_name());
				psmt.setString(2,dto.getT_img());
				psmt.setString(3,dto.getT_kind());
				
				affected = psmt.executeUpdate();
				
				
				t_s_psmt = conn.prepareStatement(t_s_sql);
				t_s_psmt.setString(1,dto.getT_size());
				t_s_psmt.setString(2,dto.getT_price());
				t_s_psmt.setString(3,dto.getT_gram());
				t_s_psmt.executeUpdate();
				
				
				
				
			} catch (SQLException e) {e.printStackTrace();}
			
			return affected;
		}/////////////////insert
	
}
