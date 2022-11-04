package dto;

import java.util.Date;

public class MovieDTO {
	private int id;   // 영화 고유번호
	private String title;  // 영화 제목
	private String etitle; // 영화 영어 제목
	private String catchprise; // 영화 캐치프라이즈
	private String content;  // 영화 내용
	private String img;   // 영화 이미지 링크
	private String director;    // 영화 감독
	private String actor;   // 영화 출연 배우
	private Date date;   // 영화 개봉일
	private String nation;  // 영화 제작 국가
	private String genre;  // 영화 장르
	private int time;   // 영화 러닝 시간
	private float score;  // 영화 평점
	private int view; // 영화 관객수
	private int like; // 영화 좋아요 숫자
	private int commentCnt; // 댓글 숫자
	private int ranking;// 순위
	private int total;
	private int sales;
	
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public String getCatchprise() {
		return catchprise;
	}
	public void setCatchprise(String catchprise) {
		this.catchprise = catchprise;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public String getEtitle() {
		return etitle;
	}
	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}
	
}


