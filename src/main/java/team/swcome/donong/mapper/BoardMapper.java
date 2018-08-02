package team.swcome.donong.mapper;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import team.swcome.donong.dto.BoardDTO;

public interface BoardMapper {
	
	public int getListCount();
	public int getListCountByCategory(String category);
	public List<BoardDTO> selectAll(HashMap<String, Integer> hm);
	
	public void insertBbs(BoardDTO b);
	public BoardDTO getBbsCont(int num);
	public void bbs_hit(int num);
	public void bbs_edit(BoardDTO b);
	public int getListCount3(Map<String, String> m);
	public void bbs_level(BoardDTO b);
	public void bbs_reply(BoardDTO b);
	
	public void refEdit(BoardDTO b);
	public void bbsReplyOk(BoardDTO b);
	
	
	public int deleteBoard(int num);
	
	public BoardDTO selectCommunityByNum(int num);
	public List<BoardDTO> selectAsk(HashMap<String, Integer> hm);
	public List<BoardDTO> selectTalk(HashMap<String, Integer> hm);
	public List<BoardDTO> selectInfo(HashMap<String, Integer> hm);
	public List<BoardDTO> selectCircle(HashMap<String, Integer> hm);
	
	public List<BoardDTO> bbs_find(Map<String, String> m);
	public void deleteAllReply(int num);
	public void deleteFile(int num);

	
	
	
}
