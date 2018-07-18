package team.swcome.donong.dto;

import java.util.Date;

import javax.annotation.Resource;

@Resource
public class GoodsDTO {
	private int num;
	private String name;
	private int category;
	private String title;
	private Date regitdate;
	private String content;
	private String filePath;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegitdate() {
		return regitdate;
	}
	public void setRegitdate(Date regitdate) {
		this.regitdate = regitdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
}
