package com.kh.team.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.BuyComputerVo;

@Controller
@RequestMapping("/buyComputerProduct")
public class BuyComputerProductController {

	@RequestMapping(value="/openBuyComputerProductDetail", method=RequestMethod.POST)
	public String openBuyComputerProductDetail(BuyComputerVo buyComputerVo, HttpServletRequest request) throws Exception{
		System.out.println("/openBuyComputerProductDetail");
		System.out.println("buyComputerVo:" + buyComputerVo);
		
		request.setAttribute("buyComputerInfo", buyComputerVo);	
		return "/computerProduct/buyComputerProductDetail";				
	}
}
