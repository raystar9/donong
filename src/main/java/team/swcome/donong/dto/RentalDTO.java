package team.swcome.donong.dto;



import javax.annotation.Resource;


@Resource
public class RentalDTO {
	
	private int num;		//ê²Œì‹œê¸? ê³ ìœ ë²ˆí˜¸
	private int member_num;	//?‘?„±? ê³ ìœ ë²ˆí˜¸
	private String writer;	//ê²Œì‹œê¸? ?‘?„±? ?´ë¦?
	private String title;	//ê²Œì‹œê¸? ? œëª?
	private String address;	//?†Œ?¬ì§?
	private int sido; 		//?„
	private int sigungu;	//?‹œ
	private int area;		//ë©´ì 
	private int price;		//?„??ë£?
	private String content;	//ê²Œì‹œê¸? ?‚´?š©
	private float lat;		//?œ„?„
	private float lng;		//ê²½ë„
	private String path;	//???‘œ?´ë¯¸ì? ê²½ë¡œ

	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
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
