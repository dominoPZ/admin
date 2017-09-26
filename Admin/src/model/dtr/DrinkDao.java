package model.dtr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class DrinkDao {

	//맴버변수
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	//커넥션풀
	public DrinkDao(ServletContext context) {
	      try {
	          Context ctx = new InitialContext();
	          DataSource source=(DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/domino");
	          conn = source.getConnection();   
	       } 
	       catch (NamingException e) {e.printStackTrace();}
	       catch (SQLException e) {e.printStackTrace();}
	}
	
	//음료 등록용]
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
	
	
	
	///////////////미나/////////////////////////////////////////////////////////////////////////////
	
	//자원반납용]-사용한 커넥션 객체를 다시 풀에 반납
	public void close(){
		try {
			//메모리 해제]
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			// 커넥션 풀에 커넥션 객체 반납-메모리 해제 아님]
			if(conn !=null) conn.close();
		} catch (Exception e) {e.printStackTrace();}
	}/////////////////close()
	
	//음료 리스트 출력용]
	public List<DrinkDto> selectList() {
		List<DrinkDto> list = new Vector();
		String sql = "SELECT * FROM DRINK ORDER BY DR_NO";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				DrinkDto dto = new DrinkDto();
				dto.setDr_no(rs.getString(1));
				dto.setD_name(rs.getString(2));
				dto.setD_price(rs.getString(3));
				dto.setD_img(rs.getString(4));
				list.add(dto);
			}
		} catch (SQLException e) {e.printStackTrace();}
		return list;
	}
	
	//음료 수정용]
	public int update(DrinkDto dto) {
		int affected = 0;
		System.out.println(dto.getD_name()+" / "+dto.getD_price()+" / "+dto.getD_img()+" / "+dto.getDr_no());
		String sql = "UPDATE DRINK SET D_NAME=?, D_PRICE=?, D_IMG=? WHERE DR_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getD_name());
			psmt.setString(2, dto.getD_price());
			psmt.setString(3, dto.getD_img());
			psmt.setString(4, dto.getDr_no());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}
	
	//음료 삭제용]
	public int delete(DrinkDto dto) {
		int affected = 0;
		String sql = "DELETe DRINK WHERE DR_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getDr_no());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}
	
	//음료 1행 선택용]
	public DrinkDto selectOne(String no) {
		DrinkDto dto =  new DrinkDto();
		String sql = "SELECT * FROM DRINK WHERE DR_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setDr_no(rs.getString(1));
				dto.setD_name(rs.getString(2));
				dto.setD_price(rs.getString(3));
				dto.setD_img(rs.getString(4));
			}
		} catch (SQLException e) {e.printStackTrace();}
		return dto;
	}
	
}



