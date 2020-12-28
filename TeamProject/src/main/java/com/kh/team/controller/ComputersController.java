package com.kh.team.controller;
import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;

import com.kh.team.service.ComputersService;



@Controller
@RequestMapping("/computerProduct")
public class ComputersController {
	
	@Inject
	private ComputersService computersService;

	@RequestMapping(value="/computersForm/{cate_no}", method=RequestMethod.GET)
	public String whitegoodsform(@PathVariable("cate_no") String cate_no, Model model) throws Exception {
		System.out.println("cate_no:" + cate_no);		
		List<ComputerVo> computerList = computersService.list(cate_no);
		List<CategoryVo> categoryInfo = computersService.categoryInfo(cate_no);
		System.out.println("computerList:" + computerList);
		System.out.println("categoryInfo:" + categoryInfo);
		model.addAttribute("computerList", computerList);
		model.addAttribute("categoryInfo", categoryInfo);
		return "/computerProduct/computersForm";
	}
	@RequestMapping(value="/detailComputerProduct/{p_no}", method=RequestMethod.GET)
	public String detailWhiteGoods(@PathVariable("p_no") int p_no, Model model) throws Exception {
		ComputerVo computerVo = computersService.detailComputerInfo(p_no);
		model.addAttribute("detailComputerVo", computerVo);
		return "/computerProduct/detailComputerForm";
	}
	
}
