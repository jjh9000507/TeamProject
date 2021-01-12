package com.kh.team.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.BuyComputerVo;
import com.kh.team.domain.CartVo;
import com.kh.team.service.BuyComputerService;

@Controller
@RequestMapping("/buyComputerProduct")
public class BuyComputerProductController {
	
	private int CHECK_FOR_INDEX = 1;
	
	@Inject
	private BuyComputerService buyComputerService;

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
		
		int count = buyComputerService.getPurchasePercentage(buyComputerVo, purchase_num_plus);
		String view = "";
		if(count == CHECK_FOR_INDEX) {
			view = "success";
		}else {
			view = "fail";
		}
		return view;		
	}
}
