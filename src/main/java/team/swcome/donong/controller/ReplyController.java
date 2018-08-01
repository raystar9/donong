package team.swcome.donong.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import team.swcome.donong.dto.ReplyDTO;
import team.swcome.donong.dto.SessionBean;
import team.swcome.donong.service.ReplyPager;
import team.swcome.donong.service.ReplyService;

@Controller
@SessionAttributes("sessionBean")
public class ReplyController {

	@Inject
	ReplyService replyService;
	
	//?κΈ??? ₯
	@RequestMapping("reply/insert.do")
	@ResponseBody
	public void insert(@ModelAttribute ReplyDTO vo, HttpSession session, SessionBean sessionBean) {
		
		sessionBean.setMemberNum(1);
		sessionBean.setNickname("admin");
		String userId=(String)session.getAttribute("userId");
		vo.setReplyer(sessionBean.getNickname());//vo.setReplyer(userId);
		vo.setMemberNum(sessionBean.getMemberNum());
		replyService.insert(vo);
	}
	
	//?κΈ? λͺ©λ‘(@Controllerλ°©μ :view(?λ©?)λ₯? λ¦¬ν΄)
	@RequestMapping("reply/list.do")
	public ModelAndView list(@RequestParam int num, ModelAndView mav,@RequestParam(defaultValue="1")int curPage,HttpSession session) {
		
		int count = replyService.count(num);//?κΈ?κ°μ
		
		ReplyPager replyPager = new ReplyPager(count,curPage);
		int start = replyPager.getPageBegin();
		int end = replyPager.getPageEnd();
		
		
		List<ReplyDTO> list=replyService.list(num,start,end,session);
		//λ·? ?΄λ¦? μ§?? 
		mav.setViewName("com/replyList");
		//λ·°μ ? ?¬?  ?°?΄?° μ§?? 
		mav.addObject("list", list);
		//replyList.jspλ‘? ?¬??©
		return mav;
	}
	

	//?κΈ? ??Έλ³΄κΈ°
	@RequestMapping(value="reply/detail/{num}",method=RequestMethod.GET)
	public ModelAndView replyDetail(@PathVariable("num") int num,ModelAndView mav,HttpSession session) {
		ReplyDTO vo=replyService.detail(num);
		mav.setViewName("com/replyDetail");
		mav.addObject("vo", vo);
		
		return mav;
		
	}
	
	//?κΈ? ??  μ²λ¦¬
	@RequestMapping(value="reply/update/{num}",method= {RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> replyUpdate(@PathVariable("num")int num,@RequestBody ReplyDTO vo){
		ResponseEntity<String> entity=null;
		try {
			vo.setNum(num);
			replyService.update(vo);
			//?κΈ? ?? ?΄ ?±κ³΅νλ©? ?±κ³? ??λ©μΈμ§? ???₯
			entity=new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			//?κΈ? ?? ?΄ ?€?¨?λ©? ?€?¨ ??λ©μμ§? ???₯
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		//??  μ²λ¦¬ HTTP ?? λ©μμ§? λ¦¬ν΄
		return entity;
	}
	//?κΈ? ?­? μ²λ¦¬
	@RequestMapping(value="reply/delete/{num}")
	public ResponseEntity<String> replyDelete(@PathVariable("num") int num){
		ResponseEntity<String> entity=null;
		try {
			
			replyService.delete(num);
			entity=new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/list/{num}/",method=RequestMethod.GET)
	public ModelAndView replyList(@PathVariable("num")int num, ModelAndView mav,HttpSession session) {
		int start=0;
		int end=0;
		List<ReplyDTO> list=replyService.list(num, start, end, session);
		mav.setViewName("board/replyList");
		mav.addObject("list",list);
		return mav;
	}
}
