package action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;

public class LoginMemberAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String url = "WEB-INF/member/login_member.jsp";
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
