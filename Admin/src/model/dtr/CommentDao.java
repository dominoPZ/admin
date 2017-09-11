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



public class CommentDao {
	
		//멤버변수]
	   private Connection conn;
	   private PreparedStatement psmt,p_d_psmt,p_dough_psmt;
	   private ResultSet rs;
		//톰캣이 만들어 놓은 커넥션을 커넥션 풀에서 가져다 쓰기]
		public CommentDao(ServletContext context) {
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
		
		
		public int insert(CommentDto dto) {
			int affected=0;
			String sql="INSERT INTO PIZZA VALUES(seq_pizza_p_no.nextval,?,?,?,?,?,?,?,?,?,?)";
			String p_d_sql = "INSERT INTO PIZZA_DOUGH VALUES(seq_d_no.nextval,seq_p_no.currval,seq_dough_no.currval,'2000')";
			String p_dough_sql = "";	
			try {
				
				psmt = conn.prepareStatement(sql);
				
				
				psmt.setString(1,dto.getP_name());
				psmt.setString(2,dto.getP_kind());
				psmt.setString(3,dto.getP_topping());
				psmt.setString(4,dto.getP_sprice());
				psmt.setString(5,dto.getP_lprice());
				psmt.setString(6,dto.getP_origin());
				psmt.setString(7,dto.getP_img());
				psmt.setString(8,dto.getP_himg());
				psmt.setString(9,dto.getP_dimg());
				psmt.setString(10,dto.getP_detail());
				affected = psmt.executeUpdate();
				
				for(String dough : dto.getDough_name()) {
					int num=0;
					
					if(dough.equals("4"))
						num=2000;
					p_d_sql = "INSERT INTO PIZZA_DOUGH VALUES(seq_d_no.nextval,seq_pizza_p_no.currval,?,'"+num+"')";
					
					p_dough_psmt = conn.prepareStatement(p_d_sql);
					p_dough_psmt.setString(1,dough);
					p_dough_psmt.executeUpdate();
				}
				
				
				
				
				
					
				
				
				
			} catch (SQLException e) {e.printStackTrace();}
			
			return affected;
		}/////////////////insert

		public List<DoughDTO> getDough() {
			String sql = "select * from dough";
			List list = new Vector<>();
			try {
				
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				DoughDTO dto= new DoughDTO();
			dto.setDough_no(rs.getString(1));
			dto.setDough_name(rs.getString(2));
			list.add(dto);
			}
			}catch (Exception e) {
				
			}
			
			return list;
		}
		
		//전체목록 뿌려주기
		public List<CommentDto> selectList(Map<String,Object> map,int start, int end){
				
			
			List list = new Vector();
		      String sql = "SELECT * FROM (SELECT P.*, ROWNUM R FROM (SELECT * FROM PIZZA ORDER BY P_NO DESC) P) WHERE R BETWEEN ? AND ?";
		      try {
		         psmt = conn.prepareStatement(sql);
		         psmt.setInt(1, 0);
		         psmt.setInt(2, end);
		         rs = psmt.executeQuery();
		         while(rs.next()) {
		            CommentDto dto = new CommentDto();
		            dto.setP_name(rs.getString(1));
		            dto.setP_kind(rs.getString(2));
		            dto.setP_topping(rs.getString(3));
		            dto.setP_sprice(rs.getString(4));
		            dto.setP_lprice(rs.getString(5));
		            dto.setP_origin(rs.getString(6));
		            dto.setP_img(rs.getString(7));
		            dto.setP_himg(rs.getString(8));
		            dto.setP_dimg(rs.getString(9));
		            dto.setP_detail(rs.getString(10));
		            list.add(dto);
		         }
		      } catch (SQLException e) {e.printStackTrace();}
		      return list;
		}
		
		
		
	}///CommentDao


