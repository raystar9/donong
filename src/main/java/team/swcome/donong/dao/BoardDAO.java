package team.swcome.donong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.swcome.donong.dto.BoardDTO;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionFactory factory;
	
	public List<BoardDTO> selectMainList(){
		return factory.openSession().selectList("Board.selectAll");
	}
}
