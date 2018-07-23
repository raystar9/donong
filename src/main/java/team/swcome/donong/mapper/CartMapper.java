package team.swcome.donong.mapper;

import team.swcome.donong.dto.CartDTO;

public interface CartMapper {
	public int insertCartItem(CartDTO cart);
	public int updateCartItem(CartDTO cart);
	public int deleteCartItemByNum(int num);
}
