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
import com.kh.team.domain.NonBuyer;
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
	
}
