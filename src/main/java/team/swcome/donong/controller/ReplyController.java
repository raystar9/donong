package team.swcome.donong.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import team.swcome.donong.dto.ReplyDTO;
import team.swcome.donong.service.ReplyService;

@RestController
@RequestMapping("")
public class ReplyController {

	@Inject
	ReplyService replyService;
	
	//댓글입력
	@RequestMapping("reply/insert.do")
	public void insert(@ModelAttribute ReplyDTO vo, HttpSession session) {
		
		String userId=(String)session.getAttribute("userId");
		vo.setReplyer("admin");//vo.setReplyer(userId);
		replyService.insert(vo);
	}
	
	//댓글 목록(@Controller방식 :view(화면)를 리턴)
	@RequestMapping("reply/list.do")
	public ModelAndView list(@RequestParam int num, ModelAndView mav) {
		List<ReplyDTO> list=replyService.list(num);
		//뷰 이름 지정
		mav.setViewName("com/replyList");
		//뷰에 전달할 데이터 지정
		mav.addObject("list", list);
		//replyList.jsp로 포워딩
		return mav;
	}
	
	//댓글 목록(@RestController Json방식으로 처리 :데이터를 리턴)
	@RequestMapping("listJson.do")
	@ResponseBody//리턴테이러틑 json으로 변환
	public List<ReplyDTO> listJson(@RequestParam int num){
		List<ReplyDTO> list=replyService.list(num);
		return list;
	}
}
