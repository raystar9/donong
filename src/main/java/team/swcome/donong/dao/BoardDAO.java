package team.swcome.donong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import team.swcome.donong.dto.BoardDTO;

@Repository
public class BoardDAO {
	
	@Autowired
	@Qualifier("sqlSession")
	SqlSession session;
	
	public List<BoardDTO> selectMainList(){
		return session.selectList("Board.selectAll");
	}
}
