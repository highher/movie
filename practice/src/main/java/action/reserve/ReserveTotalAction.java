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

public class ReserveTotalAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "WEB-INF/reserve/totalreserve.jsp";
		
		List<MovieDTO> movielist = new ArrayList<>();
		
		MovieDAO dao = new MovieDAO();
		
		movielist=dao.getShowingMovieList();
		
		request.setAttribute("movielist", movielist);

		request.getRequestDispatcher(url).forward(request, response);

	}

}
