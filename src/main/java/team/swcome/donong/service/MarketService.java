package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.CartDTO;
import team.swcome.donong.dto.GoodsDTO;
import team.swcome.donong.dto.MarketPaginationDTO;
import team.swcome.donong.dto.MemberDTO;
import team.swcome.donong.dto.OrdersDTO;
import team.swcome.donong.mapper.CartMapper;
import team.swcome.donong.mapper.GoodsMapper;
import team.swcome.donong.mapper.MemberMapper;
import team.swcome.donong.mapper.OrdersMapper;

@Service
public class MarketService {
	
	@Autowired
	GoodsMapper mapper;
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	OrdersMapper ordersMapper;
	@Autowired
	CartMapper cartMapper;
	
	/*
	 * Goods관련 메서드
	 */
	final int itemsPerPage = 10;
	
	public List<GoodsDTO> getMainList(int page){
		int startItem = (page-1) * itemsPerPage;
		int endItem = (page-1) * itemsPerPage + 9;
		return mapper.selectItemsAtPage(startItem, endItem);
	}
	
	public MarketPaginationDTO getPaginationInfo(int currentPage) {
		MarketPaginationDTO pagination = new MarketPaginationDTO();
		int lastPage = (mapper.selectItemCount() / itemsPerPage) + 1;
		
		int startPage = currentPage - 2;
		int endPage = currentPage + 2;
		if(startPage < 1) {
			startPage = 1;
		}
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		pagination.setLast(lastPage);
		pagination.setCurrent(currentPage);
		pagination.setStart(startPage);
		pagination.setEnd(endPage);
		
		return pagination; 
	}

	public GoodsDTO getItemByItemNum(int itemNum) {
		return mapper.selectItemByNum(itemNum);
	}
	
	public List<GoodsDTO> getCartItems(int memberNum) {
		return mapper.selectCartItemsByMemberNum(memberNum);
	}

	public MemberDTO getMemberDetails(int memberNum) {
		return memberMapper.selectMemberByNum(memberNum);
	}

	public int getTotalPrice(List<GoodsDTO> items) {
		int totalPrice = 0;
		for(GoodsDTO item : items) {
			totalPrice += item.getPrice() * item.getQuantity();
		}
		return totalPrice;
	}
	
	public void insertMember(MemberDTO member) {
		
	}
	
	/*
	 * Order관련 메서드
	 */
	public List<OrdersDTO> getOrderListByMemberNum(int memberNum) {
		return ordersMapper.selectAllOrdersByMemberNum(memberNum);
	}
	
	public void insertOrder(OrdersDTO orders) {
		ordersMapper.insertOrder(orders);
	}
	
	public void updateOrder(OrdersDTO orders) {
		ordersMapper.updateOrder(orders);
	}
	
	public void deleteOrder(int num) {
		ordersMapper.deleteOrderByNum(num);
	}
	
	/*
	 * Cart관련 메서드
	 */
	public void insertCartItem(CartDTO cart) {
		cartMapper.insertCartItem(cart);
	}
	
	public void updateCartItem(CartDTO cart) {
		cartMapper.updateCartItem(cart);
	}
	
	public void deleteCartItem(int num) {
		cartMapper.deleteCartItemByNum(num);
	}
}
