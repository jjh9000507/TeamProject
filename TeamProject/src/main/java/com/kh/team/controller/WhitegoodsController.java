package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.WhitegoodsVo;
import com.kh.team.service.WhitegoodsService;

@Controller
@RequestMapping("/whitegoods")
public class WhitegoodsController {

	@Inject
	private WhitegoodsService whiteGoodsService;
	
	@RequestMapping(value="/whitegoodsform/{cate_no}", method=RequestMethod.GET)
	public String whitegoodsform(@PathVariable("cate_no") String cate_no, Model model) throws Exception {
//		System.out.println("cate_no: " + cate_no);
		List<WhitegoodsVo> getWhitegoodsList = whiteGoodsService.getWhiteGoodsList(cate_no);
		List<CategoryVo> getCategoryList = whiteGoodsService.getCategoryList(cate_no);
//		System.out.println("getWhitegoodsList" + getWhitegoodsList);
//		System.out.println("getCategoryList:" + getCategoryList);
		model.addAttribute("getWhitegoodsList", getWhitegoodsList);
		model.addAttribute("getCategoryList", getCategoryList);
		return "/whitegoods/whitegoodsform";
	}
	
	@RequestMapping(value="/detailWhiteGoods/{p_no}", method=RequestMethod.GET)
	public String detailWhiteGoods(@PathVariable("p_no") int p_no, Model model) throws Exception {
		WhitegoodsVo detailwhitegoodsVo= whiteGoodsService.detailWhitegoods(p_no);
//		System.out.println("detailwhitegoodsVo: " + detailwhitegoodsVo);
		model.addAttribute("detailwhitegoodsVo", detailwhitegoodsVo);
		return "/whitegoods/detailwhitegoods";
	}
	
	@RequestMapping(value="/sellWhiteGoods", method=RequestMethod.GET)
	public String sellWhiteGoods() throws Exception {
		return "/sell/sellproduct";
	}
	
	@RequestMapping(value="/sellWhiteGoodsUpload", method=RequestMethod.GET)
	public String sellWhiteGoodsUpload(WhitegoodsVo whitegoodsVo, HttpSession session) throws Exception {
		System.out.println("whitegoodsVo1: " + whitegoodsVo);
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		whitegoodsVo.setP_seller(memberVo.getM_id());
		
		if(whitegoodsVo.getP_thumbimg() == null) {
			whitegoodsVo.setP_thumbimg("0.png");
		}
		
		System.out.println("whitegoodsVo2: " + whitegoodsVo);
		
//		whiteGoodsService.insertWhiteGoods(whitegoodsVo);
		return "/main";
	}
}