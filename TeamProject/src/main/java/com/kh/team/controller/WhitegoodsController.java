package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.WhitegoodsVo;
import com.kh.team.service.WhitegoodsService;

@Controller
@RequestMapping("/whitegoods")
public class WhitegoodsController {
	
	@Inject
	private WhitegoodsService whitegoodsService;
	
	@RequestMapping(value="/whitegoodsPage/{w_cate_no}", method=RequestMethod.GET)
	public String WhitegoodsPage(@PathVariable("w_cate_no") String w_cate_no, Model model) throws Exception {
		List<WhitegoodsVo> getWhitegoodsList = whitegoodsService.getWhitegoodsList(w_cate_no);
		List<CategoryVo> getCategoryList = whitegoodsService.getCategoryList(w_cate_no);
//		System.out.println("whitegoodsList: " + getWhitegoodsList);
//		System.out.println("CategoryList: " + getCategoryList);
		model.addAttribute("WhitegoodsList", getWhitegoodsList);
		model.addAttribute("categoryList", getCategoryList);
		return "/whitegoods/whitegoodsList";
	}
	
	@RequestMapping(value="/detailWhitegoods/{w_no}", method=RequestMethod.GET)
	public String detailWhitegoods(@PathVariable("w_no") int w_no, Model model) throws Exception {
		WhitegoodsVo whitegoodsVo = whitegoodsService.detailWhitegoods(w_no);
		model.addAttribute("whitegoodsVo", whitegoodsVo);
		return "/whitegoods/detailwhitegoods";
	}
	
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public String detailWhitegoods() throws Exception {
		
		return "/";
	}
	
	@RequestMapping(value="/getCategoryList", method=RequestMethod.GET)
	@ResponseBody
	public List<CategoryVo> getCategoryList(String cate_no) throws Exception {
		List<CategoryVo> cate_list = whitegoodsService.getCategoryList(cate_no);
		System.out.println(cate_list);
		return cate_list;
	}
}