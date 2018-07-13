package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.MarketDTO;
import team.swcome.donong.mapper.BlahMapper;

@Service
public class MarketService {
	
	@Autowired
	BlahMapper mapper;
	
	public List<MarketDTO> getMainList(){
		return mapper.selectAll();
	}
}
