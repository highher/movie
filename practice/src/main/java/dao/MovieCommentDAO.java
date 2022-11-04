package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.MovieCommentDTO;
import util.Dbcon;

public class MovieCommentDAO extends Dbcon{

	public List<MovieCommentDTO> viewMovie_movieComment(int movie_id) {
		
		String sql = "select * from moviecomment where moviecomment_movie_id=? order by moviecomment_id desc limit 0,5";
		List<MovieCommentDTO> list = new ArrayList<>();
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, movie_id);
			rs=pstmt.executeQuery();
		
			while(rs.next()) {
				MovieCommentDTO comment = new MovieCommentDTO();
				comment.setId(rs.getInt("moviecomment_id"));
				comment.setMember_id(rs.getString("moviecomment_member_id"));
				comment.setScore(rs.getInt("moviecomment_score"));
				comment.setComment(rs.getString("moviecomment_comment"));
				comment.setCategory(rs.getString("moviecomment_category"));
				comment.setDate(rs.getString("moviecomment_date"));
				list.add(comment);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	public List<MovieCommentDTO> viewMovie_Comment_movieComment(int movie_id, int index_no) {
		
		String sql = "select * from moviecomment where moviecomment_movie_id=? "
				+ "order by moviecomment_id desc "
				+ "limit ?,?";
		List<MovieCommentDTO> list = new ArrayList<>();
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, movie_id);
			pstmt.setInt(2, index_no);
			pstmt.setInt(3, index_no+10);
			rs=pstmt.executeQuery();
		
			while(rs.next()) {
				MovieCommentDTO comment = new MovieCommentDTO();
				comment.setId(rs.getInt("moviecomment_id"));
				comment.setMember_id(rs.getString("moviecomment_member_id"));
				comment.setScore(rs.getInt("moviecomment_score"));
				comment.setComment(rs.getString("moviecomment_comment"));
				comment.setCategory(rs.getString("moviecomment_category"));
				comment.setDate(rs.getString("moviecomment_date"));
				list.add(comment);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	public MovieCommentDTO getMovieCommentData(int movie_id) {
		
		String sql = "call comment_data(?)";
		MovieCommentDTO movieCommentData = new MovieCommentDTO();
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, movie_id);
			rs=pstmt.executeQuery();
		
			if(rs.next()) {
				movieCommentData.setStory(rs.getInt("story"));
				movieCommentData.setOst(rs.getInt("ost"));
				movieCommentData.setActing(rs.getInt("actor"));
				movieCommentData.setDirecting(rs.getInt("directing"));
				movieCommentData.setVisual(rs.getInt("visual"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return movieCommentData;
	}
	public int createComment(MovieCommentDTO m_comment) {
		
		int num=0;
		
		String sql = "insert into moviecomment(moviecomment_movie_id"
				+ ",moviecomment_member_id,moviecomment_category,"
				+ "moviecomment_score,moviecomment_comment) "
				+ "values(?,?,?,?,?)";
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, m_comment.getMovie_id());
			pstmt.setString(2, m_comment.getMember_id());
			pstmt.setString(3, m_comment.getCategory());
			pstmt.setInt(4, m_comment.getScore());
			pstmt.setString(5, m_comment.getComment());
			num=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}

		return num;
		
	}
	public int selectCnt(int movie_id) {
		
		int num=0;
		
		String sql = "select a.movie_id,ifnull(count(b.moviecomment_movie_id),0) as cnt "
				+ "from  movie as a left join moviecomment as b "
				+ "on a.movie_id=b.moviecomment_movie_id group by b.moviecomment_movie_id "
				+ "having movie_id=?";
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, movie_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return num;
	}
	
}
