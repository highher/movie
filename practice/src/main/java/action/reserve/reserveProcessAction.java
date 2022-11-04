package action.reserve;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.MovieOrderDAO;
import dto.MovieorderDTO;
import util.OrderNum;


public class reserveProcessAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		
		
		HttpSession session = request.getSession();
		if(session.getAttribute("id")!=null) {
			
			String url = "movie?command=reseveResult";
			
			OrderNum orderNum = new OrderNum();
			String order_id = orderNum.getOrderNum();
			
			String memebr_id = session.getAttribute("id").toString();
			String timetable_id_ = request.getParameter("timetalble_id");
			String amount_ = request.getParameter("amount");
			String seats_ = request.getParameter("seats");
			
			int amount = Integer.parseInt(amount_);
			int timetable_id = Integer.parseInt(timetable_id_);
			String[] seats = seats_.split(",");
			
			MovieorderDTO movieorder = new MovieorderDTO();
			movieorder.setId(order_id);
			movieorder.setMember_id(memebr_id);
			movieorder.setAmount(amount);
			movieorder.setTimetable_id(timetable_id);
			movieorder.setSeats(seats);
			
			MovieOrderDAO dao = new MovieOrderDAO();
			dao.createMovieOrder(movieorder);
			dao.createNovieOrderSeat(movieorder);
			
			response.sendRedirect(url);
			
		}else {
			String timetable_id_ = request.getParameter("timetalble_id");
			String failUrl = "movie?command=select_seat&timetable_id="+timetable_id_+"&error=no_member";
			response.sendRedirect(failUrl);
			
			
		}
		
		
		
	}

}
