package team.swcome.donong.mapper;

import java.util.List;

import team.swcome.donong.dto.GoodsDTO;

public interface GoodsMapper {
	public List<GoodsDTO> selectItemsAtPage(int startItem, int endItem, int category);

	public GoodsDTO selectItemByNum(int itemNum);
	
	public List<GoodsDTO> selectItemsByOrderNum(int orderNum);

	public int selectItemCount();
	
	public int insertGoods(GoodsDTO goods);
	
	public int updateGoods(GoodsDTO goods);
	
	public int deleteGoodsByNum(int num);
}
