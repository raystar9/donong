package team.swcome.donong.service;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.GoodsDTO;
import team.swcome.donong.dto.OrderItemsDTO;
import team.swcome.donong.dto.OrdersDTO;
import team.swcome.donong.mapper.GoodsMapper;
import team.swcome.donong.mapper.OrdersMapper;

@Service
public class AdminService {

	private static final Logger logger = LoggerFactory.getLogger(AdminService.class);
	
	@Autowired
	GoodsMapper goodsMapper;
	@Autowired
	OrdersMapper ordersMapper;

	private static final String WAITING = "waiting";
	private static final String PREPARING = "preparing";
	private static final String SENDING = "sending";
	private static final String ARRIVED = "arrived";

	public List<OrderItemsDTO> getWaitingOrders(int page) {
		return getOrders(page, "waiting");
	}

	public List<OrderItemsDTO> getPreparingOrders(int page) {
		return getOrders(page, "preparing");
	}
	
	public List<OrderItemsDTO> getSendingOrders(int page) {
		return getOrders(page, "sending");
	}
	
	public List<OrderItemsDTO> getArrivedOrders(int page) {
		return getOrders(page, "arrived");
	}

	public List<OrderItemsDTO> getOrders(int page, String type) {
		List<OrderItemsDTO> result;
		switch (type) {
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
		for (int num : nums) {
			OrdersDTO orders = new OrdersDTO();
			orders.setStatus("prep");
			orders.setNum(num);
			list.add(orders);
		}
		ordersMapper.updateStatusToPrep(list);
	}

	public void setStatusAsSending(int[] nums, int[] waybills) {
		for (int i = 0; i < nums.length; i++) {
			OrdersDTO orders = new OrdersDTO();
			orders.setStatus("send");
			orders.setNum(nums[i]);
			orders.setWaybill(waybills[i]);
			ordersMapper.updateStatusToSend(orders);
		}
	}

	public void setStatusAsArrived(int[] nums) {
		List<OrdersDTO> list = new ArrayList<>();
		for (int num : nums) {
			OrdersDTO orders = new OrdersDTO();
			orders.setStatus("arrv");
			orders.setNum(num);
			list.add(orders);
		}
		ordersMapper.updateStatusToArrv(list);
	}

	private void setOrderItems(List<OrderItemsDTO> orders) {
		for (OrderItemsDTO item : orders) {
			List<GoodsDTO> goods = goodsMapper.selectItemsByOrderNum(item.getOrderNum());
			item.setGoods(goods);
			item.setPrice(getTotalPrice(goods));
			switch (goods.size()) {
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
		for (GoodsDTO item : goods) {
			result += item.getPrice() * item.getQuantity();
		}
		return result;
	}

	//TODO 람다식으로 교쳬, 로직 수정할 부분 많음
	public int[] getOrderNumList(String queryString) throws Exception {
		List<String> paramValues = getParamValues(queryString, "pay-check");
		return parseArrayListToArray(paramValues);
	}

	public int[] getWaybillList(String queryString, int[] nums) throws Exception {
		return parseArrayListToArray(getParamValues(queryString, "waybill"));
	}

	private List<String> getParamValues(String queryString, String key) throws Exception {
		String[] paramList = URLDecoder.decode(queryString, "utf-8").split("&");
		List<String> paramValues = new ArrayList<>();
		for (int i = 0; i < paramList.length; i++) {
			String paramKey = paramList[i].split("=")[0];
			String paramValue;
			try {
				paramValue = paramList[i].split("=")[1];
			} catch (Exception e) {
				paramValue = "";
			}
			//TODO paramKey.contains가 얘기치못한 결과를 낳을 수 있음. 수정요망
			if (paramKey.contains(key)) {
				paramValues.add(paramValue);
			}
		}
		return paramValues;
	}
	
	private int[] parseArrayListToArray(List<String> list) {
		int[] numList = new int[list.size()];
		for (int i = 0; i < numList.length; i++) {
			numList[i] = Integer.parseInt(list.get(i));
		}
		return numList;
	}

	
}
