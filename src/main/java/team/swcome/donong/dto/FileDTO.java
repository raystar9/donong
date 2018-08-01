package team.swcome.donong.dto;

import javax.annotation.Resource;

import org.springframework.web.multipart.MultipartFile;

@Resource
public class FileDTO {
	
	private int board_num;			//Í≤åÏãúÍ∏? Î≤àÌò∏
	
	private MultipartFile file1;	//?åå?ùº1 (???ëú?ù¥ÎØ∏Ï?)
	private MultipartFile file2;	//?åå?ùº2 
	private MultipartFile file3;	//?åå?ùº3 
	private MultipartFile file4;	//?åå?ùº4 
	
	private String fileName1;		//?åå?ùº ?ò§Î¶¨Ï??Ñê ?ù¥Î¶? (a.jpg)
	private String fileName2;
	private String fileName3;
	private String fileName4;
	
	private String filePath1;		//?åå?ùº Í≤ΩÎ°ú 
	private String filePath2;
	private String filePath3;
	private String filePath4;
	
	
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public MultipartFile getFile3() {
		return file3;
	}
	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}
	public MultipartFile getFile4() {
		return file4;
	}
	public void setFile4(MultipartFile file4) {
		this.file4 = file4;
	}
	public String getFileName1() {
		return fileName1;
	}
	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}
	public String getFileName2() {
		return fileName2;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	public String getFileName3() {
		return fileName3;
	}
	public void setFileName3(String fileName3) {
		this.fileName3 = fileName3;
	}
	public String getFileName4() {
		return fileName4;
	}
	public void setFileName4(String fileName4) {
		this.fileName4 = fileName4;
	}
	public String getFilePath1() {
		return filePath1;
	}
	public void setFilePath1(String filePath1) {
		this.filePath1 = filePath1;
	}
	public String getFilePath2() {
		return filePath2;
	}
	public void setFilePath2(String filePath2) {
		this.filePath2 = filePath2;
	}
	public String getFilePath3() {
		return filePath3;
	}
	public void setFilePath3(String filePath3) {
		this.filePath3 = filePath3;
	}
	public String getFilePath4() {
		return filePath4;
	}
	public void setFilePath4(String filePath4) {
		this.filePath4 = filePath4;
	}
	
	

}
