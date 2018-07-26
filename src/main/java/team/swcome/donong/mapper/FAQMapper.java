package team.swcome.donong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import team.swcome.donong.dto.FAQDTO;

@Mapper
public interface FAQMapper {

	public List<FAQDTO> getSrcList(String keyword, RowBounds row);

	public int getSrcListCount(String keyword);

	public int faqReadCountUpdate(int num);

	public List<FAQDTO> getFaqTopTenList(RowBounds row);
	
}
