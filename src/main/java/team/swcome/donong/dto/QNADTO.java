package team.swcome.donong.dto;

import javax.annotation.Resource;

@Resource
public class QNADTO {
	private int num;
	private int category;
	private int writer;
	private String title;
	private String content;
	private String regitdate;
	private String answer;
	private String ansdate;
	private String state;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
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
	public String getRegitdate() {
		return regitdate;
	}
	public void setRegitdate(String regitdate) {
		this.regitdate = regitdate;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnsdate() {
		return ansdate;
	}
	public void setAnsdate(String ansdate) {
		this.ansdate = ansdate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
