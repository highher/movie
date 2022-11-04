package action;

import action.ajax.AjaxMoreLastMovieAction;
import action.ajax.AjaxTheaterListAction;
import action.ajax.AjaxTimetableList;
import action.comment.ResistCommentAction;
import action.event.EventLastEventListActon;
import action.liketable.CreateLiketableAction;
import action.member.CreateMemberAction;
import action.member.CreateMemberProcessAction;
import action.member.LoginMemberAction;
import action.member.LoginProcessAction;
import action.member.LogoutProcessAction;
import action.member.MemberInfoAction;
import action.movie.MovieCreateFormAction;
import action.movie.MovieCreateProcessAction;
import action.movie.MovieListAction;
import action.movie.MovieListCommingsoonAction;
import action.movie.MovieListLastmovieAction;
import action.movie.MovieMainAction;
import action.movie.MovieViewAction;
import action.movie.MovieViewCommentAction;
import action.reserve.ReserveMainAction;
import action.reserve.ReserveResultAction;
import action.reserve.ReserveTotalAction;
import action.reserve.reserveProcessAction;
import action.reserve.reserveSeatAction;
import action.store.StoreMainAction;
import action.theater.TheaterListAction;

public class ActionFactory {
	
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("main")) {
			action = new MovieMainAction();
		}
		if(command.equals("view")) {
			action = new MovieViewAction();
		}
		if(command.equals("view_comment")) {
			action = new MovieViewCommentAction();
		}
		if(command.equals("list")) {
			action = new MovieListAction();
		}
		if(command.equals("commingsoon")) {
			action = new MovieListCommingsoonAction();
		}
		if(command.equals("lastmovie")) {
			action = new MovieListLastmovieAction();
		}
		if(command.equals("create_form")) {
			action = new MovieCreateFormAction();
		}
		if(command.equals("create_process")) {
			action = new MovieCreateProcessAction();
		}		
		if(command.equals("theaterList")){
			action = new TheaterListAction();
		}
		if(command.equals("ajaxTheaterList")) {
			action = new AjaxTheaterListAction();
		}
		if(command.equals("reserve_main")) {
			action = new ReserveMainAction();
		}
		if(command.equals("totalreserve")) {
			action = new ReserveTotalAction();
		}
		if(command.equals("ajaxTimetableList")) {
			action = new AjaxTimetableList();
		}
		if(command.equals("create_member")){
			action = new CreateMemberAction();
		}
		if(command.equals("create_member_process")) {
			action = new CreateMemberProcessAction();
		}
		if(command.equals("lastevent")) {
			action = new EventLastEventListActon();
		}
		if(command.equals("loginmember")) {
			action = new LoginMemberAction();
		}
		if(command.equals("loginprocess")) {
			action = new LoginProcessAction();
		}
		if(command.equals("logoutmember")) {
			action = new LogoutProcessAction();
		}
		if(command.equals("storeMain")) {
			action = new StoreMainAction();
		}
		if(command.equals("resist_comment")) {
			action = new ResistCommentAction();
		}
		if(command.equals("createliketable")) {
			action = new CreateLiketableAction();
		}
		if(command.equals("select_seat")) {
			action = new reserveSeatAction();
		}
		if(command.equals("moreLastMovie")){
			action = new AjaxMoreLastMovieAction();
		}
		if(command.equals("member_info")) {
			action = new MemberInfoAction();
		}
		if(command.equals("reserveSeatProcess")) {
			action = new reserveProcessAction();
		}
		if(command.equals("reseveResult")) {
			action = new ReserveResultAction();
		}
		return action;
	}
}
