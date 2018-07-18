package team.swcome.donong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import team.swcome.donong.dto.FAQDTO;


@Mapper
public interface FAQMapper {
	
	public List<FAQDTO> selectAll();

	public List<FAQDTO> selectPage(int page);
	
}
