package dao;

import java.util.ArrayList;
import java.util.List;

import dto.SalesSeatDTO;
import util.Dbcon;

public class SalesSeatDAO extends Dbcon{

	public List<SalesSeatDTO> getSeatListByT_id(int timetable_id) {
		
		String sql = "select * from movieoder_seat where  "
				+ "movieoder_seat_movieorder_timetable_id=?";
		
		List<SalesSeatDTO> list = new ArrayList<>();
		
		try {
			con = getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, timetable_id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				SalesSeatDTO seat = new SalesSeatDTO();
				seat.setSeat_num(rs.getString("movieoder_seat_seat_num"));
				list.add(seat);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		
		return list;
	}

}
