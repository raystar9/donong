package team.swcome.donong.mapper;

import java.util.List;

import team.swcome.donong.dto.MainDTO;
import team.swcome.donong.dto.MemberDTO;

public interface MainMapper {
	public List<MainDTO> selectAll();
	
	public void insertMember(MemberDTO m);
	
}
