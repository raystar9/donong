package team.swcome.donong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.swcome.donong.dto.MemberDTO;
import team.swcome.donong.mapper.MemberMapper;

@Service
public class AccountService {
	
	@Autowired
	MemberMapper mainMapper;
	
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
	
}
