package dto;

public class MovieCommentDTO {
	
	private int id;
	private int movie_id;
	private String member_id;
	private String category;
	private int score;
	private String comment;
	private String date;
	private int story;
	private int ost;
	private int visual;
	private int directing;
	private int acting;
	
	public int getStory() {
		return story;
	}
	public void setStory(int story) {
		this.story = story;
	}
	public int getOst() {
		return ost;
	}
	public void setOst(int ost) {
		this.ost = ost;
	}
	public int getVisual() {
		return visual;
	}
	public void setVisual(int visual) {
		this.visual = visual;
	}
	public int getDirecting() {
		return directing;
	}
	public void setDirecting(int directing) {
		this.directing = directing;
	}
	public int getActing() {
		return acting;
	}
	public void setActing(int acting) {
		this.acting = acting;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "MovieCommentDTO [id=" + id + ", movie_id=" + movie_id + ", member_id=" + member_id + ", category="
				+ category + ", score=" + score + ", comment=" + comment + ", date=" + date + ", story=" + story
				+ ", ost=" + ost + ", visual=" + visual + ", directing=" + directing + ", acting=" + acting + "]";
	}
	
	
	
}
