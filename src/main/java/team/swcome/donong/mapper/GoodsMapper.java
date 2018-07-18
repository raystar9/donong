package team.swcome.donong.mapper;

import java.util.List;

import team.swcome.donong.dto.GoodsDTO;

public interface GoodsMapper {
	public List<GoodsDTO> selectAll(int page);

	public List<GoodsDTO> selectCartByMemberNum(int memberNum);
}
