package com.kh.team.controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;

import com.kh.team.service.ComputersService;



@Controller
@RequestMapping("/computerProduct")
public class ComputersController {
	
	
	@Inject
	private ComputersService computersService;
	
	@RequestMapping(value="/computersForm/{cate_no}", method=RequestMethod.GET)
	public String computersForm(@PathVariable("cate_no") String cate_no, Model model) throws Exception {
		System.out.println("cate_no:" + cate_no);		
		List<ComputerVo> computerList = computersService.list(cate_no);
		List<CategoryVo> categoryInfo = computersService.categoryInfo(cate_no);
		System.out.println("computerList:" + computerList);
		System.out.println("categoryInfo:" + categoryInfo);
		model.addAttribute("computerList", computerList);
		model.addAttribute("categoryInfo", categoryInfo);
		return "/computerProduct/computersForm";
	}
//	@RequestParam(value="checkList[]") String[] checkList

	@RequestMapping(value="/computersFormCheck", method=RequestMethod.POST)
	public String computersFormCheck(String ano,String bno ,String cno,String dno,String eno,String fno, Model model) throws Exception {
		if(ano != null) {
		System.out.println("ano_check:"+ ano);
		}
		if(bno != null) {
		System.out.println("bno_check:"+ bno);
		}
		if(cno != null) {
		System.out.println("cno_check:"+ cno);
		}
		if(dno != null) {
		System.out.println("dno_check:"+ dno);
		}
		if(eno != null) {
		System.out.println("eno_check:"+ eno);
		}
		if(fno != null) {
		System.out.println("fno_check:"+ fno);
		}
		
//		List<CategoryVo> categoryInfo = computersService.categoryInfoArray(checkList);
//		Model category = model.addAttribute("categoryInfo", categoryInfo);
//		System.out.println("categoryModel:" + category);
//		List<ComputerVo> computerList = computersService.listArray(checkList);
//        System.out.println("computerList:" + computerList);
//		model.addAttribute("computerList", computerList);
//		model.addAttribute("categoryInfo", categoryInfo);
		return "/computerProduct/computersForm";
	}	
	
	
	@RequestMapping(value="/detailComputerProduct/{p_no}", method=RequestMethod.GET)
	public String detailComputerProduct(@PathVariable("p_no") int p_no, Model model) throws Exception {
		ComputerVo computerVo = computersService.detailComputerInfo(p_no);
		model.addAttribute("detailComputerVo", computerVo);
		return "/computerProduct/detailComputerForm";
	}
	
}
