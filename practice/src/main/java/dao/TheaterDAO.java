package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.TheaterDTO;
import util.Dbcon;

public class TheaterDAO extends Dbcon {
	
	public List<TheaterDTO> getTheaterList() {
		
		String sql = "SELECT * FROM theater WHERE theater_location ='서울'";
		
		List<TheaterDTO> list = new ArrayList<>();
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				TheaterDTO theater = new TheaterDTO();
				theater.setId(rs.getInt("theater_id"));
				theater.setName(rs.getString("theater_name"));
				list.add(theater);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public List<TheaterDTO> getTheaterListByLocation(String location) {
		
		String sql = "SELECT * FROM theater WHERE theater_location = ?";
		
		List<TheaterDTO> list = new ArrayList<>();
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,location);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				TheaterDTO theater = new TheaterDTO();
				theater.setId(rs.getInt("theater_id"));
				theater.setName(rs.getString("theater_name"));
				list.add(theater);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	
		return list;
			
	}


}
