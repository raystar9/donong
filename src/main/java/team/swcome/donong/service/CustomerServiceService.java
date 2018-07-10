package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dao.CustomerServiceDAO;
import team.swcome.donong.dto.CSBoardDTO;

@Service
public class CustomerServiceService {
	
	@Autowired
	CustomerServiceDAO accountDAO;
	
	public List<CSBoardDTO> getMainList(){
		return accountDAO.selectMainList();
	}
}
