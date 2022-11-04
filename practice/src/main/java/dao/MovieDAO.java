package dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import dto.MovieDTO;
import util.Dbcon;

public class MovieDAO extends Dbcon{
	
	//영화 리스트
	public List<MovieDTO> selectList(){
		
		List<MovieDTO> list  = new ArrayList<>();
		
		String sql = "call mainmovie()";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MovieDTO  movie =  new MovieDTO(); 
				movie.setId(rs.getInt("movie_id"));
				movie.setTitle(rs.getString("movie_title"));
				movie.setContent(rs.getString("movie_content"));
				movie.setImg(rs.getString("movie_poster"));
				movie.setLike(rs.getInt("totallike"));
				movie.setScore(rs.getFloat("avgscore"));
				list.add(movie);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close();
		return list;
		
	}

	//영화 하나 보기 
	public MovieDTO viewMovie(int movie_id) {
		MovieDTO movie = new MovieDTO();
		
		String sql = "select * from movieinfo where movie_id=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				movie.setId(rs.getInt("movie_id"));
				movie.setTitle(rs.getString("movie_title"));
				movie.setEtitle(rs.getString("movie_title_eg"));
				movie.setContent(rs.getString("movie_content"));
				
				String content = rs.getString("movie_content");
				String catchprise =content.split("<br/>")[0];
				
				movie.setCatchprise(catchprise);
				
				movie.setImg(rs.getString("movie_poster"));
				movie.setDirector(rs.getString("movie_director"));
				movie.setGenre(rs.getString("movie_gerne"));
				movie.setNation(rs.getString("movie_nation"));
				movie.setTime(rs.getInt("movie_time"));
				movie.setActor(rs.getString("movie_actor"));
				movie.setDate(rs.getDate("movie_date"));
				movie.setView(rs.getInt("movie_view"));
				movie.setLike(rs.getInt("totallike"));
				movie.setCommentCnt(rs.getInt("comment_cnt"));
				movie.setScore(rs.getFloat("avgscore"));
				movie.setTotal(rs.getInt("total"));
				movie.setSales(rs.getInt("sales"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close();
		return movie;
	}
	
	public void createMovie(MovieDTO movie) {
		
		String sql = "INSERT INTO movie(movie_title,"
				+ "movie_content,movie_image,movie_director,movie_actor,movie_date,movie_nation,"
				+ "movie_genre,movie_time,movie_score,movie_cnt) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movie.getTitle());
			pstmt.setString(2, movie.getContent());
			pstmt.setString(3, movie.getImg());
			pstmt.setString(4, movie.getDirector());
			pstmt.setString(5, movie.getActor());
			pstmt.setDate(6, (Date) movie.getDate());
			pstmt.setString(7, movie.getNation());
			pstmt.setString(8, movie.getGenre());
			pstmt.setInt(9, movie.getTime());
			pstmt.setFloat(10, movie.getScore());
			pstmt.setInt(11, movie.getView());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close();
		
	}

	public List<MovieDTO> selectList_movie() {
		
		List<MovieDTO> list  = new ArrayList<>();
		
		String sql = "call mainmovie()";
		
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MovieDTO  movie =  new MovieDTO(); 
				movie.setId(rs.getInt("movie_id"));
				movie.setTitle(rs.getString("movie_title"));
				movie.setContent(rs.getString("movie_content"));
				movie.setImg(rs.getString("movie_poster"));
				movie.setDate(rs.getDate("movie_date"));
				movie.setLike(rs.getInt("totallike"));
				movie.setScore(rs.getFloat("avgscore"));
				list.add(movie);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close();
		return list;
		
	}
	public List<MovieDTO> getShowingMovieList() {
		
		String sql = "select * from nowmovie ";
		
		List<MovieDTO> list = new ArrayList<>();
		
		try {
			con=getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				MovieDTO movie = new MovieDTO();
				movie.setId(rs.getInt("movie_id"));
				movie.setTitle(rs.getString("movie_title"));
				movie.setImg(rs.getString("movie_poster"));
				movie.setDate(rs.getDate("movie_date"));
				movie.setLike(rs.getInt("totallike"));
				movie.setScore(rs.getFloat("avgscore"));
				movie.setContent(rs.getString("movie_content"));
				movie.setTotal(rs.getInt("total"));
				movie.setSales(rs.getInt("sales"));
				list.add(movie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}


	public List<MovieDTO> getShowingMovieList(String search) {
		
		String sql = "select * from nowmovie ";
		
		if(search!=null) {
			sql+= "where movie_title like '%"+search+"%'";
		}
		
		sql+= " order by movie_view desc limit 0,8";
		
		List<MovieDTO> list = new ArrayList<>();
		
		try {
			con=getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				MovieDTO movie = new MovieDTO();
				movie.setId(rs.getInt("movie_id"));
				movie.setTitle(rs.getString("movie_title"));
				movie.setImg(rs.getString("movie_poster"));
				movie.setDate(rs.getDate("movie_date"));
				movie.setLike(rs.getInt("totallike"));
				movie.setScore(rs.getFloat("avgscore"));
				movie.setContent(rs.getString("movie_content"));
				movie.setTotal(rs.getInt("total"));
				movie.setSales(rs.getInt("sales"));
				list.add(movie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
	public List<MovieDTO> commingsoonlist(String search) {
		
		String sql = "select * from commingsoon ";
		
		if(search!=null) {
			sql+= " where movie_title like '%"+search+"%'";
		}
		
		sql+=" order by movie_view desc limit 0,8";
		
		List<MovieDTO> list = new ArrayList<>();
		
		try {
			con=getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				MovieDTO movie = new MovieDTO();
				movie.setId(rs.getInt("movie_id"));
				movie.setTitle(rs.getString("movie_title"));
				movie.setImg(rs.getString("movie_poster"));
				movie.setDate(rs.getDate("movie_date"));
				movie.setLike(rs.getInt("totallike"));
				movie.setScore(rs.getFloat("avgscore"));
				movie.setContent(rs.getString("movie_content"));

				list.add(movie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
public List<MovieDTO> commingsoonlist(String search,int s_page) {
		
		String sql = "select * from commingsoon ";
		
		if(search!=null) {
			sql+= " where movie_title like '%"+search+"%'";
		}
		
		sql+=" order by movie_view desc limit "+s_page+" , "+(s_page+8);
		
		List<MovieDTO> list = new ArrayList<>();
		
		try {
			con=getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				MovieDTO movie = new MovieDTO();
				movie.setId(rs.getInt("movie_id"));
				movie.setTitle(rs.getString("movie_title"));
				movie.setImg(rs.getString("movie_poster"));
				movie.setDate(rs.getDate("movie_date"));
				movie.setLike(rs.getInt("totallike"));
				movie.setScore(rs.getFloat("avgscore"));
				movie.setContent(rs.getString("movie_content"));

				list.add(movie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
	public int getShowingMovieListCnt(String search) {
		int cnt=0;
		String sql = "select count(movie_id) as cnt from lastmovie";
		
		if(search!=null) {
			sql+= " where movie_title like '%"+search+"%'";
		}
		
		try {
			con=getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return cnt;
	}

	public int commingsoonCnt(String search) {
		int cnt=0;
		String sql = "select count(movie_id) as cnt from commingsoon";
		
		if(search!=null) {
			sql+= " where movie_title like '%"+search+"%'";
		}
		
		try {
			con=getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return cnt;
	}

	public List<MovieDTO> getLastMovieList(String search) {
		
		String sql = "select * from lastmovie ";
		
		if(search!=null) {
			sql+= " where movie_title like '%"+search+"%'";
		}
		
		sql+=" order by movie_date desc limit 0,8";
		
		List<MovieDTO> list = new ArrayList<>();
		
		try {
			con=getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				MovieDTO movie = new MovieDTO();
				movie.setId(rs.getInt("movie_id"));
				movie.setTitle(rs.getString("movie_title"));
				movie.setImg(rs.getString("movie_poster"));
				movie.setDate(rs.getDate("movie_date"));
				movie.setLike(rs.getInt("totallike"));
				movie.setScore(rs.getFloat("avgscore"));
				movie.setContent(rs.getString("movie_content"));
				movie.setTotal(rs.getInt("total"));
				movie.setSales(rs.getInt("sales"));
				list.add(movie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
	public List<MovieDTO> getLastMovieList(String search,int s_page) {
		
		String sql = "select * from lastmovie ";
		
		if(search!=null) {
			sql+= " where movie_title like '%"+search+"%'";
		}
		
		sql+=" order by movie_date desc limit "+s_page+","+(s_page+8);
		
		List<MovieDTO> list = new ArrayList<>();
		
		try {
			con=getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				MovieDTO movie = new MovieDTO();
				movie.setId(rs.getInt("movie_id"));
				movie.setTitle(rs.getString("movie_title"));
				movie.setImg(rs.getString("movie_poster"));
				movie.setDate(rs.getDate("movie_date"));
				movie.setLike(rs.getInt("totallike"));
				movie.setScore(rs.getFloat("avgscore"));
				movie.setContent(rs.getString("movie_content"));
				movie.setTotal(rs.getInt("total"));
				movie.setSales(rs.getInt("sales"));
				list.add(movie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}

	public int countList_movie(String search) {
		String sql="select count(*) as cnt from nowmovie ";
		
		if(search!=null) {
			sql+= " where movie_title like '%"+search+"%'";
		}
		
		int cnt=0;
		try {
			con=getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close();
		return cnt;
	}
}
