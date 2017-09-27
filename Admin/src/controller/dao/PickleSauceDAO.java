package controller.dao;

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

import controller.dto.PickleSauceDTO;

public class PickleSauceDAO {

	//맴버변수
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	//커넥션풀
	public PickleSauceDAO(ServletContext context) {
	      try {
	          Context ctx = new InitialContext();
	          DataSource source=(DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/domino");
	          conn = source.getConnection();   
	       } 
	       catch (NamingException e) {e.printStackTrace();}
	       catch (SQLException e) {e.printStackTrace();}
	}
	
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
	
	//상품 등록용]
	public int insert(PickleSauceDTO dto) {
		int affected=0;
		String sql;
		if(dto.getD_kind().equals("pickle")) sql = "INSERT INTO PICKLE VALUES(SEQ_PICKLE_PC_NO.NEXTVAL,?,?,?)";
		else sql = "INSERT INTO SAUCE VALUES(SEQ_SAUCE_SC_NO.NEXTVAL,?,?,?)";
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
	
	//상품 리스트 출력용]
	public List<PickleSauceDTO> selectList() {
		List<PickleSauceDTO> list = new Vector();
		String sql = "SELECT * FROM PICKLE ORDER BY PC_NO";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
		
			while(rs.next()) {
				PickleSauceDTO dto = new PickleSauceDTO();
				dto.setDr_no(rs.getString(1));
				dto.setD_name(rs.getString(2));
				dto.setD_price(rs.getString(3));
				dto.setD_img(rs.getString(4));
				dto.setD_kind("pickle");
				list.add(dto);
			}
			sql = "SELECT * FROM SAUCE ORDER BY SC_NO";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				PickleSauceDTO dto = new PickleSauceDTO();
				dto.setDr_no(rs.getString(1));
				dto.setD_name(rs.getString(2));
				dto.setD_price(rs.getString(3));
				dto.setD_img(rs.getString(4));
				dto.setD_kind("sauce");
				list.add(dto);
			}
			
		} catch (SQLException e) {e.printStackTrace();}
		return list;
	}
	
	//상품 수정용]
	public int update(PickleSauceDTO dto) {
		int affected = 0;
		String sql;
		if(dto.getD_kind().equals("pickle")) sql = "UPDATE Pickle SET PC_NAME=?, PC_PRICE=?, PC_IMG=? WHERE PC_NO=?";
		else sql = "UPDATE Sauce SET SC_NAME=?, SC_PRICE=?, SC_IMG=? WHERE SC_NO=?";
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
	
	//상품 삭제용]
	public int delete(PickleSauceDTO dto) {
		int affected = 0;
		String sql;
		if(dto.getD_kind().equals("pickle")) sql = "DELETE PICKLE WHERE PC_NO=?";
		else sql = "DELETE SAUCE WHERE SC_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getDr_no());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}
	
	//상품 1행 선택용]
	public PickleSauceDTO selectOne(PickleSauceDTO dto) {
		String sql;
		if(dto.getD_kind().equals("pickle")) sql = "SELECT * FROM PICKLE WHERE PC_NO=?";
		else sql = "SELECT * FROM SAUCE WHERE SC_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getDr_no());
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
