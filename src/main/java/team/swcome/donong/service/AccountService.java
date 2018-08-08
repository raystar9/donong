package team.swcome.donong.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.BoardDTO;
import team.swcome.donong.dto.MemberDTO;
import team.swcome.donong.dto.OrdersDTO;
import team.swcome.donong.mapper.BoardMapper;
import team.swcome.donong.mapper.MemberMapper;
import team.swcome.donong.mapper.OrdersMapper;

@Service
public class AccountService {
	
	@Autowired
	MemberMapper mainMapper;
	
	@Autowired
	OrdersMapper ordersMapper;
	
	@Autowired
	BoardMapper boardMapper;
	
	public void insertMember(MemberDTO m) {
		mainMapper.insertMember(m);
	}
	
	public MemberDTO getUserNum(MemberDTO m) {
		return mainMapper.selectLoginStateByIdAndPw(m);
		
	}

	public MemberDTO findMember(int num) {
		return mainMapper.selectMemberByNum(num);
	}

	public void editMember(MemberDTO m) {
		mainMapper.updateAll(m);
		
	}

	public MemberDTO findPass(String id, String realname) {
		return mainMapper.selectMemberCountByIdAndRealname(id, realname);
	}
	
	public MemberDTO findId(String realname, String phone) {
		return mainMapper.selectMemberCountByRealnameAndPhone(realname, phone);
	}

	public int checkMemberId(String id) {
		
		int result = 0;
		
		MemberDTO memberDTO = mainMapper.selectMemberCountById(id);
		
		if(memberDTO == null) {
			result = 0;
		} else {
			result = 1;
		}
		
		return result;
			
	}

	public int checkMemberNickname(String nickname) {
		
	int result = 0;
		
		MemberDTO memberDTO = mainMapper.selectMemberCountByNickName(nickname);
		
		if(memberDTO == null) {
			result = 0;
		} else {
			result = 1;
		}
		
		return result;
	}


	public List<OrdersDTO> selectPagingOrders(Map m) {

		return ordersMapper.selectPagingOrders(m);
	}

	public int getOrderListCount(int member_num) {
		
		return ordersMapper.getOrderListCount(member_num);
	}

	public List<BoardDTO> selectNewestWrite(int member_num) {
		return boardMapper.selectNewestWrite(member_num);
	}


	
}
