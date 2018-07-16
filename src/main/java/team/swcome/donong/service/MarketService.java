package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.MarketDTO;
import team.swcome.donong.dto.MarketPaginationDTO;
import team.swcome.donong.mapper.BlahMapper;

@Service
public class MarketService {
	
	@Autowired
	BlahMapper mapper;
	
	public List<MarketDTO> getMainList(){
		return mapper.selectAll();
	}
	
	public MarketPaginationDTO getPaginationInfo(int currentPage) {
		MarketPaginationDTO pagination = new MarketPaginationDTO();
		int lastPage = 10;
		
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
}
