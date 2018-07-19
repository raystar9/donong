package team.swcome.donong.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.BoardDTO;
import team.swcome.donong.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	public List<BoardDTO> getMainList(int page){
		List<BoardDTO> result = new ArrayList<>();
		BoardDTO b1 = new BoardDTO();
		b1.setSubject("예제입니다.");
		b1.setWriter("유승열");
		b1.setCategory("질문");
		b1.setNum(1);
		b1.setRe_lev(0);
		b1.setRe_seq(0);
		b1.setReadcount(5);
		Date date = new Date();
		b1.setRegitdate(date);
		BoardDTO b2 = new BoardDTO();
		b2.setSubject("안녕하세요");
		b2.setWriter("관리자");
		b2.setCategory("정보");
		b2.setNum(2);
		b2.setRe_lev(0);
		b2.setRe_seq(0);
		b2.setReadcount(15);
		b2.setRegitdate(date);
		result.add(b1);
		result.add(b2);
		
		BoardDTO b3 = new BoardDTO();
		b3.setSubject("토요일 모일사람.");
		b3.setWriter("유승열");
		b3.setCategory("모임");
		b3.setNum(1);
		b3.setRe_lev(0);
		b3.setRe_seq(0);
		b3.setReadcount(5);
		b3.setRegitdate(date);
		result.add(b3);
		
		BoardDTO b4 = new BoardDTO();
		b4.setSubject("정보알려드려요.");
		b4.setWriter("유승열");
		b4.setCategory("정보");
		b4.setNum(1);
		b4.setRe_lev(0);
		b4.setRe_seq(0);
		b4.setReadcount(5);
		b4.setRegitdate(date);
		result.add(b4);
		
		BoardDTO b5 = new BoardDTO();
		b5.setSubject("잡담합시다.");
		b5.setWriter("유승열");
		b5.setCategory("잡담");
		b5.setNum(1);
		b5.setRe_lev(0);
		b5.setRe_seq(0);
		b5.setReadcount(5);
		b5.setRegitdate(date);
		result.add(b5);
		
		return result;
	}
	public List<BoardDTO> getAskList(int page){
		List<BoardDTO> result = new ArrayList<>();
		BoardDTO b1 = new BoardDTO();
		b1.setSubject("예제입니다.");
		b1.setWriter("유승열");
		b1.setCategory("질문");
		b1.setNum(1);
		b1.setRe_lev(0);
		b1.setRe_seq(0);
		b1.setReadcount(5);
		Date date = new Date();
		b1.setRegitdate(date);
		result.add(b1);
		return result;
	}
	public List<BoardDTO> getTalkList(int page){
		List<BoardDTO> result = new ArrayList<>();
		BoardDTO b1 = new BoardDTO();
		b1.setSubject("잡담합시다.");
		b1.setWriter("유승열");
		b1.setCategory("잡담");
		b1.setNum(1);
		b1.setRe_lev(0);
		b1.setRe_seq(0);
		b1.setReadcount(5);
		Date date = new Date();
		b1.setRegitdate(date);
		result.add(b1);
		return result;
	}public List<BoardDTO> getInfoList(int page){
		List<BoardDTO> result = new ArrayList<>();
		BoardDTO b1 = new BoardDTO();
		b1.setSubject("정보알려드려요.");
		b1.setWriter("유승열");
		b1.setCategory("정보");
		b1.setNum(1);
		b1.setRe_lev(0);
		b1.setRe_seq(0);
		b1.setReadcount(5);
		Date date = new Date();
		b1.setRegitdate(date);
		result.add(b1);
		return result;
	}
	public List<BoardDTO> getCircleList(int page){
		List<BoardDTO> result = new ArrayList<>();
		BoardDTO b1 = new BoardDTO();
		b1.setSubject("토요일 모일사람.");
		b1.setWriter("유승열");
		b1.setCategory("모임");
		b1.setNum(1);
		b1.setRe_lev(0);
		b1.setRe_seq(0);
		b1.setReadcount(5);
		Date date = new Date();
		b1.setRegitdate(date);
		result.add(b1);
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
}
