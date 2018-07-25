package team.swcome.donong.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.swcome.donong.dto.FileDTO;
import team.swcome.donong.dto.MemberDTO;
import team.swcome.donong.dto.RentalDTO;
import team.swcome.donong.dto.SessionBean;
import team.swcome.donong.service.RentalService;

@SessionAttributes("sessionBean")
@Controller
public class RentalController {
	
	private static final Logger logger = LoggerFactory.getLogger(RentalController.class);
	@Autowired
	RentalService RentalService;
	
	
	/*
	@RequestMapping(value = "rental", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		RentalService.getMainList();
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		return "rental/home";
	 }
	*/
	
	/* 농지 대여 목록 페이지로 이동 */
	@RequestMapping(value = "/rental", method = RequestMethod.GET)
	public String rentalList(Model model) {
		List<RentalDTO> list = RentalService.selectRentalList();
		String[] filepath = RentalService.selectRepresentImg();

		for(int i=0; i<list.size(); i++) {
			list.get(i).setPath(filepath[i]);
			System.out.println("num = " + list.get(i).getNum());
		}
		
		model.addAttribute("list", list);
		return "rental/rentalList";
	}
	
	/* 농지 대여 글쓰기 페이지로 이동 */
	@RequestMapping(value = "/rental/write", method = RequestMethod.GET)
	public String rentalWrite(Model model, SessionBean sessionBean) {
		sessionBean.setMemberNum(2); 					//임시로 정해놓음
		int member_num = sessionBean.getMemberNum();
		MemberDTO m =  RentalService.selectNameByPhone(member_num);

		model.addAttribute("name", m.getRealname());
		model.addAttribute("phone", m.getPhone());
		
		return "rental/rentalWrite";
	}
	
	@RequestMapping(value = "/rental/write_ok", method = RequestMethod.POST)
	public String rentalWrite_ok(
								 Model model,  
								 SessionBean sessionBean,
								 RentalDTO r,
								 FileDTO f) throws IllegalStateException, IOException {
		//int member_num = sessionBean.getMemberNum(); - 로그인 연결되면 이렇게 가져올 것
		sessionBean.setMemberNum(2); 					//임시로 정해놓음
		int member_num = sessionBean.getMemberNum();
		r.setMember_num(member_num);
		
		int board_num = RentalService.insertFarm(r);	//게시글 번호를 가져와서 지정
		f.setBoard_num(board_num);
		RentalService.insertFile(f);
		
		return "redirect:/rental";
	} 
	
	/* 농지 대여 상세보기 페이지로 이동 */
	@RequestMapping(value = "/rental/view", method = RequestMethod.GET)
	public String rentalView(Model model, SessionBean sessionBean, 	HttpServletRequest request) {
		sessionBean.setMemberNum(2); 					//임시로 정해놓음
		int member_num = sessionBean.getMemberNum();
		MemberDTO m =  RentalService.selectNameByPhone(member_num);
		
		int board_num = Integer.parseInt(request.getParameter("num"));
		RentalDTO r = RentalService.selectRentalView(board_num);
		
		FileDTO f = RentalService.selectFileNamePath(board_num);
		
		model.addAttribute("file", f);
		model.addAttribute("member", m);
		model.addAttribute("rental", r);
		return "rental/rentalView";
	}
	
	/* 마커 찍을 때 Ajax */
	@RequestMapping(value = "/markerJson", method = RequestMethod.POST)
	@ResponseBody
	public Object markerJson(Model model, SessionBean sessionBean) {
		List<RentalDTO> list = RentalService.selectRentalList();
		String[] imgs = RentalService.selectRepresentImg();
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setPath(imgs[i]);
		}
		
		return list;
	}
	
	/*
	//검색버튼 누르면 오는 곳
	@RequestMapping(value = "rental/search", method = RequestMethod.GET)
	public String rentalSearch(Locale locale, Model model) {
		return "rental/rentalWrite";
	}
	
	//글쓰기 페이지에서 등록 버튼 누르면 오는 곳 
	
	
	//삭제 버튼 누르면 오는 곳
	@RequestMapping(value = "rental/delete", method = RequestMethod.POST)
	public String rentalDelete(Locale locale, Model model) {
		return "rental/rentalWrite";
	}
	*/
}
