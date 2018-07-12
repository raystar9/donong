package team.swcome.donong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.swcome.donong.dto.MainDTO;

@Repository
public class AccountDAO {
	
	@Autowired
	SqlSessionFactory factory;
	
	public List<MainDTO> selectMainList(){
		return factory.openSession().selectList("Main.selectAll");
	}
}
