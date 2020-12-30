package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/clothes")
public class ClothesController {
	
	@RequestMapping(value="/maleClothes" , method=RequestMethod.GET)
	public String maleClothes() throws Exception {
		System.out.println("ok");
		return "/clothes/manClothes";
	}
	
	@RequestMapping(value="/feMaleClothes" , method=RequestMethod.GET)
	public String feMaleClothes() throws Exception {
		System.out.println("ok");
		return "/clothes/feMaleClothes";
	}
	
	@RequestMapping(value="/publicClothes" , method=RequestMethod.GET)
	public String publicClothes() throws Exception {
		System.out.println("ok");
		return "/clothes/publicClothes";
	}

}
