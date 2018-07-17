package team.swcome.donong.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import team.swcome.donong.dto.BoardDTO;
import team.swcome.donong.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	@Autowired
	BoardService boardService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/communitylist", method = RequestMethod.GET)
	public String home(Locale locale, Model model,@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="limit",required=false) Integer limit,
			@RequestParam(value="state", defaultValue="no") String state, 
			HttpServletRequest request){
		List<BoardDTO> boardlist = new ArrayList<>();
		HttpSession session=request.getSession();
		if(limit !=null) {
			session.setAttribute("limit", limit);
		}else {
			limit = 10;
		}
		
		if(session.getAttribute("limit")!=null) {
			limit=Integer.parseInt(session.getAttribute("limit").toString());
		}
		
		int listcount = boardService.getListCount();

		
		int maxpage = (listcount + limit - 1) / limit;

		int startpage = ((page - 1) / 10) * 10 + 1;

		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		if( endpage<page) page=endpage;
		
		
		boardlist = boardService.getMainList(page,limit); 

		
		ModelAndView boardListM;
		if(state.equals("ajax")) {
			boardListM= new ModelAndView("com/com_list2");
		}else {
			boardListM=new ModelAndView("com/com_list");
		}

		boardListM.addObject("page", page);
		boardListM.addObject("maxpage", maxpage);
		boardListM.addObject("startpage", startpage);
		boardListM.addObject("endpage", endpage);
		boardListM.addObject("listcount",listcount);
		boardListM.addObject("bbslist",boardlist);
		model.addAttribute("boardList", boardlist);
		model.addAttribute("page", page);
		return "com/com_list";
	}
	@RequestMapping(value = "/communitywrite", method = RequestMethod.GET)
	public String write(Locale locale, Model model) {
	
		return "com/com_write";
	}
	@RequestMapping(value = "/communitywrite_ok", method = RequestMethod.POST)
	public String write_ok(Locale locale, Model model) {
	
		return "com/com_list";
	}
	@RequestMapping(value = "/communitycont", method = RequestMethod.GET)
	public String cont(Locale locale, Model model) {
	
		return "com/com_cont";
	}
	
	@RequestMapping(value = "/communityedit", method = RequestMethod.GET)
	public String edit(Locale locale, Model model, @RequestParam int com_num, int page, String state) {
		
		return "com/com_edit";
	}
	@RequestMapping(value = "/communitydel", method = RequestMethod.GET)
	public String del(Locale locale, Model model,@RequestParam int com_num, int page, String state) {
		boardService.deleteBoard(com_num);
		return "com/com_del";
	}
	@RequestMapping(value = "/communityreply", method = RequestMethod.GET)
	public String reply(Locale locale, Model model,@RequestParam int com_num, int page, String state) {
	
		return "com/com_reply";
	}@RequestMapping(value = "/communityfind", method = RequestMethod.GET)
	public String find(Locale locale, Model model) {
	
		return "com/com_find";
	}
	
	
}
