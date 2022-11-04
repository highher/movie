package dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class EventDTO {
	private int id; // (이벤트아이디)
	private String category; // (이벤트 구분)
	private String name; // (이벤트명)
	private String image; // (이벤트 사진) 
	private String content; // (이벤트 설명)
	private LocalDateTime s_dt; // (이벤트 시작 기간)
	private LocalDateTime e_dt; // (이벤트 종료 기간)
	private Timestamp r_dt;
	private int winner; // (뽑는 인원수)
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getS_dt() {
		return s_dt;
	}
	public void setS_dt(LocalDateTime s_dt) {
		this.s_dt = s_dt;
	}
	public LocalDateTime getE_dt() {
		return e_dt;
	}
	public void setE_dt(LocalDateTime e_dt) {
		this.e_dt = e_dt;
	}
	public Timestamp getR_dt() {
		return r_dt;
	}
	public void setR_dt(Timestamp r_dt) {
		this.r_dt = r_dt;
	}
	public int getWinner() {
		return winner;
	}
	public void setWinner(int winner) {
		this.winner = winner;
	}

	
	
	
}