package team.swcome.donong.mapper;

import java.util.List;

import team.swcome.donong.dto.ReplyDTO;

public interface ReplyMapper {

	//댓글목록
	public List<ReplyDTO> listReply(int num);
	
	//댓글 입력
	public void insertReply(ReplyDTO vo);
	
	public void update(ReplyDTO vo);
	
	public int delete(int rno);

	public ReplyDTO detail(int num);

	public int count(int num);

	public int getPageBegin();
}
