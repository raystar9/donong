package team.swcome.donong.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import team.swcome.donong.dto.NoticeDTO;


@Mapper
public interface NoticeMapper {

	List<NoticeDTO> getNoticeList(RowBounds row);

	int getListCount();

	NoticeDTO getNoticeContent(int num);

	void delNotice(int num);

	void insertNotice(NoticeDTO notice);

	int getSrcListCount(Map<String, Object> map);

	List<NoticeDTO> getSrcList(Map<String, Object> map, RowBounds row);

	
}
