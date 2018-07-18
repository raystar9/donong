package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.GoodsDTO;
import team.swcome.donong.dto.MarketPaginationDTO;
import team.swcome.donong.dto.MemberDTO;
import team.swcome.donong.mapper.GoodsMapper;
import team.swcome.donong.mapper.MemberMapper;

@Service
public class MarketService {
	
	@Autowired
	GoodsMapper mapper;
	@Autowired
	MemberMapper memberMapper;
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
		return mapper.selectCartByMemberNum(memberNum);
	}

	public MemberDTO getMemberDetails(int memberNum) {
		return memberMapper.selectMemberByNum(memberNum);
	}
}
