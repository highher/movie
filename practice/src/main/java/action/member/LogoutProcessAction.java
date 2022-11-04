package action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;

public class LogoutProcessAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "movie?command=main";
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		
		request.getRequestDispatcher(url).forward(request, response);
		

	}

}
