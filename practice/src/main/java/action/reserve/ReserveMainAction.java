package action.reserve;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.MovieDAO;
import dto.MovieDTO;
import util.DateAndWeek;

public class ReserveMainAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "WEB-INF/reserve/reserveList.jsp";
		
		List<MovieDTO> movielist = new ArrayList<>();
		List<DateAndWeek> datelist = new ArrayList<>();
		List<MovieDTO> recommendlist = new ArrayList<>();
		
		MovieDAO dao = new MovieDAO();
		DateAndWeek date = new DateAndWeek();
		
		recommendlist=dao.selectList_movie();
		movielist=dao.getShowingMovieList();
		datelist = date.get15days();
		
		request.setAttribute("recommendMovie", recommendlist);
		request.setAttribute("movielist", movielist);
		request.setAttribute("datelist", datelist);
		
		request.getRequestDispatcher(url).forward(request, response);

	}

}
