package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.RentalDTO;
import team.swcome.donong.mapper.RentalMapper;

@Service
public class RentalService {
	
	@Autowired
	RentalMapper RentalMapper;
	
	public List<RentalDTO> getMainList(){
		return RentalMapper.selectAll();
	}
}
