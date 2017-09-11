package controller.lyj;

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

public class EventnNoticeDAO {

	// 멤버변수
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	// 커넥션 풀에서 가져다쓰기
	public EventnNoticeDAO(ServletContext context) {
		try {
			Context ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/domino");
			conn = source.getConnection();
		}
		catch (NamingException e) {e.printStackTrace();}
		catch (SQLException e) {e.printStackTrace();}
	}//////EventnNoticeDAO
	// 자원반납용
	public void close() {
		try {
			// 메모리 해제
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {e.printStackTrace();}
	}///////////close()
	
	// 이벤트 전체 목록용
	public List selectListEvent(int start, int end) {
		List list = new Vector();
		String sql = "SELECT * FROM (SELECT E.*, ROWNUM R FROM (SELECT * FROM EVENT ORDER BY E_NO DESC) E) WHERE R BETWEEN ? AND ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, 0);
			psmt.setInt(2, end);
			rs = psmt.executeQuery();
			while(rs.next()) {
				EventDTO dto = new EventDTO();
				dto.setE_no(rs.getString(1));
				dto.setE_title(rs.getString(2));
				dto.setE_sdate(rs.getDate(3));
				dto.setE_edate(rs.getDate(4));
				dto.setE_timg(rs.getString(5));
				dto.setE_cimg(rs.getString(6));
				list.add(dto);
			}
		} catch (SQLException e) {e.printStackTrace();}
		return list;
	}///////////selectList()
	
	// 이벤트 총 레코드 수 얻기용
	public int getTotalRecordEvent(){
		int total = 0;
		String sql = "SELECT COUNT(*) FROM EVENT";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {e.printStackTrace();}
		return total;
	}//////////getTotalRecordEvent()
	
	// 이벤트 입력용
	public int insertEvent(EventDTO dto) {
		int affected = 0;
		String sql = "INSERT INTO EVENT VALUES(SEQ_EVENT_E_NO.NEXTVAL, ?, ?, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getE_title());
			psmt.setDate(2, dto.getE_sdate());
			psmt.setDate(3, dto.getE_edate());
			psmt.setString(4, dto.getE_timg());
			psmt.setString(5, dto.getE_cimg());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}//////////insertEvent()
	
	// 이벤트 상세보기용
	public EventDTO selectOneEvent(String no) {
		EventDTO dto = null;
		String sql = "SELECT * FROM EVENT WHERE E_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new EventDTO();
				dto.setE_no(rs.getString(1));
				dto.setE_title(rs.getString(2));
				dto.setE_sdate(rs.getDate(3));
				dto.setE_edate(rs.getDate(4));
				dto.setE_timg(rs.getString(5));
				dto.setE_cimg(rs.getString(6));
			}
		} catch (SQLException e) {e.printStackTrace();}
		return dto;
	}///////////////selectOneEvent()
	// 이벤트 수정용
	public int updateEvent(EventDTO dto) {
		int affected = 0;
		String sql = "UPDATE EVENT SET E_TITLE=?, E_SDATE=?, E_EDATE=?, E_TIMG=?, E_CIMG=? WHERE E_NO=?";
		try {
			System.out.println(dto.getE_no());
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getE_title());
			psmt.setDate(2, dto.getE_sdate());
			psmt.setDate(3, dto.getE_edate());
			psmt.setString(4, dto.getE_timg());
			psmt.setString(5, dto.getE_cimg());
			psmt.setString(6, dto.getE_no());
			affected = psmt.executeUpdate();			
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}//////////updateEvent()
	// 이벤트 삭제용
	public int deleteEvent(String e_no) {
		int affected = 0;
		String sql = "DELETE EVENT WHERE E_NO=?";
		System.out.println("sql");
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, e_no);
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}//////////deleteEvent
	
	// 공지사항 전체 목록용
	public List selectListNotice(int start, int end) {
		List list = new Vector();
		String sql = "SELECT * FROM (SELECT E.*, ROWNUM R FROM (SELECT * FROM NOTICE ORDER BY N_NO DESC) E) WHERE R BETWEEN ? AND ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, 0);
			psmt.setInt(2, end);
			rs = psmt.executeQuery();
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setN_no(rs.getString(1));
				dto.setN_title(rs.getString(2));
				dto.setN_content(rs.getString(3));
				dto.setN_date(rs.getDate(4));
				dto.setN_img(rs.getString(5));
				dto.setN_type(rs.getString(6));
				dto.setN_count(rs.getString(7));
				list.add(dto);
			}
		} catch (SQLException e) {e.printStackTrace();}
		return list;
	}///////////selectListNotice()
	
	// 공지사항 총 레코드 수 얻기용
	public int getTotalRecordNotice() {
		int total = 0;
		String sql = "SELECT COUNT(*) FROM NOTICE";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {e.printStackTrace();}
		return total;
	}//////////getTotalRecordNotice()
	
	// 공지사항 입력용
	public int insertNotice(NoticeDTO dto) {
		int affected = 0;
		String sql = "INSERT INTO NOTICE VALUES(SEQ_NOTICE_N_NO.NEXTVAL, ?, ?, SYSDATE, ?, ?, DEFAULT)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getN_title());
			psmt.setString(2, dto.getN_content());
			psmt.setString(3, dto.getN_img());
			psmt.setString(4, dto.getN_type());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}//////////insertNotice()
	
	// 공지사항 상세보기용
	public NoticeDTO selectOneNotice(String no) {
		NoticeDTO dto = null;
		String sql = "SELECT * FROM NOTICE WHERE N_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()) { 
				dto = new NoticeDTO();
				dto.setN_no(rs.getString(1));
				dto.setN_title(rs.getString(2));
				dto.setN_content(rs.getString(3));
				dto.setN_date(rs.getDate(4));
				dto.setN_img(rs.getString(5));
				dto.setN_type(rs.getString(6));
				dto.setN_count(rs.getString(7));				
			}
		} catch (Exception e) {e.printStackTrace();}
		return dto;
	}////////////////selectOneNotice()
	// 공지사항 수정용
	public int updateNotice(NoticeDTO dto) {
		int affected = 0; 
		String sql = "UPDATE NOTICE SET N_TITLE=?, N_CONTENT=?, SYSDATE, N_IMG=?, N_TYPE=? WHERE N_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getN_title());
			psmt.setString(2, dto.getN_content());
			psmt.setString(3, dto.getN_img());
			psmt.setString(4, dto.getN_type());
			psmt.setString(5, dto.getN_no());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;		
	}//////////updateNotice()
	
	// 공지사항 삭제용
	public int deleteNotice(String n_no) {
		int affected = 0;
		String sql ="DELETE NOTICE WHERE N_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, n_no);
			affected = psmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}//////////deleteNotice()
	
	// 조회수 업데이트
	public void updateCount(String n_count) {
		String sql = "UPDQTE NOTICE SET N_COUNT=N_COUNT+1 WHERE N_NO=?";
		try {
			psmt.getConnection().prepareStatement(sql);
			psmt.setString(1, n_count);
			psmt.executeQuery();	
		} catch (SQLException e) {e.printStackTrace();}
	}///////////updateCount()

}////////////class
