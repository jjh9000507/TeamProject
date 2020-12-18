package com.kh.team;


import java.util.Locale;
import javax.inject.Inject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.MemberVo;
import com.kh.team.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	private MemberService memberService;
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "/main";
	}
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public void loginForm() throws Exception {	
		
	}
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String m_id, String m_pass,String saveId, HttpServletResponse response , HttpSession session, RedirectAttributes rttr, HttpServletRequest request) throws Exception {	
		MemberVo memberVo = memberService.login(m_id, m_pass);
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
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "/loginForm";
	}
}
