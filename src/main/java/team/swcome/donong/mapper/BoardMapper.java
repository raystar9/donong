package team.swcome.donong.mapper;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import team.swcome.donong.dto.BoardDTO;

public interface BoardMapper {
	
	public int getListCount();
	public List<BoardDTO> selectAll(HashMap<String, Integer> hm);
	
	public void insertBbs(BoardDTO b);
	public BoardDTO getBbsCont(int num);
	public void bbs_hit(int num);
	public void bbs_edit(BoardDTO b);
	public void getListCount3(Map m);
	public void bbs_level(BoardDTO b);
	public void bbs_reply(BoardDTO b);
	
	public void refEdit(BoardDTO b);
	public void bbsReplyOk(BoardDTO b);
	
	
	public int deleteBoard(int num);
	
	public Integer bbsfind_cnt(String string, Map m);
	public List<BoardDTO> bbs_find(String string, Map m);
	public BoardDTO selectCommunityByNum(int num);
	public List<BoardDTO> selectAsk(HashMap<String, Integer> hm);
	public List<BoardDTO> selectTalk(HashMap<String, Integer> hm);
	public List<BoardDTO> selectInfo(HashMap<String, Integer> hm);
	public List<BoardDTO> selectCircle(HashMap<String, Integer> hm);

	
	
	
}
