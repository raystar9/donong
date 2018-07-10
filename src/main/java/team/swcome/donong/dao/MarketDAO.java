package team.swcome.donong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.swcome.donong.dto.MarketDTO;

@Repository
public class MarketDAO {
	
	@Autowired
	SqlSessionFactory factory;
	
	public List<MarketDTO> selectMarketList(){
		return factory.openSession().selectList("Market.selectAll");
	}
}
