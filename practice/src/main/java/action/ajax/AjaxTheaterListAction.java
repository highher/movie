package action.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.TheaterDAO;
import dto.TheaterDTO;

public class AjaxTheaterListAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String location = request.getParameter("location");
		response.getWriter().write(getTheater(location));

	}
	private String getTheater(String location) {
		if(location==null) location ="";
		
		StringBuffer theaterInfo = new StringBuffer("");
		TheaterDAO dao = new TheaterDAO();
		
		List<TheaterDTO> list = new ArrayList<>();
		list=dao.getTheaterListByLocation(location);
		
		theaterInfo.append("[");
		
		for (int i = 0; i < list.size(); i++) {
			TheaterDTO theater= list.get(i);
			theaterInfo.append("{\"id\":\"" + theater.getId() + "\",");
			theaterInfo.append("\"name\":\"" + theater.getName() + "\"},");
		}
		theaterInfo.deleteCharAt(theaterInfo.length()-1);
		theaterInfo.append("]");
		return theaterInfo.toString();
	}

}
