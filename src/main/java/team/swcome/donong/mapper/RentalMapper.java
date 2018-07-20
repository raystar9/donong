package team.swcome.donong.mapper;

import java.util.List;
import java.util.Map;

import team.swcome.donong.dto.FileDTO;
import team.swcome.donong.dto.MemberDTO;
import team.swcome.donong.dto.RentalDTO;

public interface RentalMapper {
	
	public List<RentalDTO> selectAll();

	public int insertFarm(RentalDTO r);
	
	public void insertFile(FileDTO f);
	
	public MemberDTO selectNameByPhone(int num);
	
}
