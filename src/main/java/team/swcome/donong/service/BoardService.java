package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dao.BoardDAO;
import team.swcome.donong.dto.BoardDTO;

@Service
public class BoardService {
	
	@Autowired
	BoardDAO accountDAO;
	
	public List<BoardDTO> getMainList(){
		return accountDAO.selectMainList();
	}
}
