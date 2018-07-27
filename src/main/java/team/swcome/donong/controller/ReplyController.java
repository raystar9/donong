package team.swcome.donong.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import team.swcome.donong.dto.ReplyDTO;
import team.swcome.donong.dto.SessionBean;
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
		System.out.println(vo.getContents());
		sessionBean.setMemberNum(1);
		sessionBean.setNickname("admin");
		String userId=(String)session.getAttribute("userId");
		vo.setReplyer(sessionBean.getNickname());//vo.setReplyer(userId);
		vo.setMemberNum(sessionBean.getMemberNum());
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
