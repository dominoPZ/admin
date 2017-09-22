package controller.cmn;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dtr.DrinkDao;
import model.dtr.DrinkDto;

public class DrinkEditController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DrinkDao dao = new DrinkDao(req.getServletContext());
		DrinkDto dto = new DrinkDto();
		
		//dto.setDr_no(dr_no);
		
	}
}
