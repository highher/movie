package action.movie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.MovieDAO;
import dto.MovieDTO;

public class MovieListLastmovieAction implements Action {


	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "WEB-INF//movie/movie_list_lastmovie.jsp";
		
		String search = request.getParameter("title");
		
		MovieDAO dao = new MovieDAO();
		List<MovieDTO> list = new ArrayList<>();
		
		list = dao.getLastMovieList(search);
		int totalCnt = 0;
		totalCnt = dao.getShowingMovieListCnt(search);
		
		request.setAttribute("list", list);
		request.setAttribute("totalCnt", totalCnt);
		
		request.getRequestDispatcher(url).forward(request, response); 

	}

}