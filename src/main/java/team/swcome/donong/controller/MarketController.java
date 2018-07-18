package team.swcome.donong.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.swcome.donong.dto.SessionBean;
import team.swcome.donong.service.MarketService;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("sessionBean")
public class MarketController {
	
	private static final Logger logger = LoggerFactory.getLogger(MarketController.class);
	@Autowired
	MarketService marketService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/market", method = RequestMethod.GET)
	public String home(Model model, @RequestParam(required = false, defaultValue = "seed") String category,
			@RequestParam(required = false, defaultValue = "1") int page, SessionBean sessionBean) {
		if(sessionBean.getMemberNum() == 0) {
			sessionBean.setMemberNum(1);
			sessionBean.setNickname("raystar9");
		}
		
		switch(category) {
		case "씨앗":
		case "비료":
			
		case "도구":
			logger.debug(category);
		}
		
		model.addAttribute("items", marketService.getMainList(page) );
		model.addAttribute("page", marketService.getPaginationInfo(page));
		return "market/list";
	}
	
	@RequestMapping(value = "/market/item/{itemNo}", method = RequestMethod.GET)
	public String itemDetail(Model model, @PathVariable String itemNo) {
		model.addAttribute("itemNo", itemNo);
		return "market/item-detail";
	}
	
	@RequestMapping(value = "/market/payment", method = RequestMethod.GET)
	public String payment(Model model) {
		return "market/payment";
	}
	
	@RequestMapping(value = "/market/cart", method = RequestMethod.GET)
	public String cart(Model model, SessionBean sessionBean) {
		model.addAttribute("items", marketService.getCartItems(sessionBean.getMemberNum()));
		return "market/cart";
	}
	
	@RequestMapping(value = "market/cart/{itemNo}")
	public String putIntoCart(Model model) {
		return "redirect:/market/cart/confirm";
	}
	
	@RequestMapping(value = "/market/cart/confirm", method = RequestMethod.GET)
	public String cartConfirm(Model model) {
		return "market/cart-confirm";
	}
	
	@RequestMapping(value = "/market/payment/process", method = RequestMethod.POST)
	public String paymentProcess(Model model) {
		return "redirect:/market/payment/confirm";
	}
	
	@RequestMapping(value = "/market/payment/confirm", method = RequestMethod.GET)
	public String paymentConfirm(Model model) {
		return "market/confirm";
	}
}
