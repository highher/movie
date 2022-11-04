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

public class MovieMainAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String url = "WEB-INF//movie/movie_main.jsp";
		
		MovieDAO dao = new MovieDAO();
		List<MovieDTO> list = new ArrayList<>();
		
		list = dao.selectList();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher(url).forward(request, response);
		

	}

}
