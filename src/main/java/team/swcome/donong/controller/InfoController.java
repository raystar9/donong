package team.swcome.donong.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class InfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/info_start_1", "/info"}, method = RequestMethod.GET)
	public String info1(Model model) {
		return "info/info_start_1";
	}
	@RequestMapping(value = "/info_start_2", method = RequestMethod.GET)
	public String info2(Model model) {
		
		return "info/info_start_2";
	}@RequestMapping(value = "/info_start_3", method = RequestMethod.GET)
	public String info3(Model model) {
		
		return "info/info_start_3";
	}@RequestMapping(value = "/info_start_4", method = RequestMethod.GET)
	public String info4( Model model) {
		
		return "info/info_start_4";
	}@RequestMapping(value = "/info_start_5", method = RequestMethod.GET)
	public String info5( Model model) {
		
		return "info/info_start_5";
	}@RequestMapping(value = "/info_farming_1", method = RequestMethod.GET)
	public String farm1(Model model) {
		
		return "info/info_farming_1";
	}@RequestMapping(value = "/info_farming_2", method = RequestMethod.GET)
	public String farm2(Model model) {
		
		return "info/info_farming_2";
	}@RequestMapping(value = "/info_farming_3", method = RequestMethod.GET)
	public String farm3(Model model) {
		
		return "info/info_farming_3";
	}@RequestMapping(value = "/info_farming_4", method = RequestMethod.GET)
	public String farm4(Model model) {
		
		return "info/info_farming_4";
	}@RequestMapping(value = "/info_farming_5", method = RequestMethod.GET)
	public String farm5(Model model) {
		
		return "info/info_farming_5";
	}@RequestMapping(value = "/info_farming_6", method = RequestMethod.GET)
	public String farm6(Model model) {
		
		return "info/info_farming_6";
	}@RequestMapping(value = "/info_farming_7", method = RequestMethod.GET)
	public String farm7(Model model) {
		
		return "info/info_farming_7";
	}@RequestMapping(value = "/info_farming_8", method = RequestMethod.GET)
	public String farm8(Model model) {
		
		return "info/info_farming_8";
	}@RequestMapping(value = "/info_start_1_2", method = RequestMethod.GET)
	public String info_2(Model model) {
		
		return "info/info_start_1_2";
	}@RequestMapping(value = "/info_start_1_3", method = RequestMethod.GET)
	public String info_3(Model model) {
		
		return "info/info_start_1_3";
	}@RequestMapping(value = "/info_start_1_4", method = RequestMethod.GET)
	public String info_4(Model model) {
		
		return "info/info_start_1_4";
	}@RequestMapping(value = "/info_start_2_2", method = RequestMethod.GET)
	public String info2_2(Model model) {
		
		return "info/info_start_2_2";
	}@RequestMapping(value = "/info_start_2_3", method = RequestMethod.GET)
	public String info2_3(Model model) {
		
		return "info/info_start_2_3";
	}@RequestMapping(value = "/info_start_2_4", method = RequestMethod.GET)
	public String info2_4(Model model) {
		
		return "info/info_start_2_4";
	}@RequestMapping(value = "/info_start_2_5", method = RequestMethod.GET)
	public String info2_5(Model model) {
		
		return "info/info_start_2_5";
	}
	
}
