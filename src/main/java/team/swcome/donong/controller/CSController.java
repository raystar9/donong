package team.swcome.donong.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	NoticeService noticeService;
	@Autowired
	FAQService faqService;
	@Autowired
	QNAService qnaService;
	
	@RequestMapping(value="/cs/main", method=RequestMethod.GET)
	public ModelAndView csHome(Locale locale, ModelAndView mv) {
		mv.setViewName("service/cs_main");
		
		return mv;
	}
	
	@RequestMapping(value="/cs/notice", method=RequestMethod.GET)
	public ModelAndView noticeList(
			ModelAndView mv, 
			@RequestParam(defaultValue="") String srcOpt,
			@RequestParam(defaultValue="") String srcTxt,
			@RequestParam(value="state", defaultValue="none") String state) throws Exception {

		mv.addObject("listCount", noticeService.getListCount());
		mv.addObject("noticeList", noticeService.getNoticeList());
		mv.setViewName("service/notice");
		
		return mv;
	}
	
	@RequestMapping(value="/cs/notice/{num}", method=RequestMethod.GET)
	public ModelAndView noticeCont(
			ModelAndView mv, 
			@PathVariable int num, 
			@RequestParam("state") String state,
			HttpServletResponse response) throws Exception {
		NoticeDTO noticeBean = noticeService.getNoticeContent(num);
		noticeBean.setContent(noticeBean.getContent().replace("\n", "<br>"));
		
		mv.addObject("notice", noticeBean);

		if (state.equals("cont")) {
			mv.setViewName("service/notice_cont");
		} else if (state.equals("edit")) {
			mv.setViewName("service/notice_edit");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/cs/notice_del/{num}", method=RequestMethod.DELETE)
	public String noticeDel(
			@PathVariable int num
			) {
		
		return "redirect:/cs/notice";
	}
	
	@RequestMapping(value="/cs/faq", method=RequestMethod.GET)
	public ModelAndView faqList(ModelAndView mv) {
		mv.addObject("faqList", faqService.getFAQList());
		mv.setViewName("service/faq");

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