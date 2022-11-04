package action.event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;

public class EventLastEventListActon implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "WEB-INF/event/lastevent.jsp";
		
		request.getRequestDispatcher(url).forward(request, response);

	}

}
