package team.swcome.donong.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import team.swcome.donong.dto.NoticeDTO;
import team.swcome.donong.mapper.NoticeMapper;

@Service
public class NoticeService {
	
	@Autowired
	NoticeMapper noticeMapper;

	public List<NoticeDTO> getNoticeList(RowBounds row) {

		return noticeMapper.getNoticeList(row);
	}

	public int getListCount() {

		return noticeMapper.getListCount();
	}
	
	public void insertNotice(NoticeDTO notice) {
		
		noticeMapper.insertNotice(notice);
	}

	public NoticeDTO getNotice(int num) {

		return noticeMapper.getNoticeContent(num);
	}
	
	public void updateNotice(NoticeDTO notice) {
		
		noticeMapper.updateNotice(notice);
	}

	public void delNotice(int num) {
		
		noticeMapper.delNotice(num);
	}

	public int getSrcListCount(Map<String, Object> map) {

		return noticeMapper.getSrcListCount(map);
	}

	public List<NoticeDTO> getSrcList(Map<String, Object> map, RowBounds row) {

		return noticeMapper.getSrcList(map, row);
	}


	
	
}