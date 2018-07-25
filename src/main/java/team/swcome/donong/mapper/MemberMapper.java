package team.swcome.donong.mapper;

import team.swcome.donong.dto.MemberDTO;

public interface MemberMapper {
	
	public void insertMember(MemberDTO m);

	public MemberDTO selectLoginStateByIdAndPw(MemberDTO m);

	public MemberDTO selectMemberByNum(int num);

	public void updateAll(MemberDTO m);
	
	public MemberDTO selectMemberCountByIdAndRealname(String id, String realname);
	
	public MemberDTO selectMemberCountByRealnameAndPhone(String realname, String phone);
	
	public MemberDTO selectMemberCountById(String id);
	
	public MemberDTO selectMemberCountByNickName(String nickname);
}
