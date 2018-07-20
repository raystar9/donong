package team.swcome.donong.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

@Mapper
public interface FAQMapper {

	public Object getSrcList(String keyword, RowBounds row);

	public int getSrcListCount(String keyword);
	
}
