package team.swcome.donong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import team.swcome.donong.dto.MarketDTO;

@Repository
public class MarketDAO {
	
	@Autowired
	@Qualifier("sqlSession")
	SqlSession sqlSession;
	
	public List<MarketDTO> selectMarketList(){
		return sqlSession.selectList("Market.selectAll");
	}
}
