package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MovieDAO;
import dto.MovieDTO;

@WebServlet("/multicontroller")
public class MovieController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MovieController2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String url = "movie?command=main";
		
		int maxSize  = 1024*1024*10;
		
		HttpSession session =request.getSession();
		String savePath = session.getServletContext().getRealPath("/");
	
		
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		Enumeration<?> files = multi.getFileNames();
		String name = (String)files.nextElement();
		
		String title = multi.getParameter("title");
		String content= multi.getParameter("content");
		content=content.replace("\r\n","<br>");
		String img = multi.getFilesystemName(name);
		String director = multi.getParameter("director");
		String actor = multi.getParameter("actor");
		String date_ = multi.getParameter("date").replace("-", "");
		long date_L = Long.parseLong(date_);
		Date date = new Date(date_L);

		String nation = multi.getParameter("nation");
		String genre = multi.getParameter("genre");
		String time_ = multi.getParameter("time");
		int time=0;
		if(time_!=null) {time = Integer.parseInt(time_);}
		
		String score_ = multi.getParameter("score");
		float score = 0L;
		if(score_!=null) {Float.parseFloat(score_);}
		
		String cnt_ = multi.getParameter("amount");
		int cnt=0;
		if(cnt_!=null) {cnt=Integer.parseInt(cnt_);}
		
		MovieDTO movie = new MovieDTO();
		movie.setTitle(title);
		movie.setContent(content);
		movie.setImg(img);
		movie.setDirector(director);
		movie.setActor(actor);
		movie.setDate(date);
		movie.setNation(nation);
		movie.setGenre(genre);
		movie.setTime(time);
		movie.setScore(score);
		movie.setView(cnt);
		
		MovieDAO dao = new MovieDAO();
		
		dao.createMovie(movie);
		
		response.sendRedirect(url);
	}
}