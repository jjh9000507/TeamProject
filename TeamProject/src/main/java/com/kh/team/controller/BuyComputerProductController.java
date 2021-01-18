package com.kh.team.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	private int index_c = 0;
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
	public String sendProductInfoBought(SendProductBoughtInfoVo sendProductBoughtInfoVo,HttpSession session, RedirectAttributes rttr, HttpServletResponse response,HttpServletRequest request) throws Exception{
		System.out.println("sendProductBoughtInfoVo:" + sendProductBoughtInfoVo);		
		session.setAttribute("sendProductBoughtInfoVo", sendProductBoughtInfoVo);
		String productName = sendProductBoughtInfoVo.getProductName();
		System.out.println("productName:" + productName);
		Cookie[] cookieRequest = request.getCookies();
		
		int c_length = cookieRequest.length;
		System.out.println("c_length:" + c_length);
		
		for(int i=0; i<cookieRequest.length; i++){

			Cookie c = cookieRequest[i]; // 객체 생성

			String name = c.getName(); // 쿠키 이름 가져오기
			
			String value = c.getValue(); // 쿠키 값 가져오기
			System.out.println("cookie(name):" + name);
			System.out.println("cookie(name_length):" + name.length());
			System.out.println("cookie(value):" + value);
			System.out.println("cookie(value_length):" + value.length());
			if(name == null || name.equals("")) {
				System.out.println("cookie_null");
				Cookie cookiePNA = new Cookie("productAName", productName);
				
				cookiePNA.setMaxAge(3 * 60);
				cookiePNA.setPath("/");					
				
				response.addCookie(cookiePNA);
				
			}else if((name != null) && (!name.equals(""))) {
					System.out.println("compare_name:" + name);
					System.out.println("compare_length:" + name.length());
						if(!value.equals(productName)) {
							System.out.println("forIn(vlaue):" + value);
							System.out.println("forIn(productName):" + productName);
							System.out.println("cookie(add)");
							System.out.println("index_c_before:" + index_c);
							String productNameNewIndex = "product" + index_c + "Name"; 
							Cookie cookiePNA = new Cookie(productNameNewIndex, productName);
							System.out.println("index_c_after:" + index_c);
							cookiePNA.setMaxAge(3 * 60);
							cookiePNA.setPath("/");					
							
							response.addCookie(cookiePNA);
							
					}else if(value.equals(productName)) {
						System.out.println("초과" + i);
					}
					
				}
				
			}
			index_c++;
			System.out.println("index_c:" + index_c);
			if(index_c > 5) {
				System.out.println("index_c_over:" + index_c);
				System.out.println("초과");
				index_c = 0;
			}
		
		System.out.println("end");
		return "success";				
	}
	
	@RequestMapping(value="/insertProductRef", method=RequestMethod.POST)
	@ResponseBody
	public String insertProductRef(String productName, String m_id, String c_com_comment_content) throws Exception{
		System.out.println("productName:" + productName);
		System.out.println("m_id:" + m_id);
		System.out.println("c_com_comment_content:" + c_com_comment_content);
		buyComputerService.insertProductRef(productName, m_id, c_com_comment_content);
		return "success";				
	}
}
