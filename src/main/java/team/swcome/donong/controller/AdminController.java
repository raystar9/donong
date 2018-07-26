package team.swcome.donong.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(DefaultController.class);
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminMain(Model model) {
		
		return "admin/main";
	}
}
