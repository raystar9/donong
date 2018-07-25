package team.swcome.donong.mapper;

import java.util.List;
import java.util.Map;

import team.swcome.donong.dto.FileDTO;
import team.swcome.donong.dto.MemberDTO;
import team.swcome.donong.dto.RentalDTO;

public interface RentalMapper {
	
	public int insertFarm(RentalDTO r);
	
	public void insertFile(FileDTO f);
	
	public MemberDTO selectNameByPhone(int num);
	
	public RentalDTO selectSidoSigunguNum(Map<String,String> map);
	
	public List<RentalDTO> selectRentalList();
	
	public String[] selectRepresentImg();
	
	public RentalDTO selectRentalView(int board_num);
	
	public FileDTO selectFilePath(int board_num);
	
}