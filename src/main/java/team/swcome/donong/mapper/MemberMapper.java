package team.swcome.donong.mapper;

import team.swcome.donong.dto.MemberDTO;

public interface MemberMapper {
	
	public void insertMember(MemberDTO m);

	public MemberDTO selectLoginInfo(MemberDTO m);

	public MemberDTO findMember(int num);

	public void editMember(MemberDTO m);
	
	public MemberDTO findPass(String id, String realname);
	
}
