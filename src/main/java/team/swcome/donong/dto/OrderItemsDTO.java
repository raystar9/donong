package team.swcome.donong.dto;

import java.sql.Date;
import java.util.List;

public class OrderItemsDTO {
	private int orderNum;
	private int goodsNum;
	private String ordererName;
	private String receiverName;
	private String orderName;
	private int price;
	private Date orderDate;
	private String status;
	private List<GoodsDTO> goods;
	private String address;
	private String comments;
	private int waybill;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getOrdererName() {
		return ordererName;
	}
	public void setOrdererName(String ordererName) {
		this.ordererName = ordererName;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public List<GoodsDTO> getGoods() {
		return goods;
	}
	public void setGoods(List<GoodsDTO> goods) {
		this.goods = goods;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getComments() {
		return comments;
	}
	public void setComment(String comment) {
		this.comments = comment;
	}
	public int getWaybill() {
		return waybill;
	}
	public void setWaybill(int waybill) {
		this.waybill = waybill;
	}
	
}
