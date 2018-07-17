package team.swcome.donong.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import team.swcome.donong.dao.FAQDAO;
import team.swcome.donong.dao.NoticeDAO;
import team.swcome.donong.mapper.FAQMapper;
import team.swcome.donong.mapper.NoticeMapper;

@Service
public class FAQService implements FAQMapper {
	
	@Autowired
	FAQDAO faqDAO;
	
	
}