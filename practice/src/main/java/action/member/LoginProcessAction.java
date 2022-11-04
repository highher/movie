package action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.MemberDAO;
import dto.MemberDTO;

public class LoginProcessAction implements Action {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String successUrl = "movie?command=main";
		String failUrl = "movie?command=loginmember";
		
	    String id = request.getParameter("id");
	    String password = request.getParameter("password");
	    String idSave= request.getParameter("id-save");
	    Cookie cookie = new Cookie("idSave",idSave);
	    
	    if(idSave!=null){
	      response.addCookie(cookie);
	   } else{
	      cookie.setMaxAge(0);
	      response.addCookie(cookie);
	   }
	   
	   MemberDTO member = new MemberDTO();
	   MemberDAO dao = new MemberDAO();
	   
	   member.setMember_id(id);
	   member.setMember_password(password);
	   
	   
	   
	   int success =dao.login(member);
	   if(success==0){
		  request.setAttribute("error", "login error");
	      request.getRequestDispatcher(failUrl).forward(request, response);
	   } else {
		  HttpSession session = request.getSession();
		  session.setAttribute("id", member.getMember_id());
		  request.getRequestDispatcher(successUrl).forward(request, response);
	   }
			
		
	}

}
