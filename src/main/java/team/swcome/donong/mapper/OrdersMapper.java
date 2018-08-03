package team.swcome.donong.mapper;

import java.util.List;
import java.util.Map;

import team.swcome.donong.dto.GoodsOrdersDTO;
import team.swcome.donong.dto.OrderItemsDTO;
import team.swcome.donong.dto.OrdersDTO;

public interface OrdersMapper {

	public List<OrdersDTO> selectAllOrdersByMemberNum(int memberNum);
	public List<OrdersDTO> selectPagingOrders(Map m);
	public List<OrdersDTO> selectCurrentOrdersByMemberNum(int memberNum);
	public List<OrderItemsDTO> selectWaitingOrders(int startItem, int endItem);
	public List<OrderItemsDTO> selectPreparingOrders(int startItem, int endItem);
	public List<OrderItemsDTO> selectSendingOrders(int startItem, int endItem);
	public List<OrderItemsDTO> selectArrivedOrders(int startItem, int enditem);
	public int insertOrder(OrdersDTO orders);
	public int insertOrderGoods(GoodsOrdersDTO order);
	public int updateOrder(OrdersDTO orders);
	public int updateStatusToPrep(List<OrdersDTO> orders);
	public int updateStatusToSend(OrdersDTO order);
	public int updateStatusToArrv(List<OrdersDTO> orders);
	public int updateStatusAndWaybill(List<OrdersDTO> orders);
	public int deleteOrderByNum(int num);
	public int getOrderListCount();
}
