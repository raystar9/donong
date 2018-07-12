package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dao.MarketDAO;
import team.swcome.donong.dto.MarketDTO;

@Service
public class MarketService {
	
	@Autowired
	MarketDAO accountDAO;
	
	public List<MarketDTO> getMainList(){
		return accountDAO.selectMarketList();
	}
}
