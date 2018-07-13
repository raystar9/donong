package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.FarmDTO;
import team.swcome.donong.mapper.FarmMapper;

@Service
public class FarmService {
	
	@Autowired
	FarmMapper farmMapper;
	
	public List<FarmDTO> getMainList(){
		return farmMapper.selectAll();
	}
}
