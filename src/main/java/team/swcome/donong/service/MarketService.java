package team.swcome.donong.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.CartDTO;
import team.swcome.donong.dto.CartGoodsDTO;
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
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	/*
	 * Goods관련 메서드
	 */
	final int itemsPerPage = 10;
	
	public List<GoodsDTO> getGoodsList(int page, String category){
		int startItem = (page-1) * itemsPerPage;
		int endItem = (page-1) * itemsPerPage + 9;
		int categoryNum;
		switch(category) {
		case "seed":
			categoryNum = 1;
			break;
		case "fertilizer":
			categoryNum = 2;
			break;
		case "tools":
		default:
			categoryNum = 3;
			break;
		}
		logger.debug("category : {}", categoryNum);
		return mapper.selectItemsAtPage(startItem, endItem, categoryNum);
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
	
	public List<CartGoodsDTO> getCartItems(int memberNum) {
		return cartMapper.selectCartGoodsListByMemberNum(memberNum);
	}

	public MemberDTO getMemberDetails(int memberNum) {
		return memberMapper.selectMemberByNum(memberNum);
	}

	public int getTotalPrice(List<CartGoodsDTO> items) {
		int totalPrice = 0;
		for(CartGoodsDTO item : items) {
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
	
	public int updateCartQuantity(int num, int quantity) {
		return cartMapper.updateCartQuantityByCartNum(num, quantity);
	}
	
	public int deleteCartItem(int num) {
		return cartMapper.deleteCartItemByNum(num);
	}
}
