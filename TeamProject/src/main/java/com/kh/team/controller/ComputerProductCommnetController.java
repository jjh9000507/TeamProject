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
@RequestMapping("/computerProductComment")
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
	
	@RequestMapping(value="/deleteRef", method=RequestMethod.POST)
	public String deleteRef(int c_com_comment_no) throws Exception{
		System.out.println("c_com_comment_no:" + c_com_comment_no);
		computerCommentService.deleteComment(c_com_comment_no);
		return "success";		
	}
		
	@RequestMapping(value="/updateRefContent", method=RequestMethod.POST)
	public String updateRefContent(String c_com_comment_content, int c_com_comment_no) throws Exception{
		System.out.println("c_com_comment_content:" + c_com_comment_content);
		System.out.println("c_com_comment_no:" + c_com_comment_no);	
		int count = computerCommentService.changeCommentContent(c_com_comment_no, c_com_comment_content);
		System.out.println("count:" + count);
		return "success";		
	}
	
	@RequestMapping(value="/inquireShow/{p_no}", method=RequestMethod.GET)
	public List<ProductExplainVo> inquireShow(@PathVariable("p_no") int p_no) throws Exception{
		System.out.println("inquireShow + p_no:" + p_no);
		List<ProductExplainVo> list = computerCommentService.getInquireList(p_no);
		return list;
	}

}
