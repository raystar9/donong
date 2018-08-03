package team.swcome.donong.mapper;

import java.util.List;

import team.swcome.donong.dto.ReplyDTO;

public interface ReplyMapper {

	//?Œ“ê¸?ëª©ë¡
	public List<ReplyDTO> listReply(int num);
	
	//?Œ“ê¸? ?…? ¥
	public void insertReply(ReplyDTO vo);
	
	public void update(ReplyDTO vo);
	
	public int delete(int rno);

	public ReplyDTO detail(int num);

	public int count(int num);

	public int getPageBegin();
}
