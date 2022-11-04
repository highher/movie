package dao;

import dto.MovieorderDTO;
import util.Dbcon;

public class MovieOrderDAO extends Dbcon{

	public void createMovieOrder(MovieorderDTO movieorder) {
		
		String sql = "insert into movieorder(movieorder_id,movieorder_timetable_id,"
				+ "movieorder_member_id,movieorder_amount) values(?,?,?,?)";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,movieorder.getId());
			pstmt.setInt(2, movieorder.getTimetable_id());
			pstmt.setString(3, movieorder.getMember_id());
			pstmt.setInt(4, movieorder.getAmount());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}

	}

	public void createNovieOrderSeat(MovieorderDTO movieorder) {
		
		String sql = "INSERT INTO movieoder_seat values(?,?,?)";
		
		
		try {
			con = getConnection();
			pstmt=con.prepareStatement(sql);
			
				for (int i = 0; i < movieorder.getSeats().length; i++) {
				pstmt.setString(1, movieorder.getId());
				pstmt.setInt(2,movieorder.getTimetable_id());
				pstmt.setString(3, movieorder.getSeats()[i]);
				pstmt.executeUpdate();
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}

	}


}
