package com.kh.team.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;

import com.kh.team.service.ComputersService;



@Controller
@RequestMapping("/computerProduct")
public class ComputersController {
	
	
	@Inject
	private ComputersService computersService;
	
	@RequestMapping(value="/computersForm/{cate_no}", method=RequestMethod.GET)
	public String computersForm(@PathVariable("cate_no") String cate_no, Model model,HttpServletRequest request) throws Exception {
		System.out.println("cate_no:" + cate_no);		
		List<ComputerVo> computerList = computersService.list(cate_no);
		List<CategoryVo> categoryInfo = computersService.categoryInfo(cate_no);
		System.out.println("computerList:" + computerList);
		System.out.println("categoryInfo:" + categoryInfo);
		model.addAttribute("computerList", computerList);
		model.addAttribute("categoryInfo", categoryInfo);
		String[] checkList = new String[6];
		checkList[0] = cate_no;
		request.setAttribute("cate_no_confirm", checkList);
		return "/computerProduct/computersForm";
	}
//	@RequestParam(value="confirmList[]") String[] confirmList
	@RequestMapping(value="/computersFormSearch", method=RequestMethod.POST)
	public String computersFormSearch(String c_com_name,String search0no,String search1no ,String search2no,String search3no,String search4no,String search5no, Model model,HttpServletRequest request) throws Exception {
		System.out.println("c_com_name:" + c_com_name);		
				
		String[] confirmList = new String[6];
		if(search0no != null) {
			System.out.println("search0no:"+ search0no);
			confirmList[0] = search0no;
			}
			if(search1no != null) {
			System.out.println("search1no:"+ search1no);
			confirmList[1] = search1no;
			}
			if(search2no != null) {
			System.out.println("search2no:"+ search2no);
			confirmList[2] = search2no;
			}
			if(search3no != null) {
			System.out.println("search3no:"+ search3no);
			confirmList[3] = search3no;
			}
			if(search4no != null) {
			System.out.println("search4no:"+ search4no);
			confirmList[4] = search4no;
			}
			if(search5no != null) {
			System.out.println("search5no:"+ search5no);
			confirmList[5] = search5no;
			}
			
		
		List<CategoryVo> categoryInfo = computersService.categoryInfoArray(confirmList);
		model.addAttribute("categoryInfo", categoryInfo);
		System.out.println("categoryInfo_search:" + categoryInfo);
		List<ComputerVo> computerList = computersService.listSearch(c_com_name, confirmList);
        System.out.println("computerList_search:" + computerList);
		model.addAttribute("computerList", computerList);
		request.setAttribute("cate_no_confirm", confirmList);
		return "/computerProduct/computersForm";
	}


	@RequestMapping(value="/computersFormCheck", method=RequestMethod.POST)
	public String computersFormCheck(String check0no,String check1no ,String check2no,String check3no,String check4no,String check5no, Model model,HttpServletRequest request) throws Exception {
		String[] checkList = new String[6];
		
		if(check0no != null) {
		System.out.println("ano_check:"+ check0no);
		checkList[0] = check0no;
		}
		if(check1no != null) {
		System.out.println("bno_check:"+ check1no);
		checkList[1] = check1no;
		}
		if(check2no != null) {
		System.out.println("cno_check:"+ check2no);
		checkList[2] = check2no;
		}
		if(check3no != null) {
		System.out.println("dno_check:"+ check3no);
		checkList[3] = check3no;
		}
		if(check4no != null) {
		System.out.println("eno_check:"+ check4no);
		checkList[4] = check4no;
		}
		if(check5no != null) {
		System.out.println("fno_check:"+ check5no);
		checkList[5] = check5no;
		}
		
		List<CategoryVo> categoryInfo = computersService.categoryInfoArray(checkList);
		model.addAttribute("categoryInfo", categoryInfo);
		System.out.println("categoryInfo_check:" + categoryInfo);
		List<ComputerVo> computerList = computersService.listArray(checkList);
        System.out.println("computerList_check:" + computerList);
		model.addAttribute("computerList", computerList);
		request.setAttribute("cate_no_confirm", checkList);
		return "/computerProduct/computersForm";
	}	
	
	
	@RequestMapping(value="/detailComputerProduct/{p_no}", method=RequestMethod.GET)
	public String detailComputerProduct(@PathVariable("p_no") int p_no, Model model) throws Exception {
		ComputerVo computerVo = computersService.detailComputerInfo(p_no);
		model.addAttribute("detailComputerVo", computerVo);
		return "/computerProduct/detailComputerForm";
	}
	
	
}
