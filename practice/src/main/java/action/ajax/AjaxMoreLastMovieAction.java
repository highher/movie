package action.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.MovieDAO;
import dto.MovieDTO;

public class AjaxMoreLastMovieAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String s_page_ = request.getParameter("s_page");
		int s_page = Integer.parseInt(s_page_);
		response.getWriter().write(getMovie(s_page));

	}

	private String getMovie(int s_page) {
		
		StringBuffer MovieInfo = new StringBuffer("");
		MovieDAO dao = new MovieDAO();
		
		List<MovieDTO> list = new ArrayList<>();
		list = dao.getLastMovieList(null,s_page);
		
		MovieInfo.append("[");
		
		for (int i = 0; i < list.size(); i++) {
			MovieDTO movie = list.get(i);
			MovieInfo.append("{\"id\":\"" + movie.getId() + "\",");
			MovieInfo.append("\"title\":\"" + movie.getTitle() + "\",");
			MovieInfo.append("\"img\":\"" + movie.getImg() + "\",");
			MovieInfo.append("\"date\":\"" + movie.getDate() + "\",");
			MovieInfo.append("\"like\":\"" + movie.getLike() + "\",");
			MovieInfo.append("\"score\":\"" + movie.getScore() + "\",");
			//MovieInfo.append("\"content\":\"" + movie.getContent() + "\",");
			MovieInfo.append("\"total\":\"" + movie.getTotal() + "\",");
			MovieInfo.append("\"sales\":\"" + movie.getSales() + "\"},");
		}
		
		MovieInfo.deleteCharAt(MovieInfo.length()-1);
		MovieInfo.append("]");
		
		return MovieInfo.toString();
	}

}


