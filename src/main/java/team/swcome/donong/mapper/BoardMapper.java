package team.swcome.donong.mapper;



import java.util.List;



import team.swcome.donong.dto.BoardDTO;

public interface BoardMapper {
	
	
	public List<BoardDTO> selectAll(int page);
	
	public int deleteBoard(int id);
	
	
	public int getListCount();
}
