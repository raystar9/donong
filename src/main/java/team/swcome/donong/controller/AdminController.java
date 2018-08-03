package team.swcome.donong.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import team.swcome.donong.dto.GoodsDTO;
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

	//TODO 페이지 처리 해야함
	@RequestMapping(value = "/admin/market/waiting", method = RequestMethod.GET)
	public String adminMarketWaitingData(Model model) {
		model.addAttribute("orderList", adminService.getWaitingOrders(1));
		return "admin/market-waiting";
	}

	@RequestMapping(value = "/admin/market/preparing", method = RequestMethod.GET)
	public String adminMarketPreparingData(Model model) {
		model.addAttribute("orderList", adminService.getPreparingOrders(1));
		return "admin/market-preparing";
	}

	@RequestMapping(value = "/admin/market/sending", method = RequestMethod.GET)
	public String adminMarketSendingData(Model model) {
		model.addAttribute("orderList", adminService.getSendingOrders(1));
		return "admin/market-sending";
	}

	@RequestMapping(value = "/admin/market/arrived", method = RequestMethod.GET)
	public String adminMarketArrivedData(Model model) {
		model.addAttribute("orderList", adminService.getArrivedOrders(1));
		return "admin/market-arrived";
	}
	
	/*@ResponseBody
	@RequestMapping(value = "/admin/market/items", method = RequestMethod.GET)
	public List<List<GoodsDTO>> adminMarketGetOrderItems() {
		
	}*/

	@ResponseBody
	@RequestMapping(value = "/admin/market/preparing", method = RequestMethod.PUT)
	public void adminMarketPreparingStatus(@RequestBody String queryString) throws Exception {
		adminService.setStatusAsPreparing(adminService.getOrderNumList(queryString));
	}

	@ResponseBody
	@RequestMapping(value = "/admin/market/sending", method = RequestMethod.PUT)
	public void adminMarketSendingStatus(@RequestBody String queryString) throws Exception {
		int[] nums = adminService.getOrderNumList(queryString);
		adminService.setStatusAsSending(nums, adminService.getWaybillList(queryString, nums));
	}

	@ResponseBody
	@RequestMapping(value = "/admin/market/arrived", method = RequestMethod.PUT)
	public void adminMarketArrivedStatus(@RequestBody String nums) throws Exception {
		adminService.setStatusAsArrived(adminService.getOrderNumList(nums));
	}

}
