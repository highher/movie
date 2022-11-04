package util;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class DateAndWeek {
	
	private String date;
	private String week;
	private String weekKor;
	
	public String getWeekKor() {
		return weekKor;
	}


	public void setWeekKor(String weekKor) {
		this.weekKor = weekKor;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getWeek() {
		return week;
	}


	public void setWeek(String week) {
		this.week = week;
	}

	public List<DateAndWeek> get15days(){
		
		List<DateAndWeek> list = new ArrayList<>();
		
		for(int i = 0; i <= 17; i++) {
			DateAndWeek dateandweek = new DateAndWeek();
			LocalDate date_ = LocalDate.now().plusDays(i);
			Enum<DayOfWeek> week_ = date_.getDayOfWeek();
			DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String date = date_.format(dateTimeFormatter); 
			String week = week_.toString();
			String weekKor = getWeekToKor(week);
			if(i==0) {weekKor ="오늘";}
			if(i==1) {weekKor ="내일";}
			dateandweek.setDate(date);
			dateandweek.setWeek(week);
			dateandweek.setWeekKor(weekKor);
			list.add(dateandweek);
		}

		return list;
	}


	private String getWeekToKor(String week) {
		String weekKor="";
		  if(week.equals("SUNDAY")) {
			  weekKor="일";
		  }
		  if(week.equals("MONDAY")) {
			  weekKor="월";
		  }
		  if(week.equals("TUESDAY")) {
			  weekKor="화";
		  }
		  if(week.equals("WEDNESDAY")) {
			  weekKor="수";
		  }
		  if(week.equals("THURSDAY")) {
			  weekKor="목";
		  }
		  if(week.equals("FRIDAY")) {
			  weekKor="금";
		  }
		  if(week.equals("SATURDAY")) {
			  weekKor="토";
		  }
		  
		return weekKor;
	}
}
