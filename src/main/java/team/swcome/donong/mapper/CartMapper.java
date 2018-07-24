package team.swcome.donong.mapper;

import java.util.List;

import team.swcome.donong.dto.CartDTO;
import team.swcome.donong.dto.CartGoodsDTO;

public interface CartMapper {
	public List<CartGoodsDTO> selectCartGoodsListByMemberNum(int num);
	public int insertCartItem(CartDTO cart);
	public int updateCartItem(CartDTO cart);
	public int updateCartQuantityByCartNum(int num, int quantity);
	public int deleteCartItemByNum(int num);
}
