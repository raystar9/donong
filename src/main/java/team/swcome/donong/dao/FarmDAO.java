package team.swcome.donong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.swcome.donong.dto.FarmDTO;

@Repository
public class FarmDAO {
	
	@Autowired
	SqlSessionFactory factory;
	
	public List<FarmDTO> selectMainList(){
		return factory.openSession().selectList("Farm.selectAll");
	}
}
