package team.swcome.donong.mapper;

import java.util.List;

import team.swcome.donong.dto.OrderGoodsDTO;
import team.swcome.donong.dto.OrdersDTO;

public interface OrdersMapper {

	public List<OrdersDTO> selectAllOrdersByMemberNum(int memberNum);
	public List<OrdersDTO> selectCurrentOrdersByMemberNum(int memberNum);
	public List<OrderGoodsDTO> selectWaitingOrders(int startItem, int endItem);
	public List<OrderGoodsDTO> selectPreparingOrders(int startItem, int endItem);
	public List<OrderGoodsDTO> selectSendingOrders(int startItem, int endItem);
	public List<OrderGoodsDTO> selectArrivedOrders(int startItem, int enditem);
	public int insertOrder(OrdersDTO orders);
	public int updateOrder(OrdersDTO orders);
	public int deleteOrderByNum(int num);
}
