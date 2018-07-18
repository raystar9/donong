package team.swcome.donong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import team.swcome.donong.dto.NoticeDTO;


@Mapper
public interface NoticeMapper {

	List<NoticeDTO> getNoticeList();

	int getListCount();

	NoticeDTO getNoticeContent(int num);

	
}
