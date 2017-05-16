package comments.model;

import java.util.ArrayList;

public class News {
	private int news_id;
	private String writer;
	private String title;
	private String content;
	private String regdate;
	private int hit;
	//private List<Comments> comments;
	private ArrayList<Comments> list;
		
	//hybonate로 이작업을 자동화할 수 있다.
	
	public ArrayList<Comments> getList() {
		return list;
	}
	public void setList(ArrayList<Comments> list) {
		this.list = list;
	}
	
	public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
}
