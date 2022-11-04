package dao;

import java.util.ArrayList;
import java.util.List;

import dto.TimetableDTO;
import util.Dbcon;

public class TimetableDAO extends Dbcon {

	public List<TimetableDTO> getTimetableList(String date, String[] movies, String[] theaters) {
		
		List<TimetableDTO> list = new ArrayList<>();
		String sql = "SELECT * from timetableinfo2 where timetable_date = '"+date+"' ";
		
		for (int i = 0; i < movies.length; i++) {
			if(i==0) {
				sql += " "+" and ( movie_id = "+" '" + movies[i]+"' " ;
			}else {
				sql += " "+" or movie_id = "+" '" + movies[i]+"' " ;
			}
			if(i==movies.length-1) {
				sql+=")";
			}
		}
		
		for (int i = 0; i < theaters.length; i++) {
			if(i==0) {
				sql += " "+" and ( theater_id = "+" '" + theaters[i]+"' " ;
			}else {
				sql += " "+" or theater_id = "+" '" + theaters[i]+"' " ;
			}
			if(i==theaters.length-1) {
				sql+= ")";
			}
		}
		
		sql+= " order by s_time, title ";
		
		System.out.println(sql);
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				TimetableDTO timetable = new TimetableDTO();
				timetable.setId(rs.getInt("id"));
				timetable.setTitle(rs.getString("title"));
				timetable.setGrade(rs.getString("grade"));
				timetable.setTheater(rs.getString("theater_name"));
				timetable.setScreen(rs.getString("screen_name"));
				timetable.setS_time(rs.getString("s_time"));
				timetable.setE_time(rs.getString("e_time"));
				timetable.setTotoalseat(rs.getInt("total_seat"));
				timetable.setLeftseat(rs.getInt("left_seat"));
				list.add(timetable);
			}
			
		} catch (Exception e) {
			
			
		}
		close();
		return list;
	}

	public TimetableDTO getTimetable(int t_id) {
		
		TimetableDTO timetable = new TimetableDTO();
		String sql = "SELECT * from timetableinfo2 where id= " +t_id;
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				timetable.setId(rs.getInt("id"));
				timetable.setImg(rs.getString("img"));
				timetable.setTitle(rs.getString("title"));
				timetable.setGrade(rs.getString("grade"));
				timetable.setS_time(rs.getString("s_time"));
				timetable.setE_time(rs.getString("e_time"));
				timetable.setTheater(rs.getString("theater_name"));
				timetable.setScreen(rs.getString("screen_name"));
				timetable.setTotoalseat(rs.getInt("total_seat"));
				timetable.setLeftseat(rs.getInt("left_seat"));
				timetable.setPrice(rs.getInt("price"));
				timetable.setDate(rs.getDate("timetable_date"));
				timetable.setType(rs.getString("seat_type"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return timetable;
	}

	public List<TimetableDTO> getTimetableList(String id) {
		
		List<TimetableDTO> list = new ArrayList<>();
		String sql = "select * from timetableinfo2  as a left join movieorder as b "
				+ " on a.id = b.movieorder_timetable_id where b.movieorder_member_id=? "
				+ " order by movieorder_date desc limit 0,5";
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				TimetableDTO timetable = new TimetableDTO();
				timetable.setId(rs.getInt("id"));
				timetable.setTitle(rs.getString("title"));
				timetable.setGrade(rs.getString("grade"));
				timetable.setDate(rs.getDate("timetable_date"));
				timetable.setTheater(rs.getString("theater_name"));
				timetable.setScreen(rs.getString("screen_name"));
				timetable.setS_time(rs.getString("s_time"));
				timetable.setE_time(rs.getString("e_time"));
				timetable.setTotoalseat(rs.getInt("total_seat"));
				timetable.setLeftseat(rs.getInt("left_seat"));
				timetable.setAmount(rs.getInt("movieorder_amount"));
				timetable.setO_date(rs.getTimestamp("movieorder_date"));
				list.add(timetable);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		close();
		return list;
	
	}



}
