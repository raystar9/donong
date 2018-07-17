package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.BoardDTO;
import team.swcome.donong.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	public List<BoardDTO> getMainList(int page,Integer limit){
		return boardMapper.selectAll(page,limit);
	}
	public void deleteBoard(int id) {
		int result = boardMapper.deleteBoard(id);
		if(result == 1) {
			
		} else {
			
		}
	}
	public int getListCount() {
		// TODO Auto-generated method stub
		return boardMapper.getListCount();
	}
}
