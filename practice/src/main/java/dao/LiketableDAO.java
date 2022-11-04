package dao;

import java.sql.SQLException;

import dto.LiketableDTO;
import util.Dbcon;

public class LiketableDAO extends Dbcon {

	public void createLiketableMovie(LiketableDTO like) {
		
		String sql = "insert into liketable(liketable_movie_id,liketable_member_id) values(?,?)";
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, like.getMovie_id());
			pstmt.setString(2, like.getMember_id());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}

	
}
