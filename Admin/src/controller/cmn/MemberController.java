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

public class MemberController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//회원 리스트 출력용]
		MemberDAO dao = new MemberDAO(req.getServletContext());
		Map map = new HashMap();
		try {
			map.put("searchWord", req.getParameter("searchWord"));
			map.put("searchColumn", req.getParameter("searchColumn"));
			//검색용]
			req.setAttribute("searchColumn", req.getParameter("searchColumn"));
			req.setAttribute("searchWord", req.getParameter("searchWord"));			
			//정렬 순서 처리용]
			if(req.getParameter("radioV") == null || req.getParameter("radioV") == "id"){
				map.put("radioV", "id");
				req.setAttribute("radioCheck", "id");
			}
			else {
				map.put("radioV", req.getParameter("radioV"));
				req.setAttribute("radioCheck", req.getParameter("radioV"));
			}
			List list = dao.selectList(map);
			req.setAttribute("list", list);
			req.setAttribute("page", "member");
			dao.close();
			req.getRequestDispatcher("/WEB-INF/Admin/Member.jsp").forward(req, resp);	
		} catch (Exception e) {e.getStackTrace();}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기냐?");
		MemberDAO dao = new MemberDAO(req.getServletContext());
		int affected=0;
		System.out.println("ASD");
		//삭제 처리용]
		if(req.getAttribute("edit")!=null) {
			req.setAttribute("affected", 1);
			req.setAttribute("message", "수정이 완료되었습니다.");
		}
		else if(req.getParameter("mode").equals("DEL")){
			String[] ids = req.getParameterValues("leave");
			if(ids != null){
				for(String id : ids){
					affected += dao.delete(id);
					//리퀘스트 영역에 데이터 저장]
					req.setAttribute("affected", affected);
					req.setAttribute("message", "선택하신 회원이 모두 탈퇴되었습니다.");
				}
			}
			dao.close();
			
		}
		//포워드]
		req.getRequestDispatcher("/WEB-INF/Admin/Message1.jsp").forward(req, resp);
	}
}