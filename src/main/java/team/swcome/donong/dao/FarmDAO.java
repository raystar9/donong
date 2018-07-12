package team.swcome.donong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import team.swcome.donong.dto.FarmDTO;

@Repository
public class FarmDAO {
	
	@Autowired
	@Qualifier("sqlSession")
	SqlSession session;
	
	public List<FarmDTO> selectMainList(){
		return session.selectList("Farm.selectAll");
	}
}
