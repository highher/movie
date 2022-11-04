package action.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.TimetableDAO;
import dto.TimetableDTO;

public class MemberInfoAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "WEB-INF/member/member_info.jsp";
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		TimetableDAO dao = new TimetableDAO();
		List<TimetableDTO> list = new ArrayList<>();
		list = dao.getTimetableList(id);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher(url).forward(request, response);

	}

}
