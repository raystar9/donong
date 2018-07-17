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
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		//return "main/home";
		return "main/home";
	}
	
	@RequestMapping(value = "member_join")
	public String member_join(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "main/member/joinform";
	}
	
	@RequestMapping(value = "member_join_ok", method =  RequestMethod.POST)
	public String member_join_ok(MemberDTO m, HttpServletResponse response) throws Exception {
		accountService.insertMember(m);
		return "main/home";
	}
	
	@RequestMapping(value = "member_login")
	public String member_login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "main/login";
	}
	
	@RequestMapping(value = "pwd_find")
	public String pwd_find(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "main/pwd_find";
	}
	
	@RequestMapping(value = "member_login_ok", method =  {RequestMethod.POST,RequestMethod.GET})
	public String member_join_ok(Model model, MemberDTO m, SessionBean sessionBean) throws Exception {
			MemberDTO memberRes = accountService.getUserNum(m);
			if(memberRes == null ) {
				return "main/erroppage";
				
			}	
			sessionBean.setNickname(memberRes.getNickname());
			sessionBean.setMemberNum(memberRes.getNum());
			System.out.println("세션저장"+sessionBean.getNickname());

			return "main/home";
			
	}
	@RequestMapping(value = "member_logout")
	public String member_logout(SessionBean sessionBean) throws Exception {

		sessionBean = null;

		return "main/login";
	}
	@RequestMapping(value = "member_mypage")
	public String member_mypage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "main/member/mypage";
	}
	@RequestMapping(value = "member_edit")
	public String member_edit(Model model, MemberDTO m,SessionBean sessionBean, HttpServletRequest request)throws Exception {
		int num = sessionBean.getMemberNum();
		m = accountService.findMember(num);
		
		String email = m.getEmail();
		
		 StringTokenizer slidemail = new StringTokenizer(email, "@");
		 String mail1 = slidemail.nextToken();
		 String mail2 = slidemail.nextToken();
		 
		 
		model.addAttribute(m);
		model.addAttribute(mail1);
		model.addAttribute(mail2);
		
		return "main/member/editform";
	}
	
	
}
