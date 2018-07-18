package team.swcome.donong.mapper;

import java.util.List;

import team.swcome.donong.dto.GoodsDTO;
import team.swcome.donong.dto.MemberDTO;

public interface GoodsMapper {
	public List<GoodsDTO> selectItemsAtPage(int startItem, int endItem);

	public List<GoodsDTO> selectCartByMemberNum(int memberNum);

	public GoodsDTO selectItemByNum(int itemNum);

	public int selectItemCount();

	public MemberDTO selectMemberByMemberNum(int memberNum);
}
