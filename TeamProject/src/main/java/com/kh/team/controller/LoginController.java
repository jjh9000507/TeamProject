package com.kh.team.controller;



import javax.inject.Inject;



import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.MemberVo;

import com.kh.team.service.MemberService;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	private int CHANGE_PW_NUM = 1;

	
	
		
		
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	@ResponseBody
	public String changePw(String m_id, String m_pass_new) throws Exception {
		System.out.println("memberVo + m_id:"+ m_id);
		System.out.println("m_pass_new:"+ m_pass_new);
		
		
		int count = memberService.changePw(m_id, m_pass_new);
		System.out.println("changeCount:" + count);
		String result = "";
		if(count == CHANGE_PW_NUM) {
			result = "success";
					
		}else {
			result = "fail";
		}
		
		return result;	
		
		
	}
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(HttpSession session) throws Exception {	
		MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");
		if(memberVo != null) {
			System.out.println("로그인 되어있어서 main으로 돌아감");
			return "redirect:/";
		}
		
		return "loginForm";
	}

	@RequestMapping(value = "/nonBuyerRun", method = RequestMethod.GET)
	public String nonBuyerRun(HttpServletRequest request, HttpSession session) throws Exception {
		session.setAttribute("nonBuyer", "nonBuyer");
		request.setAttribute("msg", "nonBuyerLoginSuccess");
		return "/main";	
	}
	
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String m_id, String m_pass,String saveId,HttpSession session, HttpServletResponse response , RedirectAttributes rttr, HttpServletRequest request) throws Exception {	
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
			session.removeAttribute("nonBuyer");				
			page="redirect:/";
			
			rttr.addFlashAttribute("msg", "loginSuccess");
						
		}else {			
			page="redirect:/login/loginForm";
			rttr.addFlashAttribute("msg", "loginFail");
		}
		return page;
		}
	
	
	
}
