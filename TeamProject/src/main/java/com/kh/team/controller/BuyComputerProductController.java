package com.kh.team.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.BuyComputerVo;
import com.kh.team.domain.CartVo;
import com.kh.team.domain.SendProductBoughtInfoVo;
import com.kh.team.service.BuyComputerService;
import com.kh.team.service.MemberService;

@Controller
@RequestMapping("/buyComputerProduct")
public class BuyComputerProductController {
	
	private int CHECK_FOR_INDEX = 1;
	
	@Inject
	private BuyComputerService buyComputerService;

	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="/openBuyComputerProductDetail", method=RequestMethod.POST)
	public String openBuyComputerProductDetail(BuyComputerVo buyComputerVo, HttpServletRequest request) throws Exception{
		System.out.println("/openBuyComputerProductDetail");
		System.out.println("buyComputerVo:" + buyComputerVo);
		
		request.setAttribute("buyComputerInfo", buyComputerVo);	
		return "/computerProduct/buyComputerProductDetail";				
	}
	
	@RequestMapping(value="/putBasketProduct", method=RequestMethod.POST)
	@ResponseBody
	public String putBasketProduct(CartVo cartVo) throws Exception{
		System.out.println("/putBasketProduct");
		System.out.println("cartVo:" + cartVo);
		buyComputerService.putBasketCategory(cartVo);		
		
		return "success";				
	}
	
	@RequestMapping(value="/sendForGetPurchasePercentage", method=RequestMethod.POST)
	@ResponseBody
	public String sendForGetPurchasePercentage(BuyComputerVo buyComputerVo) throws Exception{
		System.out.println("buyComputerVo:" + buyComputerVo);
		int purchase_num_plus = buyComputerVo.getProductNum();
		
		String nok = "nok";
		
		int count = buyComputerService.getPurchasePercentage(buyComputerVo, purchase_num_plus, nok);
		String view = "";
		if(count == CHECK_FOR_INDEX) {
			view = "success";
		}else {
			view = "fail";
		}
		return view;		
	}
	
	@RequestMapping(value="/changeBuyerName", method=RequestMethod.POST)
	@ResponseBody
	public String changeBuyerName(String buyerName, String m_id, String m_pass) throws Exception{
		System.out.println("buyerName:" + buyerName);
		System.out.println("m_id_buy_form:" + m_id);
		System.out.println("m_pass_confirm:" + m_pass);
		
		int count = memberService.changeNameByCallProduct(buyerName, m_id, m_pass);
		
		String resultValue = "";
		
		if(count == CHECK_FOR_INDEX) {
			resultValue = "success";
		}else {
			resultValue = "fail";
		}
		
		return resultValue;		
	}
	
	@RequestMapping(value="/sendProductInfoBought", method=RequestMethod.POST)
	@ResponseBody
	public String sendProductInfoBought(SendProductBoughtInfoVo sendProductBoughtInfoVo,HttpSession session, RedirectAttributes rttr) throws Exception{
		System.out.println("sendProductBoughtInfoVo:" + sendProductBoughtInfoVo);		
		session.setAttribute("sendProductBoughtInfoVo", sendProductBoughtInfoVo);
		
		System.out.println("end");
		return "success";				
	}
}
