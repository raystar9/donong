package team.swcome.donong.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.ReplyDTO;
import team.swcome.donong.mapper.ReplyMapper;

@Service
public class ReplyService {

	@Autowired
	ReplyMapper replyMapper;
	
	public List<ReplyDTO> list(int num, int start, int end, HttpSession session) {
		// TODO Auto-generated method stub
		return replyMapper.listReply(num);
	}

	public void insert(ReplyDTO vo) {
		replyMapper.insertReply(vo);
	}

	public void update(ReplyDTO vo) {
		replyMapper.update(vo);
	}

	public void delete(int rno) {
		replyMapper.delete(rno);
		
	}

	public ReplyDTO detail(int num) {
		// TODO Auto-generated method stub
		return replyMapper.detail(num);
	}

	public int count(int num) {
		// TODO Auto-generated method stub
		return replyMapper.count(num);
	}

}
