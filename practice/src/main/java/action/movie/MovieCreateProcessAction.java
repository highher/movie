package action.movie;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import dao.MovieDAO;
import dto.MovieDTO;

public class MovieCreateProcessAction implements Action {

	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "movie?command=main";
		
		int maxSize  = 1024*1024*10;
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "upload";
		
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		Enumeration<?> files = multi.getFileNames();
		String name = (String)files.nextElement();
		
		String title = multi.getParameter("title");
		String content= multi.getParameter("content");
		content=content.replace("\r\n","<br>");
		String img = multi.getFilesystemName(name);
		String director = multi.getParameter("director");
		String actor = multi.getParameter("actor");
		String date_ = multi.getParameter("date");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-");
		Date date =new Date();
		
		try {
			date = formatter.parse(date_);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
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
