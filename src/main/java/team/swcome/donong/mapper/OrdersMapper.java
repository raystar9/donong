package team.swcome.donong.mapper;

import java.util.List;

import team.swcome.donong.dto.OrdersDTO;

public interface OrdersMapper {

	public List<OrdersDTO> selectAllOrdersByMemberNum(int memberNum);
	public List<OrdersDTO> selectCurrentOrdersByMemberNum(int memberNum);
	public int insertOrder(OrdersDTO orders);
	public int updateOrder(OrdersDTO orders);
	public int deleteOrderByNum(int num);
}
