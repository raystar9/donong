package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dao.FarmDAO;
import team.swcome.donong.dto.FarmDTO;

@Service
public class FarmService {
	
	@Autowired
	FarmDAO accountDAO;
	
	public List<FarmDTO> getMainList(){
		return accountDAO.selectMainList();
	}
}
