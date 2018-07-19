package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import team.swcome.donong.dto.NoticeDTO;
import team.swcome.donong.mapper.NoticeMapper;

@Service
public class NoticeService {
	
	@Autowired
	NoticeMapper noticeMapper;

	public List<NoticeDTO> getNoticeList() {

		return noticeMapper.getNoticeList();
	}

	public int getListCount() {

		return noticeMapper.getListCount();
	}

	public NoticeDTO getNoticeContent(int num) {

		return noticeMapper.getNoticeContent(num);
	}
	
	
}