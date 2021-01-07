package com.kh.team.controller;



import java.util.List;


import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.team.domain.ComputerCommentVo;
import com.kh.team.domain.ProductExplainVo;
import com.kh.team.service.ComputerCommentService;



@RestController
@RequestMapping("/computerProduct")
public class ComputerProductCommnetController {
	
	//인젝
	@Inject
	private ComputerCommentService computerCommentService;
	
	@RequestMapping(value="/commentShow", method=RequestMethod.POST)
	public List<ComputerCommentVo> commentShow(int p_no) throws Exception{
		System.out.println("commentShow + p_no:" + p_no);
		List<ComputerCommentVo> list = computerCommentService.getCommentList(p_no);
		return list;
	}
	
	@RequestMapping(value="/inquireShow/{p_no}", method=RequestMethod.GET)
	public List<ProductExplainVo> inquireShow(@PathVariable("p_no") int p_no) throws Exception{
		System.out.println("inquireShow + p_no:" + p_no);
		List<ProductExplainVo> list = computerCommentService.getInquireList(p_no);
		return list;
	}

}
