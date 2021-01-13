package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.AuctionVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.service.PageService;

@Controller
@RequestMapping("/page")
public class PageController {
	
	@Inject
	PageService pageService;
	
	// 메인에서 더보기 버튼 
	@RequestMapping(value="/morePage" , method=RequestMethod.GET)
	@ResponseBody
	public List<ProductVo> moreList(int startNum) throws Exception {
		System.out.println("startNum : " + startNum);
		List<ProductVo> list = pageService.moreList(startNum);
//		System.out.println("list : " + list);
		return list;
	}
	
	// 검색 
	@RequestMapping(value="/search" , method=RequestMethod.GET)
	public String search(String searchName, Model model) throws Exception {
		System.out.println("searchName : " + searchName);
		List<ProductVo> list = pageService.search(searchName);
//		System.out.println("list : " + list);
		model.addAttribute("list" , list);
		model.addAttribute("searchName" , searchName);
		return "/searchForm";
	}
	
	// 내 주변 매물 찾기
	@RequestMapping(value="/mapSearch" , method=RequestMethod.GET)
	public String map(String roadAddress, Model model) throws Exception {
		System.out.println("roadAddress : " + roadAddress);
		List<AuctionAddressVo> list = pageService.addrList();
//		System.out.println("addr_list : " + list);
		model.addAttribute("roadAddress" , roadAddress);
		model.addAttribute("addr_list" , list);
		return "/map";
	}
	
	@RequestMapping(value="/content" , method=RequestMethod.GET)
	public String content(int p_no, Model model) throws Exception {
		
		//조회수 증가
		pageService.updateReadCount(p_no);
		
		// 글 데이터 받아오기
		ProductVo productVo = pageService.content(p_no);
		model.addAttribute("productVo" , productVo);
		return "/content";
	}
	
	@RequestMapping(value="/best" , method=RequestMethod.GET)
	public String best_item(Model model) throws Exception {
		List<ProductVo> list = pageService.best_item();
		model.addAttribute("list" , list);
		return "/sell/best";
	}
	
	@RequestMapping(value="/purchase", method=RequestMethod.GET)
	public String purchaseForm() throws Exception {
		
		return "/purchaseForm";
	}
	
} // main class
