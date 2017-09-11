package controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import controller.dto.MemberDTO;
import controller.dto.SalesListDTO;


public class MemberDAO {
	
	//멤버변수]
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	//톰캣이 만들어 놓은 커넥션을 커넥션 풀에서 가져다 쓰기]
	public MemberDAO(ServletContext context){
		try {
			Context ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/domino");
			conn = source.getConnection();
		} 
		catch (NamingException e) {e.printStackTrace();}
		catch (SQLException e) {e.printStackTrace();}
	}//////////////////DataRoomDAO()
	
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
	
	//총회원 목록용]
	public List selectList(Map map) {
		List list = new Vector();
		String sql="SELECT C.*, CR.R_NAME FROM CUSTOMER C JOIN CR_JOIN CR ON CR.ID = C.ID INNER JOIN RATING R ON CR.R_NO = R.R_NO ";
		try{
		//검색용 쿼리]
		if(map.get("searchWord") != null && map.get("searchWord").toString().trim().length() != 0){
			if(map.get("searchColumn").equals("id")) map.put("searchColumn", "c.id");
			sql += " WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%'";
		}
		//정렬 순서용 쿼리]
		switch (map.get("radioV").toString()) {
			case "name": sql += " ORDER BY NAME"; break;
			case "birth": sql += " ORDER BY BIRTH"; break;
			case "email": sql += " ORDER BY EMAIL"; break;
			case "rating": sql += " ORDER BY R_TARGET DESC"; break;
			default : sql += " ORDER BY C.ID";
		}
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()){
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setBirth(rs.getString(5));
				dto.setPost(rs.getString(6));
				dto.setAddr(rs.getString(7));
				dto.setEmail(rs.getString(8));
				dto.setTel(rs.getString(9));
				dto.setR_name(rs.getString(10));
				list.add(dto);
			}
		}
		catch(Exception e){e.printStackTrace();}
		return list;
	}/////////////selectList()
		
	//삭제(회원탈퇴)용]
	public int delete(String id) {
		int affected = 0;
		String sql="DELETE CUSTOMER WHERE ID=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	//회원당 구매내역출력용]
	public List salesSelectList(String id) {
		int total=0;
		List list = new Vector();
		
		String sql="SELECT TO_CHAR(SA_DATE,'YYYY/MM/DD HH24:MI:SS') SA_DATE, S.SA_NO, ST.ST_NO, ST.ST_NAME, "; 
		sql += " SM_NO, MENU_NAME, MENU_QTY, MENU_SIZE, MENU_PRICE, SA_ADDR, SA_PRO ";
		sql += " FROM SALES S JOIN SALES_MENU SM ON S.SA_NO = SM.SA_NO ";
		sql += " INNER JOIN STORES ST ON S.ST_NO = ST.ST_NO  WHERE ID=? ";
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()){
				SalesListDTO dto = new SalesListDTO();
				dto.setSa_date(rs.getString(1));
				dto.setSa_no(rs.getString(2));
				dto.setSt_no(rs.getString(3));
				dto.setSt_name(rs.getString(4));
				dto.setSm_no(rs.getString(5));
				dto.setMenu_name(rs.getString(6));
				dto.setMenu_qty(rs.getString(7));
				dto.setMenu_size(rs.getString(8));
				dto.setMenu_price(rs.getString(9));
				dto.setSa_addr(rs.getString(10));
				dto.setSa_pro(rs.getString(11));
				list.add(dto);
			}
		}
		catch(SQLException e){e.printStackTrace();}
		return list;
	}/////////////selectList()	
	
	//회원정보 수정용]
	public int memberUpdate(MemberDTO dto){
		int affected = 0;
		String sql1 = " UPDATE CUSTOMER SET PASS=?, NAME=?, GENDER=?, BIRTH=?, POST=?, ADDR=?, EMAIL=?, TEL=? WHERE ID=? ";
		String sql2 = " UPDATE CR_JOIN SET R_NO=?, R_NAME=? WHERE ID=? ";
		try {
			psmt = conn.prepareStatement(sql1);
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getGender());
			psmt.setString(4, dto.getBirth());
			psmt.setString(5, dto.getPost());
			psmt.setString(6, dto.getAddr());
			psmt.setString(7, dto.getEmail());
			psmt.setString(8, dto.getTel());
			psmt.setString(9, dto.getId());
			affected = psmt.executeUpdate();
			if(affected == 1) {
				psmt = conn.prepareStatement(sql2);
				switch (dto.getName()) {
				case "REGULAR": psmt.setString(1, "1");	psmt.setString(2, "REGULAR"); break;
				case "PREMIUM": psmt.setString(1, "2");	psmt.setString(2, "PREMIUM"); break;
				case "VIP": psmt.setString(1, "3");	psmt.setString(2, "VIP"); break;
				default: psmt.setString(1, "4"); psmt.setString(2, "ROYAL"); 
				}
				psmt.setString(3, dto.getId());		
			affected += psmt.executeUpdate();
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}/////////////update
	
	
	public MemberDTO selectOne(String id){
		MemberDTO dto = new MemberDTO();
		String sql="SELECT C.*, CR.R_NAME FROM CUSTOMER C JOIN CR_JOIN CR ON CR.ID = C.ID INNER JOIN RATING R ON CR.R_NO = R.R_NO WHERE C.ID=?";
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()){
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setBirth(rs.getString(5));
				dto.setPost(rs.getString(6));
				dto.setAddr(rs.getString(7));
				dto.setEmail(rs.getString(8));
				dto.setTel(rs.getString(9));
				dto.setR_name(rs.getString(10));
			}
		}
		catch(Exception e){e.printStackTrace();}
		return dto;
	}///////////////////////selectOne
	
}
