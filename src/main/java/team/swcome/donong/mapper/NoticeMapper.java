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

	void insertNotice(NoticeDTO notice);

	NoticeDTO getNoticeContent(int num);
	
	void updateNotice(NoticeDTO notice);

	void delNotice(int num);

	int getSrcListCount(Map<String, Object> map);

	List<NoticeDTO> getSrcList(Map<String, Object> map, RowBounds row);


	
}
