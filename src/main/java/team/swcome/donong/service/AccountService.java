package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.swcome.donong.dto.MainDTO;
import team.swcome.donong.dto.MemberDTO;
import team.swcome.donong.mapper.MainMapper;

@Service
public class AccountService {
	
	@Autowired
	MainMapper mainMapper;
	
	public List<MainDTO> getMainList(){
		return mainMapper.selectAll();
	}
	
	public void insertMember(MemberDTO m) {
		mainMapper.insertMember(m);
	}
	
	public MemberDTO getUserNum(MemberDTO m) {
		return mainMapper.selectLoginInfo(m);
		
	}

	public MemberDTO findMember(int num) {
		return mainMapper.findMember(num);
	}
	
	
	
}
