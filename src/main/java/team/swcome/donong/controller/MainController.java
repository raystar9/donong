package team.swcome.donong.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.swcome.donong.dto.MemberDTO;
import team.swcome.donong.service.AccountService;

/**
 * Handles requests for the application home page.
 */
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
	public String member_join_ok(Model model, MemberDTO m, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String id=request.getParameter("id");
		String pass=request.getParameter("password");
		
		MemberDTO m2 = this.accountService.getUsingId(id);
		
		if(m==null) {
			out.println("<script>");
			out.println("alert('가입되어 있지 않은 ID입니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			if(m2.getPassword().equals(pass)) {
				session.setAttribute("id", id);
				
				String nickname = m.getNickname();
				session.setAttribute("nickname", nickname);
				
				int num = m.getNum();
				session.setAttribute("num", num);
				
				Cookie savecookie = new Cookie("saveid", id);
				if(request.getParameter("saveid")!=null) {
					savecookie.setMaxAge(60*60);
				} else {
					savecookie.setMaxAge(0);
				}
				response.addCookie(savecookie);
				
				return "main/home";
			} else {
				out.println("<script>");
				out.println("alert('비밀번호를 다시 확인해주세요')");
				out.println("history.go(-1)");
				out.println("</script>");
			}
		}
				return null;
		
		
	}

	
}
