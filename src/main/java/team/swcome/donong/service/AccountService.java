package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dao.AccountDAO;
import team.swcome.donong.dto.MainDTO;

@Service
public class AccountService {
	
	@Autowired
	AccountDAO accountDAO;
	
	public List<MainDTO> getMainList(){
		return accountDAO.selectMainList();
	}
}
