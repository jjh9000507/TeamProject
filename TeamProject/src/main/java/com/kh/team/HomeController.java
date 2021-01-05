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
import com.kh.team.service.PageService;


@Controller
public class HomeController {	

	@Inject
	PageService pageService;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, HttpSession session) throws Exception {
		int distinct_num = 1;
		
		// 패션의류
			List<CategoryVo> list = pageService.mainCategories(distinct_num);
			session.setAttribute("mainCategories_1" , list);
//			System.out.println("list : " + list);

			distinct_num++;
			
		// 가구 생활
			List<CategoryVo> list2 = pageService.mainCategories(distinct_num);
//			System.out.println("list2 : " + list2);
			session.setAttribute("mainCategories_2" , list2);

			distinct_num++;
		
		// 컴퓨터	
			List<CategoryVo> list3 = pageService.mainCategories(distinct_num);
//			System.out.println("list3 : " + list3);
			session.setAttribute("mainCategories_3" , list3);

			distinct_num++;

		// 빈 칸	
			List<CategoryVo> list4 = pageService.mainCategories(distinct_num);
//			System.out.println("list4 : " + list4);
			session.setAttribute("mainCategories_4" , list4);

			distinct_num++;
			
		// 가전 . 전자제품	
			List<CategoryVo> list5 = pageService.mainCategories(distinct_num);

//			System.out.println("list5 : " + list5);
			session.setAttribute("mainCategories_5" , list5);

				
		
		
		return "/main";
		
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) throws Exception {
		
		//세션 초기화
		session.invalidate();
		
		//메인에서 alert창을 띄우기 위한 request구현
		request.setAttribute("msg", "logoutSuccess");
		return "/main";
	}

}
