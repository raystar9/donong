package team.swcome.donong.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		return  "main/login";
	}
	
	@RequestMapping(value = "member_login")
	public String member_login() throws Exception {
		return "main/login";
	}
	
	@RequestMapping(value = "pwd_find")
	public String pwd_find() throws Exception {
		return "main/pwd_find";
	}
	
	@RequestMapping(value = "member_login_ok", method =  {RequestMethod.POST,RequestMethod.GET})
	public String member_login_ok(Model model, MemberDTO m, SessionBean sessionBean) throws Exception {
			MemberDTO memberRes = accountService.getUserNum(m);
			if(memberRes == null ) {
				String error = "loginfail";
				model.addAttribute("error", error);
				return "main/erroppage";
			}	
			sessionBean.setNickname(memberRes.getNickname());
			sessionBean.setMemberNum(memberRes.getNum());
			System.out.println("세션저장"+sessionBean.getNickname());

			return "main/home";
			
	}
	
	@RequestMapping(value = "member_logout")
	public String member_logout(Model model, SessionBean sessionBean) throws Exception {

		sessionBean = null;
		
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
	
	@RequestMapping(value = "sitemap", method=RequestMethod.GET)
	public String sitemap() {
		return "main/sitemap";
	}
	
}
