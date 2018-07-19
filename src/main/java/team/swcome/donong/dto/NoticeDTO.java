package team.swcome.donong.dto;

import java.util.Date;

import javax.annotation.Resource;

@Resource
public class NoticeDTO {
	private int num;
	private String title;
	private String content;
	private Date regitdate;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public Date getRegitdate() {
		return regitdate;
	}
	public void setRegitdate(Date regitdate) {
		this.regitdate = regitdate;
	}
	
}
