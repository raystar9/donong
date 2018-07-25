package team.swcome.donong.dto;

import java.util.Date;

import javax.annotation.Resource;

@Resource
public class GoodsDTO {
	int num;
	String name;
	int price;
	int category;
	String title;
	Date regitdate;
	String content;
	String filePath;
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
