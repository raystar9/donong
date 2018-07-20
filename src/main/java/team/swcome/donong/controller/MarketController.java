package team.swcome.donong.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.swcome.donong.dto.GoodsDTO;
import team.swcome.donong.dto.MemberDTO;
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
	public String itemDetail(Model model, @PathVariable int itemNo) {
		model.addAttribute("itemNo", itemNo);
		model.addAttribute("item", marketService.getItemByItemNum(itemNo));
		return "market/item-detail";
	}
	
	@RequestMapping(value = "/market/order/item/{itemNo}", method = RequestMethod.GET)
	public String orderByItemNum(Model model, @PathVariable int itemNo, @RequestParam int quantity, SessionBean session) {
		GoodsDTO item = marketService.getItemByItemNum(itemNo);
		item.setQuantity(quantity);
		model.addAttribute("member", marketService.getMemberDetails(session.getMemberNum()));
		orderOne(model, item);
		return "market/order";
	}
	
	@RequestMapping(value = "/market/order/cart", method = RequestMethod.GET)
	public String orderByCart(Model model, SessionBean session) {
		List<GoodsDTO> items = marketService.getCartItems(session.getMemberNum());
		model.addAttribute("member", marketService.getMemberDetails(session.getMemberNum()));		
		if(items.size() == 0) {			
			return "market/order";
		} else if(items.size() == 1){
			orderOne(model, items.get(0));
		} else {		
			model.addAttribute("repItemTitle", items.get(0).getTitle());
			model.addAttribute("itemCount", items.size());
			model.addAttribute("totalPrice", marketService.getTotalPrice(items));
		}
		return "market/order";
	}
	
	public void orderOne(Model model, GoodsDTO item) {
		model.addAttribute("item", item);
		model.addAttribute("repItemTitle", item.getTitle());
		model.addAttribute("itemCount", 1);
		model.addAttribute("totalPrice", item.getPrice() * item.getQuantity());
	}
	
	@RequestMapping(value = "/market/cart", method = RequestMethod.GET)
	public String cart(Model model, SessionBean sessionBean) {
		List<GoodsDTO> items = marketService.getCartItems(sessionBean.getMemberNum());
		model.addAttribute("items", items);
		model.addAttribute("totalPrice", marketService.getTotalPrice(items));
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
	
	@RequestMapping(value = "/market/order/process", method = RequestMethod.POST)
	public String paymentProcess(Model model) {
		return "redirect:/market/order/confirm";
	}
	
	@RequestMapping(value = "/market/order/confirm", method = RequestMethod.GET)
	public String paymentConfirm(Model model) {
		return "market/confirm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/donong/ajax", method = RequestMethod.GET)
	public MemberDTO ajax(Model model) {
		return marketService.getMemberDetails(1);
	}
}
