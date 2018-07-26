package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.GoodsDTO;
import team.swcome.donong.dto.OrderGoodsDTO;
import team.swcome.donong.mapper.GoodsMapper;
import team.swcome.donong.mapper.OrdersMapper;

@Service
public class AdminService {
	
	@Autowired
	GoodsMapper goodsMapper;
	@Autowired
	OrdersMapper ordersMapper;
	
	public List<OrderGoodsDTO> getOrders(int page){
		List<OrderGoodsDTO> result = ordersMapper.selectWaitingOrders(0, 10);
		for(OrderGoodsDTO item : result) {
			List<GoodsDTO> goods = goodsMapper.selectItemsByOrderNum(item.getOrderNum());
			item.setGoods(goods);
			item.setPrice(getTotalPrice(goods));
			item.setOrderName(goods.get(0).getName() + " 외");
		}
		return result;
	}

	private int getTotalPrice(List<GoodsDTO> goods) {
		int result = 0;
		for(GoodsDTO item : goods) {
			result += item.getPrice()*item.getQuantity();
		}
		return result;
	}
}
