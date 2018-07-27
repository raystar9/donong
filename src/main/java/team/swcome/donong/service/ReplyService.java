package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.ReplyDTO;
import team.swcome.donong.mapper.ReplyMapper;

@Service
public class ReplyService {

	@Autowired
	ReplyMapper replyMapper;
	
	public List<ReplyDTO> list(int num) {
		// TODO Auto-generated method stub
		return replyMapper.listReply(num);
	}

	public void insert(ReplyDTO vo) {
		replyMapper.insertReply(vo);
	}

	public void update(ReplyDTO vo) {
		// TODO Auto-generated method stub
	}

	public void delete(int rno) {
		// TODO Auto-generated method stub
		
	}

}
