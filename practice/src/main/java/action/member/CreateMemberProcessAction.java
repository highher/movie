package action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.MemberDAO;
import dto.MemberDTO;

public class CreateMemberProcessAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url ="movie?command=loginmember";
		
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email_ = request.getParameter("email");
		String emailAdd = request.getParameter("emailAdd");
		String email = email_+"@"+emailAdd;
		
		
		MemberDAO dao = new MemberDAO();
		MemberDTO member = new MemberDTO();
		member.setMember_id(id);
		member.setMember_password(pass);
		member.setMember_name(name);
		member.setMember_tel(tel);
		member.setMember_email(email);
		dao.createMember(member);
		
		
		response.sendRedirect(url);
		

	}

}
