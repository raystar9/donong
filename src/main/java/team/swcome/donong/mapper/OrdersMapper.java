package team.swcome.donong.mapper;

import java.util.List;

import team.swcome.donong.dto.OrderItemsDTO;
import team.swcome.donong.dto.OrdersDTO;

public interface OrdersMapper {

	public List<OrdersDTO> selectAllOrdersByMemberNum(int memberNum);
	public List<OrdersDTO> selectCurrentOrdersByMemberNum(int memberNum);
	public List<OrderItemsDTO> selectWaitingOrders(int startItem, int endItem);
	public List<OrderItemsDTO> selectPreparingOrders(int startItem, int endItem);
	public List<OrderItemsDTO> selectSendingOrders(int startItem, int endItem);
	public List<OrderItemsDTO> selectArrivedOrders(int startItem, int enditem);
	public int insertOrder(OrdersDTO orders);
	public int updateOrder(OrdersDTO orders);
	public int updateStatusToPrep(List<OrdersDTO> orders);
	public int updateStatusAndWaybill(List<OrdersDTO> orders);
	public int deleteOrderByNum(int num);
}
