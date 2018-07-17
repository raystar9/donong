package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import team.swcome.donong.dao.NoticeDAO;
import team.swcome.donong.dto.NoticeDTO;
import team.swcome.donong.mapper.NoticeMapper;

@Service
public class NoticeService implements NoticeMapper {
	
	@Autowired
	NoticeDAO noticeDAO;

	public List<NoticeDTO> getNoticeList() {

		return noticeDAO.getNoticeAll();
	}
	
	
}