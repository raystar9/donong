package team.swcome.donong.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import team.swcome.donong.dto.NoticeDTO;
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
			@RequestParam(value="state", defaultValue="none") String state,
			HttpServletRequest request) throws Exception {
		int page = 1;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		RowBounds row = new RowBounds((page - 1) * 10, 10);
		
		if (srcTxt.equals("")) {
			listCount = noticeService.getListCount();
			noticeList = noticeService.getNoticeList(row);
		} else {
			Map<String, Object> map = new HashMap<>();
			map.put("srcOpt", srcOpt);
			map.put("srcTxt", "%" + srcTxt + "%");
			
			listCount = noticeService.getSrcListCount(map);
			noticeList = noticeService.getSrcList(map, row);
		}
		
		maxPage = (listCount + 10 - 1) / 10;
		startPage = ((page - 1) / 10) * 10 + 1;
		endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		if (endPage < page) {
			page = endPage;
		}
		
		mv.addObject("page", page);
		mv.addObject("srcOpt", srcOpt);
		mv.addObject("srcTxt", srcTxt);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("listCount", listCount);
		mv.addObject("noticeList", noticeList);
		
		if (state.equals("paging") || state.equals("search")) {
			System.out.println("ajax 실행!!");
			mv.setViewName("service/notice_ajax");
		} else {			
			mv.setViewName("service/notice");
		}
		
		return mv;
	}

	@RequestMapping(value = "/cs/notice/write")
	public String noticeWrite() {
		return "service/notice_write";
	}
  
	@RequestMapping(value="/cs/notice", method=RequestMethod.POST)
	public String noticeWrite(
			NoticeDTO notice
			) {
		System.out.println("글쓰기");
		noticeService.insertNotice(notice);
		
		return "redirect:/cs/notice/" + notice.getNum() + "?state=cont";
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
	
	@RequestMapping(value="/cs/notice/{num}", method=RequestMethod.PUT)
	public String noticeEdit(
			@PathVariable int num,
			NoticeDTO notice
			) {
		noticeService.delNotice(num);
		
		return "redirect:/cs/notice/" + notice.getNum() + "?state=cont";
	}
	
	@RequestMapping(value="/cs/notice/{num}", method=RequestMethod.DELETE)
	public String noticeDel(
			@PathVariable int num
			) {
		noticeService.delNotice(num);
		
		return "redirect:/cs/notice";
	}
	
	@RequestMapping(value="/cs/faq", method=RequestMethod.GET)
	public ModelAndView faqList(
			ModelAndView mv,
			@RequestParam String keyword,
			HttpServletRequest request) {
		Map<String, Object> map = faqService.getFaqSrcList(keyword, request);
		
		mv.addObject("faqList", map.get("faqList"));
		mv.addObject("listCount", map.get("listCount"));
		mv.addObject("page", map.get("page"));
		mv.addObject("limit", map.get("limit"));
		mv.addObject("maxPage", map.get("maxPage"));
		mv.addObject("startPage", map.get("startPage"));
		mv.addObject("endPage", map.get("endPage"));
		
		mv.setViewName("service/faq");

		return mv;
	}
	
	@RequestMapping(value="/cs/search", method=RequestMethod.GET)
	public ModelAndView csSearch(ModelAndView mv, Model model) {
		mv.setViewName("service/search");
		
		Map<String, Object> map = model.asMap(); 
		return mv;
	}
	
	@RequestMapping(value="/cs/qna", method=RequestMethod.GET)
	public ModelAndView csQna(ModelAndView mv) {
		mv.setViewName("service/qna");
		
		return mv;
	}
	
}