package action.liketable;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.LiketableDAO;
import dto.LiketableDTO;

public class CreateLiketableAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = request.getHeader("Referer");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id")==null) {
			request.setAttribute("error", "no_member");
			response.sendRedirect(url+"&error=no_member");
			//request.getRequestDispatcher(url).forward(request, response);
		}else {
			int movie_id = Integer.parseInt(request.getParameter("movieId"));
			String member_id = session.getAttribute("id").toString();
			LiketableDAO dao = new LiketableDAO();
			LiketableDTO like = new LiketableDTO();
			like.setMovie_id(movie_id);
			like.setMember_id(member_id);
			
			dao.createLiketableMovie(like);
			
			response.sendRedirect(url);
		}
	}

}
