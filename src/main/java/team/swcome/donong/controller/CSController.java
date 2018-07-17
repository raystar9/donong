package team.swcome.donong.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team.swcome.donong.dto.NoticeDTO;
import team.swcome.donong.mapper.FAQMapper;
import team.swcome.donong.mapper.NoticeMapper;
import team.swcome.donong.mapper.QNAMapper;
import team.swcome.donong.service.FAQService;
import team.swcome.donong.service.NoticeService;
import team.swcome.donong.service.QNAService;

@Controller
public class CSController {
	
	private static final Logger logger = LoggerFactory.getLogger(CSController.class);
	
	@Autowired
	NoticeMapper noticeMapper;
	QNAMapper qnaMapper;
	FAQMapper faqMapper;
	
	@RequestMapping(value="/cs/main", method=RequestMethod.GET)
	public ModelAndView csHome(Locale locale, ModelAndView mv) {
		mv.setViewName("service/cs_main");
		
		return mv;
	}
	
	@RequestMapping(value="/cs/notice", method=RequestMethod.GET)
	public ModelAndView csNotice(ModelAndView mv) {
		List<NoticeDTO> noticeList = noticeMapper.getNoticeList();
		
		mv.addObject("noticeList", noticeList);
		
		mv.setViewName("service/cs_notice");
		
		return mv;
	}
	
	@RequestMapping(value="/cs/search", method=RequestMethod.GET)
	public ModelAndView csSearch(ModelAndView mv) {
		mv.setViewName("service/cs_search");
		
		return mv;
	}
	
	@RequestMapping(value="/cs/qna", method=RequestMethod.GET)
	public ModelAndView csQna(ModelAndView mv) {
		mv.setViewName("service/cs_qna");
		
		return mv;
	}
	
}