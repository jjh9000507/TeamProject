package com.kh.team;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.CategoryVo;
import com.kh.team.service.PageService;


@Controller
public class HomeController {	

	@Inject
	PageService pageService;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		int distinct_num = 1;
		
			List<CategoryVo> list = pageService.mainCategories(distinct_num);
			model.addAttribute("mainCategories_1" , list);
//			System.out.println("list : " + list);
			distinct_num++;
		
			List<CategoryVo> list2 = pageService.mainCategories(distinct_num);
//			System.out.println("list2 : " + list2);
			model.addAttribute("mainCategories_2" , list2);
			distinct_num++;
			
			List<CategoryVo> list3 = pageService.mainCategories(distinct_num);
//			System.out.println("list3 : " + list3);
			model.addAttribute("mainCategories_3" , list3);
			distinct_num++;

			List<CategoryVo> list4 = pageService.mainCategories(distinct_num);
//			System.out.println("list4 : " + list4);
			model.addAttribute("mainCategories_4" , list4);
			distinct_num++;
			
			List<CategoryVo> list5 = pageService.mainCategories(distinct_num);
//			System.out.println("list5 : " + list5);
			model.addAttribute("mainCategories_5" , list5);
				
		
		
		return "/main";
		
	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) throws Exception {
		session.invalidate();	
		request.setAttribute("msg", "logoutSuccess");
		return "/main";
	}

}
