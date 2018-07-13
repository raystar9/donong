package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.MainDTO;
import team.swcome.donong.mapper.MainMapper;

@Service
public class AccountService {
	
	@Autowired
	MainMapper mainMapper;
	
	public List<MainDTO> getMainList(){
		return mainMapper.selectAll();
	}
}
