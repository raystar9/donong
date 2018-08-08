package team.swcome.donong.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.swcome.donong.dto.CartDTO;
import team.swcome.donong.dto.CartGoodsDTO;
import team.swcome.donong.dto.GoodsDTO;
import team.swcome.donong.dto.OrdersDTO;
import team.swcome.donong.dto.SessionBean;
import team.swcome.donong.service.MarketService;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes("sessionBean")
@Controller
public class MarketController {
	
	private static final Logger logger = LoggerFactory.getLogger(MarketController.class);
	@Autowired
	MarketService marketService;
	/*
	 * 상품 정보 관련 페이지
	 */
	@RequestMapping(value = "/market", method = RequestMethod.GET)
	public String home(Model model, @RequestParam(required = false, defaultValue = "seed") String category,
			@RequestParam(required = false, defaultValue = "1") int page, SessionBean sessionBean) {
		
		marketService.getOrderListByMemberNum(sessionBean.getMemberNum());
		
		model.addAttribute("items", marketService.getGoodsList(page, category) );
		model.addAttribute("page", marketService.getPaginationInfo(page, category));
		return "market/list";
	}
	
	@RequestMapping(value = "/market/item/{itemNo}", method = RequestMethod.GET)
	public String itemDetail(Model model, @PathVariable int itemNo, SessionBean session) {
		GoodsDTO item = marketService.getItemByItemNum(itemNo);
		model.addAttribute("itemNo", itemNo);
		model.addAttribute("item", item);
		return "market/item-detail";
	}
	
	/*
	 * 주문 관련 페이지
	 */
	@RequestMapping(value = "/market/order/item/{itemNo}", method = RequestMethod.GET)
	public String orderByItemNum(Model model, @PathVariable int itemNo, @RequestParam int quantity, SessionBean session) {
		CartGoodsDTO item = (CartGoodsDTO) marketService.getItemByItemNum(itemNo);
		item.setQuantity(quantity);
		model.addAttribute("member", marketService.getMemberDetails(session.getMemberNum()));
		orderOne(model, item);
		return "market/order";
	}
	
	@RequestMapping(value = "/market/order/cart", method = RequestMethod.GET)
	public String orderByCart(Model model, SessionBean session) {
		List<CartGoodsDTO> items = marketService.getCartItems(session.getMemberNum());
		model.addAttribute("member", marketService.getMemberDetails(session.getMemberNum()));	
		model.addAttribute("isCart", true);
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
	
	public void orderOne(Model model, CartGoodsDTO item) {
		model.addAttribute("item", item);
		model.addAttribute("repItemTitle", item.getTitle());
		model.addAttribute("itemCount", 1);
		model.addAttribute("totalPrice", item.getPrice() * item.getQuantity());
	}
	
	@RequestMapping(value = "/market/order/process", method = RequestMethod.POST)
	public String paymentProcess(Model model, OrdersDTO order, @RequestParam("addressdetail") String addressDetail,
			@RequestParam(required=false) Integer goodsNum, @RequestParam(required=false) Integer goodsQuantity, SessionBean session) {
		
		order.setAddress(order.getAddress() + " " + addressDetail);
		order.setNum(3);
		order.setMemberNum(session.getMemberNum());
		if(goodsNum == null) {
			marketService.insertOrder(order, marketService.getCartItems(session.getMemberNum()));
		} else {
			marketService.insertOrder(order, goodsNum, goodsQuantity);
		}
		return "redirect:/market/order/confirm";
	}
	
	@RequestMapping(value = "/market/order/confirm", method = RequestMethod.GET)
	public String paymentConfirm(Model model, SessionBean session) {
		logger.debug("address : 	{}", marketService.getOrderListByMemberNum(session.getMemberNum()).get(1).getAddress());
		return "market/confirm";
	}
	/*
	 * 장바구니 관련 페이지
	 */
	@RequestMapping(value = "/market/cart", method = RequestMethod.GET)
	public String cart(Model model, SessionBean sessionBean) {
		List<CartGoodsDTO> items = marketService.getCartItems(sessionBean.getMemberNum());
		model.addAttribute("items", items);
		model.addAttribute("totalPrice", marketService.getTotalPrice(items));
		return "market/cart";
	}
	
	@RequestMapping(value = "market/cart/{itemNo}", method = RequestMethod.POST)
	public String putIntoCart(Model model, CartDTO cart) {
		marketService.insertCartItem(cart);
		return "redirect:/market/cart/confirm";
	}
	
	@RequestMapping(value = "/market/cart/confirm", method = RequestMethod.GET)
	public String cartConfirm(Model model) {
		return "market/cart-confirm";
	}
	
	@RequestMapping(value = "/market/cart/{cartNum}", method = RequestMethod.PUT)
	@ResponseBody
	public int cartUpdate(Model model, @PathVariable int cartNum, @RequestBody String quantity, SessionBean session) {
		marketService.updateCartQuantity(cartNum, Integer.parseInt(quantity));
		return marketService.getTotalPrice(marketService.getCartItems(session.getMemberNum()));
	}
	
	@RequestMapping(value = "/market/cart/{cartNum}", method = RequestMethod.DELETE)
	@ResponseBody
	public int cartDelete(Model model, @PathVariable int cartNum, SessionBean session) {
		marketService.deleteCartItem(cartNum);
		return marketService.getTotalPrice(marketService.getCartItems(session.getMemberNum()));
	}
	
}
