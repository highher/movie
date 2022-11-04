package action.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.MovieCommentDAO;
import dto.MovieCommentDTO;

public class ResistCommentAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = request.getHeader("Referer");
		
		HttpSession session = request.getSession();
		String member_id = session.getAttribute("id").toString();
		
		int movie_id = Integer.parseInt(request.getParameter("movieId"));
		int success=0;
		
		String comment = request.getParameter("content").replace("\r\n", "<br/>");
		String categry = request.getParameter("category");
		
		int score = Integer.parseInt(request.getParameter("score"));
		
		MovieCommentDTO m_comment = new MovieCommentDTO();
		MovieCommentDAO dao = new MovieCommentDAO();
		
		m_comment.setMember_id(member_id);
		m_comment.setMovie_id(movie_id);
		m_comment.setComment(comment);
		m_comment.setCategory(categry);
		m_comment.setScore(score);
		
		success = dao.createComment(m_comment);
		
		if(success==0) {
			request.setAttribute("error", "error occur");
			request.getRequestDispatcher(url).forward(request, response);
		}else {
			response.sendRedirect(url);
		}
		
		
		
	}

}
