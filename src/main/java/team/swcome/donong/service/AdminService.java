package team.swcome.donong.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.GoodsDTO;
import team.swcome.donong.dto.OrderItemsDTO;
import team.swcome.donong.dto.OrdersDTO;
import team.swcome.donong.mapper.GoodsMapper;
import team.swcome.donong.mapper.OrdersMapper;

@Service
public class AdminService {
	
	@Autowired
	GoodsMapper goodsMapper;
	@Autowired
	OrdersMapper ordersMapper;
	
	private static final String WAITING = "waiting";
	private static final String PREPARING = "preparing";
	private static final String SENDING = "sending";
	private static final String ARRIVED = "arrived";
	
	public List<OrderItemsDTO> getWaitingItems(int page) {
		return getOrders(page, "waiting");
	}
	
	public Object getPreparingItems(int page) {
		return getOrders(page, "preparing");
	}
	
	public List<OrderItemsDTO> getOrders(int page, String type){
		List<OrderItemsDTO> result;
		switch(type) {
		case PREPARING:
			result = ordersMapper.selectPreparingOrders(0, 10);
			break;
		case SENDING:
			result = ordersMapper.selectSendingOrders(0, 10);
			break;
		case ARRIVED:
			result = ordersMapper.selectArrivedOrders(0, 10);
			break;
		case WAITING:
		default:
			result = ordersMapper.selectWaitingOrders(0, 10);
		}
		setOrderItems(result);
		
		return result;
	}

	public void setStatusAsPreparing(int[] nums) {
		List<OrdersDTO> list = new ArrayList<>();
		for(int num : nums) {
			OrdersDTO orders = new OrdersDTO();
			orders.setStatus("prep");
			orders.setNum(num);
			list.add(orders);
		}
		ordersMapper.updateStatusToPrep(list);
	}
	/*public void setStatusAsSending(int[] nums, int[] waybills) {			
		List<OrdersDTO> list = new ArrayList<>();
		for(int i = 0; i < nums.length; i++) {
			OrdersDTO orders = new OrdersDTO();
			orders.setStatus("send");
			orders.setNum(nums[i]);
			orders.setWaybill(waybills[i]);
			list.add(orders);
		}
		ordersMapper.updateStatus(list);
	}
	public void setStatusAsArrived(int[] nums) {
		List<OrdersDTO> list = new ArrayList<>();
		for(int num : nums) {
			OrdersDTO orders = new OrdersDTO();
			orders.setStatus("arrv");
			orders.setNum(num);
			list.add(orders);
		}
		ordersMapper.updateStatus(list);	
	}*/
	
	private void setOrderItems(List<OrderItemsDTO> orders) {
		for(OrderItemsDTO item : orders) {
			List<GoodsDTO> goods = goodsMapper.selectItemsByOrderNum(item.getOrderNum());
			item.setGoods(goods);
			item.setPrice(getTotalPrice(goods));
			switch(goods.size()) {
			case 1:
				item.setOrderName(goods.get(0).getName());
				break;
			case 0:
				item.setOrderName("오류");
				break;
			default:
				item.setOrderName(goods.get(0).getName() + " 외");
			}
		}
	}
	private int getTotalPrice(List<GoodsDTO> goods) {
		int result = 0;
		for(GoodsDTO item : goods) {
			result += item.getPrice()*item.getQuantity();
		}
		return result;
	}
}
