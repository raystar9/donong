package team.swcome.donong.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.swcome.donong.dto.MemberDTO;
import team.swcome.donong.dto.SessionBean;
import team.swcome.donong.service.AccountService;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes("sessionBean")
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired
	AccountService accountService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "member_join")
	public String member_join() throws Exception {
		return "main/member/joinform";
	}
	
	@RequestMapping(value = "member_join_ok", method =  RequestMethod.POST)
	public String member_join_ok(MemberDTO m) throws Exception {
		accountService.insertMember(m);
		return  "main/main";
	}
	
	@RequestMapping(value = "member_login_ok", method =  {RequestMethod.POST,RequestMethod.GET})
	public String member_login_ok(Model model, MemberDTO m, SessionBean sessionBean, 
			@RequestParam String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
			MemberDTO memberRes = accountService.getUserNum(m);
			
			if(memberRes == null ) {
				String error = "loginfail";
				model.addAttribute("error", error);
				return "main/erroppage";
				
			} else {	
			
			sessionBean.setNickname(memberRes.getNickname());
			sessionBean.setMemberNum(memberRes.getNum());
			System.out.println("세션저장"+sessionBean.getNickname());
			System.out.println("세션저장"+sessionBean.getMemberNum());
			
			Cookie savecookie = new Cookie("saveid", id);
			if(request.getParameter("saveid")!=null) {
				savecookie.setMaxAge(60*60);
			} else {
				savecookie.setMaxAge(0);
			}
			response.addCookie(savecookie);
			
			return "main/main";
			}
			
	}
	
	@RequestMapping(value = "member_logout")
	public String member_logout(Model model, SessionBean sessionBean) throws Exception {

		sessionBean.setMemberNum(0);
		sessionBean.setNickname(null);
	
		
		String error = "logout";
		model.addAttribute("error", error);

		return "main/erroppage";
	}
	
	@RequestMapping(value = "member_mypage")
	public String member_mypage() throws Exception {
		return "main/member/mypage";
	}
	
	@RequestMapping(value = "member_edit")
	public String member_edit(Model model, MemberDTO m,SessionBean sessionBean)throws Exception {
		int num = sessionBean.getMemberNum();
		m = accountService.findMember(num);
		 
		model.addAttribute(m);
				
		return "main/member/editform";
	}
	
	@RequestMapping(value = "member_edit_ok", method=RequestMethod.POST)
	public String member_edit_ok(Model model, MemberDTO m, SessionBean sessionBean)throws Exception {
		int num = sessionBean.getMemberNum();
		m.setNum(num);
	
		accountService.editMember(m); 
		
		String error = "editok";
		model.addAttribute("error", error);
		
		return "main/member/mypage";
	}
	
	@RequestMapping(value = "pwd_find")
	public String pwd_find() throws Exception {
		return "main/pwd_find";
	}
	
	@RequestMapping(value = "find_password", method=RequestMethod.POST)
	public String find_password(Model model, MemberDTO m, @RequestParam String id, @RequestParam String realname) {
		
		m=accountService.findPass(id, realname);
		
		if(m==null) {
			String error = "findpassfail";
			model.addAttribute("error", error);
			return "main/erroppage";
		}
		
		String password=m.getPassword();
		
		model.addAttribute("password", password);
		
		return "main/pwd_find";
	}
	
	@RequestMapping(value = "id_find")
	public String id_find() throws Exception {
		return "main/id_find";
	}
	
	@RequestMapping(value = "find_id", method=RequestMethod.POST)
	public String find_id(Model model, MemberDTO m, @RequestParam String realname, @RequestParam String phone) {
		
		m=accountService.findId(realname, phone);
		
		if(m==null) {
			String error = "findidfail";
			model.addAttribute("error", error);
			return "main/erroppage";
		}
		
		String id=m.getId();
		
		model.addAttribute("id", id);
		
		return "main/id_find";
	}
	
	@ResponseBody
	@RequestMapping(value = "checkOverlapId",  method=RequestMethod.POST)
	public String check_id(@RequestParam String id, HttpServletResponse response) throws Exception {

		String data = accountService.checkMemberId(id) + "";
		System.out.println("data"+data);
		return data;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "checkOverlapNickName",  method=RequestMethod.POST)
	public String check_nickname(@RequestParam String nickname, HttpServletResponse response) throws Exception {

		String d = accountService.checkMemberNickname(nickname) + "";
		System.out.println("data"+d);
		return d;
		
	}
	

	
	//main페이지 
	@RequestMapping(value = "main")
	public String mainview(Model model, @CookieValue(value="saveid", required=false) Cookie readCookie) throws Exception {
		
		if(readCookie != null) {
			model.addAttribute("saveid", readCookie.getValue());
		}
		
		return "main/main";
	}
	
	@RequestMapping(value = "member_del")
	public String member_del(Model model, SessionBean sessionBean) throws Exception {
		
		sessionBean.setMemberNum(0);
		sessionBean.setNickname(null);
	
		
		String error = "del";
		model.addAttribute("error", error);

		return "main/erroppage";

	}
	
	
	
}
