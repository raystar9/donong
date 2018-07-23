package team.swcome.donong.mapper;

import java.util.List;

import team.swcome.donong.dto.GoodsDTO;

public interface GoodsMapper {
	public List<GoodsDTO> selectItemsAtPage(int startItem, int endItem);

	public List<GoodsDTO> selectCartItemsByMemberNum(int memberNum);

	public GoodsDTO selectItemByNum(int itemNum);

	public int selectItemCount();
	
	public int insertGoods(GoodsDTO goods);
	
	public int updateGoods(GoodsDTO goods);
	
	public int deleteGoodsByNum(int num);
}
