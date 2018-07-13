package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.CSBoardDTO;
import team.swcome.donong.mapper.ServiceMapper;

@Service
public class CustomerServiceService {
	
	@Autowired
	ServiceMapper serviceMapper;
	
	public List<CSBoardDTO> getMainList(){
		return serviceMapper.selectAll();
	}
}