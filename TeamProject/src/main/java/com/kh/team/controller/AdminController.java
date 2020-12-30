package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.MemberVo;
import com.kh.team.domain.SanctionVo;
import com.kh.team.service.MemberService;
import com.kh.team.service.SanctionService;
import com.kh.team.service.SellProductService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	private SellProductService sellProductService;
	
	@Inject
	private SanctionService sanctionService;
	
	private MemberService memberService;

	//관리자 시작페이지로 이동
	@RequestMapping(value="/adminForm", method=RequestMethod.GET)
	public String adminForm() throws Exception {
		
		return "/admin/adminform";
	}
	
	//관리자 회원관리 페이지로 이동
	@RequestMapping(value="/adminMember", method=RequestMethod.GET)
	public String adminMember() throws Exception {
		
		return "/admin/admin_member";
	}
	
	//관리자 카테고리 관리페이지로 이동
	@RequestMapping(value="/adminCategory", method=RequestMethod.GET)
	public String adminCategory() throws Exception {
		
		return "/admin/admin_category";
	}
	
	//관리자 게시물 관리 페이지
	@RequestMapping(value="/adminDetail", method=RequestMethod.GET)
	public String adminDetail() throws Exception {
		
		return "/admin/admin_detailpage";
	}
	
	//관리자 회원관리-회원관리 페이지
	@RequestMapping(value="/adminMemberCon", method=RequestMethod.GET)
	public String adminMemberCon(Model model) throws Exception {
		List<MemberVo> memberList = memberService.adminMemberSearch();
		System.out.println("memberList" + memberList);
//		model.addAttribute("memberList", memberList);
		return "/admin/a_m_con";
	}
	
	//관리자 회원관리 - 판매자 정보 관리 페이지
	@RequestMapping(value="/adminMemberSellCon", method=RequestMethod.GET)
	public String adminMemberSellCon(Model model) throws Exception {
		List<SanctionVo> sancList = sanctionService.sancList();
		List<MemberVo> sellerList = sellProductService.sellerList();
		model.addAttribute("sellerList", sellerList);
		model.addAttribute("sancList", sancList);
		return "/admin/a_m_seller";
	}
	
	//관리자페이지 판매자 권한 삭제
	@RequestMapping(value="/adminRollbackSeller/{m_id}", method=RequestMethod.GET)
	public String adminRollbackSeller(@PathVariable("m_id") String m_id, Model model) throws Exception {
		System.out.println("m_id: " + m_id);
		sellProductService.rollbackSeller(m_id);
		SanctionVo sanctionVo = sanctionService.searchSanc(m_id);
		if(sanctionVo == null) {
			sanctionService.newSanc(m_id);
		} else {
			sanctionService.sancUpdate(m_id);
		}
		List<MemberVo> sellerList = sellProductService.sellerList();
		model.addAttribute("sellerList", sellerList);
		return "/admin/a_m_seller";
	}
	
	//관리자페이지 회원 강제탈퇴
	@RequestMapping(value="/adminMemberDelete/{m_id}", method=RequestMethod.GET)
	public String adminMemberDelete(@PathVariable("m_id") String m_id, Model model) throws Exception{
		memberService.adminMemberDelete(m_id);
		List<MemberVo> memberList = memberService.adminMemberSearch();
		model.addAttribute("memberList", memberList);
		return "/admin.a_m_con";
	}
}
