package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.AuctionImgVo;
import com.kh.team.domain.AuctionVo;
import com.kh.team.service.AuctionService;

@Controller
@RequestMapping(value="/auction")
public class AuctionController {

	@Inject
	private AuctionService auctionService;
	
	@RequestMapping(value="/auctionMain", method=RequestMethod.GET)
	public String getAcutionList() throws Exception{
		//System.out.println("acutionMain");
		
		return "auction/auctionMain";
	}
	
	@RequestMapping(value="/auctionResisterList", method=RequestMethod.GET)
	public String auctionResisterList(Model model) throws Exception{
		
		List<AuctionVo> list = auctionService.getAuctionList();
		model.addAttribute("list",list);
		//System.out.println("list:"+list);
		List<AuctionImgVo> imgList = auctionService.getAuctionImgMain();
		model.addAttribute("imgList", imgList);
		return "auction/auctionResisterList";
	}
	
	@RequestMapping(value="/auctionResister", method=RequestMethod.GET)
	public String auctionResister() throws Exception{
		return "auction/auctionResister";
	}
}
