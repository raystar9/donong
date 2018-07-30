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
	
	//댓글입력
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
	
	//댓글 목록(@Controller방식 :view(화면)를 리턴)
	@RequestMapping("reply/list.do")
	public ModelAndView list(@RequestParam int num, ModelAndView mav,@RequestParam(defaultValue="1")int curPage,HttpSession session) {
		
		int count = replyService.count(num);//댓글개수
		
		ReplyPager replyPager = new ReplyPager(count,curPage);
		int start = replyPager.getPageBegin();
		int end = replyPager.getPageEnd();
		
		
		List<ReplyDTO> list=replyService.list(num,start,end,session);
		//뷰 이름 지정
		mav.setViewName("com/replyList");
		//뷰에 전달할 데이터 지정
		mav.addObject("list", list);
		//replyList.jsp로 포워딩
		return mav;
	}
	

	//댓글 상세보기
	@RequestMapping(value="reply/detail/{num}",method=RequestMethod.GET)
	public ModelAndView replyDetail(@PathVariable("num") int num,ModelAndView mav,HttpSession session) {
		ReplyDTO vo=replyService.detail(num);
		mav.setViewName("com/replyDetail");
		mav.addObject("vo", vo);
		
		return mav;
		
	}
	
	//댓글 수정 처리
	@RequestMapping(value="reply/update/{num}",method= {RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> replyUpdate(@PathVariable("num")int num,@RequestBody ReplyDTO vo){
		ResponseEntity<String> entity=null;
		try {
			vo.setNum(num);
			replyService.update(vo);
			//댓글 수정이 성공하면 성공 상태메세지 저장
			entity=new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			//댓글 수정이 실패하면 실패 상태메시지 저장
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		//수정 처리 HTTP 상태 메시지 리턴
		return entity;
	}
	//댓글 삭제처리
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
