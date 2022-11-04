package action.theater;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.TheaterDAO;
import dto.TheaterDTO;

public class TheaterListAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "WEB-INF/theater/TheaterList.jsp";
		
		List<TheaterDTO> theaterlist = new ArrayList<>();
		TheaterDAO dao = new TheaterDAO();
		
		theaterlist=dao.getTheaterList();
		
		request.setAttribute("theaterList",theaterlist);
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
