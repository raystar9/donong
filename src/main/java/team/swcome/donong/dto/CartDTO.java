package team.swcome.donong.dto;

public class CartDTO {
	private int num;
	private int goodsNum;
	private int memberNum;
	private int quantity;
	
	public CartDTO() {}
	public CartDTO(int goodsNum, int memberNum) {
		this.goodsNum = goodsNum;
		this.memberNum = memberNum;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
