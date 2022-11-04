package action.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import action.Action;
import dao.TimetableDAO;
import dto.TheaterDTO;
import dto.TimetableDTO;

public class AjaxTimetableList implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String data = request.getParameter("data");
		response.getWriter().write(getTimetable(data));
		
	}

	private String getTimetable(String data) {
		JSONParser parser = new JSONParser();
		JSONObject jsonObj=null;
		try {
			jsonObj = (JSONObject)parser.parse(data);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String date = jsonObj.get("date").toString();
		JSONArray movies_ = (JSONArray) jsonObj.get("movies");
		JSONArray theaters_ = (JSONArray) jsonObj.get("theaters");
		
		String[] theaters;
		String[] movies;
		
		movies=getJsonToIdListMovie(movies_);
		theaters=getJsonToIdListTheater(theaters_);

		TimetableDAO dao = new TimetableDAO();
		List<TimetableDTO> timetableList= new ArrayList<>();
		timetableList=dao.getTimetableList(date,movies,theaters);
		
		StringBuffer timetableInfo = new StringBuffer("");
		
		if(timetableList.size()!= 0) {
		timetableInfo.append("[");
		
		for (int i = 0; i < timetableList.size(); i++) {
			TimetableDTO theater= timetableList.get(i);
			timetableInfo.append("{\"id\":\"" + theater.getId() + "\",");
			timetableInfo.append("\"title\":\"" + theater.getTitle() + "\",");
			timetableInfo.append("\"grade\":\"" + theater.getGrade() + "\",");
			timetableInfo.append("\"s_time\":\"" + theater.getS_time() + "\",");
			timetableInfo.append("\"e_time\":\"" + theater.getE_time() + "\",");
			timetableInfo.append("\"theater\":\"" + theater.getTheater() + "\",");			
			timetableInfo.append("\"screen\":\"" + theater.getScreen() + "\",");
			timetableInfo.append("\"totalseat\":\"" + theater.getTotoalseat() + "\",");
			timetableInfo.append("\"leftseat\":\"" + theater.getLeftseat() + "\"},");
			
		}
		timetableInfo.deleteCharAt(timetableInfo.length()-1);
		timetableInfo.append("]");
		}else {
			timetableInfo.append("{\"data\":\"nodata\"}");
		}
		System.out.println(timetableInfo);
		return timetableInfo.toString();
	}

	private String[] getJsonToIdListTheater(JSONArray arr) {
		String[] list;
		list=new String[arr.size()];
		for (int i = 0; i < arr.size(); i++) {
			JSONObject theater = (JSONObject) arr.get(i);
			list[i]=theater.get("theaterId").toString();
			
		}
		return list;
	}


	private String[] getJsonToIdListMovie(JSONArray arr) {
		String[] list;
		list=new String[arr.size()];
		for (int i = 0; i < arr.size(); i++) {
			JSONObject movie = (JSONObject) arr.get(i);
			list[i]=movie.get("movieId").toString();
		
		}
		return list;
	}



}
