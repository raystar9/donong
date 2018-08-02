package team.swcome.donong.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.CartDTO;
import team.swcome.donong.dto.CartGoodsDTO;
import team.swcome.donong.dto.GoodsDTO;
import team.swcome.donong.dto.GoodsOrdersDTO;
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
		int endItem = (page) * itemsPerPage ;
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
	
	public MarketPaginationDTO getPaginationInfo(int currentPage, String category) {
		MarketPaginationDTO pagination = new MarketPaginationDTO();
		
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
		int lastPage = ((mapper.selectItemCountByCategory(categoryNum)-1) / itemsPerPage) + 1;
		int startPage = currentPage - 2;
		int endPage = currentPage + 2;
		if(startPage < 1) {
			startPage = 1;
		}
		logger.debug("lastPage = {}", lastPage);
		logger.debug("endPage = {}", endPage);
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		pagination.setLast(lastPage);
		pagination.setCurrent(currentPage);
		pagination.setStart(startPage);
		pagination.setEnd(endPage);
		pagination.setCategory(category);
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
	
	public void insertOrder(OrdersDTO orders, List<CartGoodsDTO> goods) {
		ordersMapper.insertOrder(orders);
		logger.debug("num: {}",orders.getNum());
		for(CartGoodsDTO item : goods) {
			GoodsOrdersDTO toOrder = new GoodsOrdersDTO();
			toOrder.setOrderNum(orders.getNum());
			toOrder.setGoodsNum(item.getNum());
			toOrder.setQuantity(item.getQuantity());
			ordersMapper.insertOrderGoods(toOrder);
		}
	}

	public void insertOrder(OrdersDTO orders, int goodsNum, int quantity) {
		List<CartGoodsDTO> goods = new ArrayList<>();
		CartGoodsDTO item = new CartGoodsDTO();
		item.setNum(goodsNum);
		item.setQuantity(quantity);
		goods.add(item);
		insertOrder(orders, goods);
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
