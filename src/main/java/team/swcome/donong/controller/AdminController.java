package team.swcome.donong.controller;

import java.net.URLDecoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import team.swcome.donong.service.AdminService;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminMain(Model model) {
		
		return "admin/main";
	}
	
	/*
	 * 마켓 관리 페이지
	 */
	@RequestMapping(value = "/admin/market", method = RequestMethod.GET)
	public String adminMarketMain(Model model) {
		
		return "admin/market";
	}
	
	@RequestMapping(value = "/admin/market/waiting", method = RequestMethod.GET)
	public String adminMarketWaitingData(Model model) {
		model.addAttribute("orderList", adminService.getWaitingItems(1));
		return "admin/market-waiting";
	}
	
	@RequestMapping(value = "/admin/market/preparing", method = RequestMethod.GET)
	public String adminMarketPreparingData(Model model) {		
		model.addAttribute("orderList", adminService.getPreparingItems(1));
		return "admin/market-preparing";
	}
	
	@RequestMapping(value = "/admin/market/sending", method = RequestMethod.GET)
	public String adminMarketSendingData(Model model) {
		
		return "admin/market-sending";
	}
	
	@RequestMapping(value = "/admin/market/arrived", method = RequestMethod.GET)
	public String adminMarketArrivedData(Model model) {
		
		return "admin/market-arrived";
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/market/preparing", method = RequestMethod.POST)
	public void adminMarketPreparingStatus(@RequestBody String nums) throws Exception{
		
		String res = URLDecoder.decode(nums, "utf-8");
		String[] list = res.split("&");
		int[] values = new int[list.length];
		for(int i = 0; i < list.length; i++) {
			values[i] = Integer.parseInt(list[i].split("=")[1]);			
			logger.debug("nums: {}", values[i]);
		}
		adminService.setStatusAsPreparing(values);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/market/sending", method = RequestMethod.PUT)
	public void adminMarketSendingStatus(Model model) {
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/market/arrived", method = RequestMethod.PUT)
	public void adminMarketArrivedStatus(Model model) {
	}
}
