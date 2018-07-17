package team.swcome.donong.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.BoardDTO;
import team.swcome.donong.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	public List<BoardDTO> getMainList(int page){
		List<BoardDTO> result = new ArrayList<>();
		BoardDTO b1 = new BoardDTO();
		return boardMapper.selectAll(page);
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
