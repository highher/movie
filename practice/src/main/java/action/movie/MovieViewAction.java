package action.movie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.MovieCommentDAO;
import dao.MovieDAO;
import dto.MovieCommentDTO;
import dto.MovieDTO;

public class MovieViewAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "WEB-INF/movie/movie_view.jsp";
		
		String movie_id_ = request.getParameter("movie_id");
		int movie_id = Integer.parseInt(movie_id_);
		
		MovieDTO movie = new MovieDTO();
		MovieDAO dao = new MovieDAO();
		
		List<MovieCommentDTO> commentlist= new ArrayList<>();
		MovieCommentDAO dao2 = new MovieCommentDAO();
		MovieCommentDTO moviecommentData = new MovieCommentDTO();
		
		moviecommentData = dao2.getMovieCommentData(movie_id);
		commentlist = dao2.viewMovie_movieComment(movie_id);
		movie=dao.viewMovie(movie_id);
		
		request.setAttribute("commentlist", commentlist);
		request.setAttribute("commentData", moviecommentData);
		request.setAttribute("movie",movie);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
