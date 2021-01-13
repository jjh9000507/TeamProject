package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.ProductVo;
import com.kh.team.service.ClothesService;

@Controller
@RequestMapping("/clothes")
public class ClothesController {
	
	@Inject
	ClothesService clothesSerive;
	
	@RequestMapping(value="/101" , method=RequestMethod.GET)
	public String maleClothes(Model model) throws Exception {
		System.out.println("ok");
		
		List<ProductVo> list = clothesSerive.maleClothes_List();
		model.addAttribute("list" , list);
		
		return "/clothes/maleClothes";
	}
	
	@RequestMapping(value="/102" , method=RequestMethod.GET)
	public String feMaleClothes() throws Exception {
		System.out.println("ok");
		return "/clothes/feMaleClothes";
	}
	
	@RequestMapping(value="/103" , method=RequestMethod.GET)
	public String publicClothes() throws Exception {
		System.out.println("ok");
		return "/clothes/publicClothes";
	}
	
}
