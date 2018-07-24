package team.swcome.donong.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.BoardDTO;
import team.swcome.donong.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	public List<BoardDTO> getMainList(int page,int limit){
		List<BoardDTO> result = new ArrayList<>();
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("page", page);
		hm.put("limit",limit);
		result=boardMapper.selectAll(hm);
		return result;
	}
	public List<BoardDTO> getAskList(int page,int limit){
		List<BoardDTO> result = new ArrayList<>();
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("page", page);
		hm.put("limit",limit);
		result=boardMapper.selectAsk(hm);
		return result;
	}
	public List<BoardDTO> getTalkList(int page,int limit){
		List<BoardDTO> result = new ArrayList<>();
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("page", page);
		hm.put("limit",limit);
		result=boardMapper.selectTalk(hm);
		return result;
	}public List<BoardDTO> getInfoList(int page,int limit){
		List<BoardDTO> result = new ArrayList<>();
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("page", page);
		hm.put("limit",limit);
		result=boardMapper.selectInfo(hm);
		return result;
	}
	public List<BoardDTO> getCircleList(int page,int limit){
		List<BoardDTO> result = new ArrayList<>();
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("page", page);
		hm.put("limit",limit);
		result=boardMapper.selectCircle(hm);
		return result;
	}
	
	public void deleteBoard(int id) {
		int result = boardMapper.deleteBoard(id);
		if(result == 1) {
			
		} else {
			
		}
	}
	
	public int getListCount() {
		// TODO Auto-generated method stub
		return boardMapper.getListCount();
	}
	public int getListCountByCategory(String category) {
		// TODO Auto-generated method stub
		return boardMapper.getListCountByCategory(category);
	}
	public void insertBbs(BoardDTO boardDTO) {
		boardMapper.insertBbs(boardDTO);
		
	}
	public BoardDTO getContent(int bbs_num) {
		return boardMapper.selectCommunityByNum(bbs_num);
	}
	public void bbsHit(int bbs_num) {
		boardMapper.bbs_hit(bbs_num);
		
	}
	public void editBbs(BoardDTO bbsbean) {
		boardMapper.bbs_edit(bbsbean);
		
	}
	public void deleteBbs(int num) {
		boardMapper.deleteBoard(num);
		
	}
	public void refEdit(BoardDTO bbsbean) {
		boardMapper.refEdit(bbsbean);

	}
	public void bbsReplyOk(BoardDTO bbsbean) {
		boardMapper.bbsReplyOk(bbsbean);

	}
	public int getListCount3(Map<String, String> m) {
		return boardMapper.getListCount3(m);
	}
	public List<BoardDTO> getBbsList3(Map<String, String> m) {
		List<BoardDTO> list =new ArrayList<BoardDTO>();
		list=boardMapper.bbs_find(m); 
		return list;
	}
}
