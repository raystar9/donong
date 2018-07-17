package team.swcome.donong.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import team.swcome.donong.dto.MarketDTO;
import team.swcome.donong.service.MarketService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MarketController {
	
	private static final Logger logger = LoggerFactory.getLogger(MarketController.class);
	@Autowired
	MarketService marketService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/market", method = RequestMethod.GET)
	public String home(Model model, @RequestParam(required = false, defaultValue = "seed") String category) {
		
		switch(category) {
		case "씨앗":
		case "비료":
			
		case "도구":
			logger.debug(category);
			
		}
		List<MarketDTO> items = new ArrayList<>();
		
		MarketDTO m1 = new MarketDTO();
		MarketDTO m2 = new MarketDTO();
		MarketDTO m3 = new MarketDTO();
		m1.setId(1);
		m2.setId(2);
		m3.setId(3);
		m1.setFilePath("/donong/resources/image/tool1.jpg");
		m2.setFilePath("/donong/resources/image/tool2.jpg");
		m3.setFilePath("/donong/resources/image/tool3.jpg");
		items.add(m1);
		items.add(m2);
		items.add(m3);
		
		
		model.addAttribute("items", items );
		model.addAttribute("page", marketService.getPaginationInfo(4));
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
	public String cart(Model model) {
		List<MarketDTO> items = new ArrayList<>();
		
		MarketDTO m1 = new MarketDTO();
		m1.setId(1);
		m1.setName("2");
		items.add(m1);
		model.addAttribute("items", items);
		
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
