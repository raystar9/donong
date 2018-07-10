package team.swcome.donong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.swcome.donong.dto.CSBoardDTO;

@Repository
public class CustomerServiceDAO {
	
	@Autowired
	SqlSessionFactory factory;
	
	public List<CSBoardDTO> selectMainList(){
		return factory.openSession().selectList("CSBoard.selectAll");
	}
}
