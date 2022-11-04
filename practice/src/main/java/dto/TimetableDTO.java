package dto;

import java.sql.Timestamp;
import java.util.Date;

public class TimetableDTO {

	private int id;
	private String s_time;
	private String e_time;
	private String img;
	private String title;
	private String grade;
	private Date date;
	private String theater;
	private String screen;
	private String type;
	private int price;
	private int totoalseat;
	private int leftseat;
	private int amount;
	private Timestamp o_date;
	
	
	public Timestamp getO_date() {
		return o_date;
	}
	public void setO_date(Timestamp o_date) {
		this.o_date = o_date;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getLeftseat() {
		return leftseat;
	}
	public void setLeftseat(int leftseat) {
		this.leftseat = leftseat;
	}
	public int getTotoalseat() {
		return totoalseat;
	}
	public void setTotoalseat(int totoalseat) {
		this.totoalseat = totoalseat;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getS_time() {
		return s_time;
	}
	public void setS_time(String s_time) {
		this.s_time = s_time;
	}
	public String getE_time() {
		return e_time;
	}
	public void setE_time(String e_time) {
		this.e_time = e_time;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTheater() {
		return theater;
	}
	public void setTheater(String theater) {
		this.theater = theater;
	}
	public String getScreen() {
		return screen;
	}
	public void setScreen(String screen) {
		this.screen = screen;
	}
	
}
