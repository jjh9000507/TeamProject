package com.kh.team;


import java.util.Enumeration;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.MemberVo;
import com.kh.team.domain.NonBuyer;
import com.kh.team.service.MemberService;

@Controller
public class HomeController {
	
	@Inject
	private MemberService memberService;
	private int NON_BUYER_NUMBER = 1;
	MemberVo memberVo = new MemberVo();
	NonBuyer nonBuyer = new NonBuyer();


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		session.setAttribute("memberVo", memberVo);
		return "/main";
	}
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(HttpSession session) throws Exception {	
		 session.getAttribute("memberVo");
		 String session1 = session.toString();
		 System.out.println("session:" + session1);
		return "loginForm";
	}
	@RequestMapping(value = "/nonBuyerRun", method = RequestMethod.GET)
	public String nonBuyerRun(int non_buyer, RedirectAttributes rttr, HttpSession session ) throws Exception {
		System.out.println("non_buyer_num:" + non_buyer);
		if(non_buyer == NON_BUYER_NUMBER) {
			session.removeAttribute("memberVo");
			memberService.nonbuyerCreate();
			nonBuyer = memberService.nonbuyerLogin(non_buyer);
			System.out.println("nonBuyer:" + nonBuyer);
			session.setAttribute("nonBuyer", nonBuyer);			
		}
		return "/main";	
		
	public String loginForm() throws Exception {	
		return "/loginForm";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "/loginForm";
	}
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String m_id, String m_pass,String saveId, HttpSession session , HttpServletResponse response , RedirectAttributes rttr, HttpServletRequest request) throws Exception {	
		session.removeAttribute("nonBuyer");
		memberVo = memberService.login(m_id, m_pass);
	public String loginRun(String m_id, String m_pass,String saveId, HttpServletResponse response , HttpSession session, RedirectAttributes rttr, HttpServletRequest request) throws Exception {	
		MemberVo memberVo = memberService.login(m_id, m_pass);
//		System.out.println("memberVo: " + memberVo);
		String page ="";		
		if(memberVo != null) {
			Cookie cookie = new Cookie("saveId", m_id);
			if(saveId != null && !saveId.equals("")) {				
				cookie.setMaxAge(60 * 60 * 24 * 7);
			}else {
				cookie.setMaxAge(0);
			}
			response.addCookie(cookie);
			session.setAttribute("memberVo", memberVo);	
			request.setAttribute("msg", "loginSuccess");
			page="/main";			
		}else {			
			page="redirect:/loginForm";
			rttr.addFlashAttribute("msg", "loginFail");
		}
		return page;
		}
}
