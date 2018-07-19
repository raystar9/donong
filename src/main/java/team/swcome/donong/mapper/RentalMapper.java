package team.swcome.donong.mapper;

import java.util.List;

import team.swcome.donong.dto.FileDTO;
import team.swcome.donong.dto.RentalDTO;

public interface RentalMapper {
	
	public List<RentalDTO> selectAll();

	public void insertfarm(RentalDTO r);
	
	public void insertFile(FileDTO f);
}
