package team.swcome.donong.dto;



import javax.annotation.Resource;


@Resource
public class RentalDTO {
	
	private int num;		//게시글 고유번호
	private int member_num;	//작성자 고유번호
	private String writer;	//게시글 작성자 이름
	private String title;	//게시글 제목
	private String address;	//소재지
	private int sido; 	//도
	private int sigungu;	//시
	private int area;		//면적
	private int price;		//임대료
	private String content;	//게시글 내용
	private float lat;		//위도
	private float lng;		//경도
	
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSido() {
		return sido;
	}
	public void setSido(int sido) {
		this.sido = sido;
	}
	public int getSigungu() {
		return sigungu;
	}
	public void setSigungu(int sigungu) {
		this.sigungu = sigungu;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
	}
	

}
