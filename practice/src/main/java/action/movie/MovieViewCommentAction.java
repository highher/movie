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

public class MovieViewCommentAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "WEB-INF/movie/movie_view_comment.jsp";
		
		MovieCommentDAO c_dao = new MovieCommentDAO();
		MovieDTO movie = new MovieDTO();
		MovieDAO dao = new MovieDAO();
		
		String movie_id_ = request.getParameter("movie_id");
		int movie_id = Integer.parseInt(movie_id_);
		String page_ = request.getParameter("page");
		
		if(page_==null) {page_="1";}
		int page = Integer.parseInt(page_);
		int index_no = (page-1)*10;
	    int countAll = c_dao.selectCnt(movie_id);
	    int lastpage = (int)Math.ceil((double)countAll/10);

		
		List<MovieCommentDTO> commentlist= new ArrayList<>();

		
		commentlist = c_dao.viewMovie_Comment_movieComment(movie_id,index_no);
		movie=dao.viewMovie(movie_id);
		
		request.setAttribute("lastpage", lastpage);
		request.setAttribute("commentlist", commentlist);
		request.setAttribute("movie",movie);
		
		request.getRequestDispatcher(url).forward(request, response);

	}

}
