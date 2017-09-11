package controller.cmn;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dao.MemberDAO;
import controller.dto.MemberDTO;

public class MemberEditController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("id", req.getParameter("id"));
		MemberDAO dao = new MemberDAO(req.getServletContext());
		MemberDTO dto = new MemberDTO();
		dto = dao.selectOne(req.getParameter("id"));
		req.setAttribute("dto", dto);
		req.setAttribute("page", "member");
		req.getRequestDispatcher("/WEB-INF/Admin/MemberEdit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		//수정처리
		MemberDAO dao = new MemberDAO(req.getServletContext());
		MemberDTO dto = new MemberDTO();
		dto.setId(req.getParameter("id"));
		dto.setName(req.getParameter("name"));
		dto.setPass(req.getParameter("cpassword"));
		dto.setAddr(req.getParameter("addr1")+"%&@#*^$@!"+req.getParameter("addr2"));
		String mm = req.getParameter("mm").length() ==1 ? "0" + req.getParameter("mm") : req.getParameter("mm");
		String dd = req.getParameter("dd").length() ==1 ? "0" + req.getParameter("dd") : req.getParameter("dd");
		dto.setBirth(req.getParameter("yyyy")+ mm + dd);
		dto.setEmail(req.getParameter("email"));
		dto.setGender(req.getParameter("gender"));
		dto.setPost(req.getParameter("post1")+"-"+req.getParameter("post2"));
		dto.setTel(req.getParameter("tel"));
		dto.setR_name(req.getParameter("rating"));
		
		int affected = dao.memberUpdate(dto);
		if(affected == 0) req.setAttribute("editMessage", "회원정보 수정에 실패하였습니다.");
		else req.setAttribute("editMessage", "회원정보가 수정되었습니다.");
		req.setAttribute("page", "member");
		req.setAttribute("edit", "edit");
		dao.close();
		
		req.getRequestDispatcher("/Member.do").forward(req, resp);
	}
}
