package com.kh.team;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.CategoryVo;
import com.kh.team.service.AdminService;
import com.kh.team.service.PageService;


@Controller
public class HomeController {	

	@Inject
	PageService pageService;
	
	@Inject
	AdminService adminService;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, HttpSession session) throws Exception {
		
		List<CategoryVo> firstCategory = adminService.firstCategoryList();
		List<CategoryVo> AllCategory = adminService.getCategoryList();
		
		
		session.setAttribute("firstCategory", firstCategory);
		session.setAttribute("AllCategory", AllCategory);
		return "/main";
		
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) throws Exception {
		
		//세션 초기화
		session.removeAttribute("memberVo");;
		
		//메인에서 alert창을 띄우기 위한 request구현
		request.setAttribute("msg", "logoutSuccess");
		return "redirect:/";
	}

}
