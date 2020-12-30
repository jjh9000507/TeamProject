package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.ProductVo;
import com.kh.team.service.PageService;

@Controller
@RequestMapping("/page")
public class PageController {
	
	@Inject
	PageService pageService;
	
	@RequestMapping(value="/morePage" , method=RequestMethod.GET)
	@ResponseBody
	public List<ProductVo> moreList(int startNum) throws Exception {
		System.out.println("startNum : " + startNum);
		List<ProductVo> list = pageService.moreList(startNum);
//		System.out.println("list : " + list);
		return list;
	}
	
	@RequestMapping(value="/search" , method=RequestMethod.GET)
	public String search(String searchName, Model model) throws Exception {
		System.out.println("searchName : " + searchName);
		List<ProductVo> list = pageService.search(searchName);
		System.out.println("list : " + list);
		model.addAttribute("list" , list);
		return "/searchForm";
	}
} // main class
