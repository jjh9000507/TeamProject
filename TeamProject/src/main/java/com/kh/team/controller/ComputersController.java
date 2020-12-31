package com.kh.team.controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;

import com.kh.team.service.ComputersService;



@Controller
@RequestMapping("/computerProduct")
public class ComputersController {
	
	
	@Inject
	private ComputersService computersService;


	@RequestMapping(value="/computersForm", method=RequestMethod.POST)
	public String computersForm(@RequestParam(value="checkList[]") String[] checkList, String now_cate_no,  Model model) throws Exception {
		System.out.println("checkList.length:" + checkList.length);
		String cate_no_now = "";
		if(now_cate_no !=null) {
			cate_no_now = now_cate_no.substring(0, 3);
			System.out.println("cate_no_now:" + cate_no_now);
		}
			
        List<ComputerVo> computerList = computersService.listArray(checkList, cate_no_now);
        System.out.println("computerList:" + computerList);
        model.addAttribute("computerList", computerList);
		
		System.out.println("checkList[0].length():" + checkList[0].length());

		if(checkList.length <= 3) {
			List<CategoryVo> categoryInfo = computersService.categoryInfoArray(checkList, cate_no_now);
		System.out.println("categoryInfo:" + categoryInfo);
		
		model.addAttribute("categoryInfo", categoryInfo);
		}
		
		return "/computerProduct/computersForm";
	}
	
	
	
	@RequestMapping(value="/detailComputerProduct/{p_no}", method=RequestMethod.GET)
	public String detailComputerProduct(@PathVariable("p_no") int p_no, Model model) throws Exception {
		ComputerVo computerVo = computersService.detailComputerInfo(p_no);
		model.addAttribute("detailComputerVo", computerVo);
		return "/computerProduct/detailComputerForm";
	}
	
}
