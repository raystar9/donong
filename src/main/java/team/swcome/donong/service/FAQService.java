package team.swcome.donong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import team.swcome.donong.dto.FAQDTO;
import team.swcome.donong.mapper.FAQMapper;

@Service
public class FAQService {
	
	@Autowired
	FAQMapper faqMapper;
	
	public List<FAQDTO> getFAQList() {

		return faqMapper.selectAll();
	}
	
	public List<FAQDTO> getFAQList(int page) {
		
		return faqMapper.selectPage(page);
	}
	
}