package team.swcome.donong.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import team.swcome.donong.service.RentalService;


@Controller
public class RentalController {
	
	private static final Logger logger = LoggerFactory.getLogger(RentalController.class);
	@Autowired
	RentalService RentalService;
	
	
	/*@RequestMapping(value = "rental", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		RentalService.getMainList();
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		return "rental/home";
	}*/
	
	/* 농지 대여 목록 페이지로 이동 */
	@RequestMapping(value = "/rental", method = RequestMethod.GET)
	public String rentalList() {
		return "rental/rentalList";
	}
	
	/* 농지 대여 글쓰기 페이지로 이동 */
	@RequestMapping(value = "/rental/write", method = RequestMethod.GET)
	public String rentalWrite() {
		return "rental/rentalWrite";
	}
	
	@RequestMapping(value = "/rental/write_ok", method = RequestMethod.POST)
	public String rentalWrite_ok(Locale locale, Model model) {
		return "rental/rentalWrite";
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
