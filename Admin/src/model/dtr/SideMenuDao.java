package model.dtr;

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
import javax.sql.DataSource;


public class SideMenuDao {
	
		//멤버변수]
	   private Connection conn;
	   private PreparedStatement psmt;
	   private ResultSet rs;
		//톰캣이 만들어 놓은 커넥션을 커넥션 풀에서 가져다 쓰기]
		public SideMenuDao(ServletContext context) {
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
		
		
		public int insert(SideMenuDto dto) {
			int affected=0;
			String sql="INSERT INTO SIDE VALUES(SEQ_SIDE_S_NO.nextval,?,?,?,?,?)";
			
			
			try {
				
				psmt = conn.prepareStatement(sql);
				
				
				psmt.setString(1,dto.getS_name());
				psmt.setString(2,dto.getS_price());
				psmt.setString(3,dto.getS_img());
				psmt.setString(4,dto.getS_origin());
				psmt.setString(5,dto.getS_detail());
				
				affected = psmt.executeUpdate();
					
				
				
			} catch (SQLException e) {e.printStackTrace();}
			
			return affected;
		}/////////////////insert

		//전체목록 뿌려주기
				public List<SideMenuDto> selectList(Map<String,Object> map,int start, int end){
						
					
					List list = new Vector();
				      String sql = "SELECT * FROM (SELECT P.*, ROWNUM R FROM (SELECT * FROM PIZZA ORDER BY P_NO DESC) P) WHERE R BETWEEN ? AND ?";
				      try {
				         psmt = conn.prepareStatement(sql);
				         psmt.setInt(1, 0);
				         psmt.setInt(2, end);
				         rs = psmt.executeQuery();
				         while(rs.next()) {
				        	SideMenuDto dto = new SideMenuDto();
				            
				            dto.setS_no(rs.getString(1));
				            dto.setS_name(rs.getString(2));
				            dto.setS_price(rs.getString(3));
				            
				            list.add(dto);
				         }
				      } catch (SQLException e) {e.printStackTrace();}
				      return list;
				}
	
		
		
		
		
	}


