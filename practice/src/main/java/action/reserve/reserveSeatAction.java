package action.reserve;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.SalesSeatDAO;
import dao.TimetableDAO;
import dto.SalesSeatDTO;
import dto.TimetableDTO;
import util.ViewType;

public class reserveSeatAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "WEB-INF/reserve/reserve_seat.jsp";
		
		//타임테이블 아이디
		String t_id_ = request.getParameter("timetable_id");
		int t_id = Integer.parseInt(t_id_);
		
		TimetableDAO t_dao = new TimetableDAO();
		TimetableDTO t_info = t_dao.getTimetable(t_id);
		
		//판매된 자리
		List<SalesSeatDTO> sales_seats = new ArrayList<>();
		SalesSeatDAO s_dao = new SalesSeatDAO();
		sales_seats = s_dao.getSeatListByT_id(t_id);
		
		//좌석
		ViewType vt = new ViewType();
		String[][] type = vt.getSeatViewByViewType(t_info.getType());
		type=vt.getSeatViewAdjust(type,sales_seats);
		
		
		request.setAttribute("type", type);
		request.setAttribute("timetalble", t_info);
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
