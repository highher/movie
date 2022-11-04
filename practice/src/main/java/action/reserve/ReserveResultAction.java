package action.reserve;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;

public class ReserveResultAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String url = "WEB-INF/reserve/reseveResult.jsp";
		
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
