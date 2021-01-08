package com.kh.team.controller;


import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;

import com.kh.team.service.ComputersService;



@Controller
@RequestMapping("/computerProduct")
public class ComputersController {	
	
	//인젝
	@Inject
	private ComputersService computersService;
	
	//메인창에서 컴퓨터제품 폼을 카테고리의 cate_no를 참조하여 불러오기
	@RequestMapping(value="/computersForm/{cate_no}", method=RequestMethod.GET)
	public String computersForm(@PathVariable("cate_no") String cate_no, Model model,HttpServletRequest request) throws Exception {
		System.out.println("cate_no:" + cate_no);
		
		//상품리스트 불러오기
		List<ComputerVo> computerList = computersService.list(cate_no);
		
		//카테고리 불러오기
		List<CategoryVo> categoryInfo = computersService.categoryInfo(cate_no);
		System.out.println("computerList:" + computerList);
		System.out.println("categoryInfo:" + categoryInfo);
		
		//모델을 이용하여 컴퓨터제품 폼에 상품리스트와 카테고리 전달하기
		model.addAttribute("computerList", computerList);
		model.addAttribute("categoryInfo", categoryInfo);
		String[] checkList = new String[6];
		checkList[0] = cate_no;
		
		//뒤로가기 및 체크박스를 이용한 다중검색을 위하여 미리 cate_no를 전달하기
		request.setAttribute("cate_no_confirm", checkList);
		return "/computerProduct/computersForm";
	}
	
//	@RequestParam(value="confirmList[]") String[] confirmList   (배열을 전달받는데 사용하는 코드 기억해두기)
	
	//해당 카테고리 내에서 제품 검색 기능
	@RequestMapping(value="/computersFormSearch", method=RequestMethod.POST)
	public String computersFormSearch(String c_com_name,String search0no,String search1no ,String search2no,String search3no,String search4no,String search5no, Model model,HttpServletRequest request) throws Exception {
		System.out.println("c_com_name:" + c_com_name);		
		
		//배열을 이용하여 컴퓨터제품 폼에서 불러온 값 저장하기
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
			
		//카테고리 정보 불러와서 모델에 저장
		List<CategoryVo> categoryInfo = computersService.categoryInfoArray(confirmList);
		model.addAttribute("categoryInfo", categoryInfo);
		System.out.println("categoryInfo_search:" + categoryInfo);
		
		//컴퓨터제품 정보 불러와서 모델에 저장
		List<ComputerVo> computerList = computersService.listSearch(c_com_name, confirmList);
        System.out.println("computerList_search:" + computerList);
		model.addAttribute("computerList", computerList);
		
		//뒤로가기 및 체크박스를 이용한 다중검색을 위하여 미리 cate_no를 전달하기
		request.setAttribute("cate_no_confirm", confirmList);
		return "/computerProduct/computersForm";
	}
	
	//카테고리 내에서 가격대 검색
	@RequestMapping(value="/computersFormSearchPrice", method=RequestMethod.POST)
	public String computersFormSearchPrice(int firstPrice,int lastPrice, String search0no,String search1no ,String search2no,String search3no,String search4no,String search5no, Model model,HttpServletRequest request) throws Exception {
		System.out.println("firstPrice:" + firstPrice);		
		System.out.println("lastPrice:" + lastPrice);		
		
		//배열을 이용하여 컴퓨터제품 폼에서 불러온 값 저장하기
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
		
		//카테고리 정보 불러와서 모델에 저장
		List<CategoryVo> categoryInfo = computersService.categoryInfoArray(confirmList);
		model.addAttribute("categoryInfo", categoryInfo);
		System.out.println("categoryInfo_price:" + categoryInfo);
		
		//컴퓨터제품 정보 불러와서 모델에 저장
		List<ComputerVo> computerList = computersService.listSearchPrice(firstPrice, lastPrice, confirmList);
		model.addAttribute("computerList", computerList);
		System.out.println("computerList_price:" + computerList);
		
		//뒤로가기 및 체크박스를 이용한 다중검색을 위하여 미리 cate_no를 전달하기
		request.setAttribute("cate_no_confirm", confirmList);
		return "/computerProduct/computersForm";
	}

	//체크박스 기능을 이용하여 카테고리 및 제품 다중 검색하기
	@RequestMapping(value="/computersFormCheck", method=RequestMethod.POST)
	public String computersFormCheck(String check0no,String check1no ,String check2no,String check3no,String check4no,String check5no, Model model,HttpServletRequest request) throws Exception {
		
		//배열을 이용하여 컴퓨터제품 폼에서 불러온 값 저장하기
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
		
		//카테고리 정보 불러와서 모델에 저장
		List<CategoryVo> categoryInfo = computersService.categoryInfoArray(checkList);
		model.addAttribute("categoryInfo", categoryInfo);
		System.out.println("categoryInfo_check:" + categoryInfo);
		
		//컴퓨터제품 정보 불러와서 모델에 저장
		List<ComputerVo> computerList = computersService.listArray(checkList);
		model.addAttribute("computerList", computerList);
        System.out.println("computerList_check:" + computerList);
		
		//뒤로가기 및 체크박스를 이용한 다중검색을 위하여 미리 cate_no를 전달하기
		request.setAttribute("cate_no_confirm", checkList);
		return "/computerProduct/computersForm";
	}
	
	//선택한 컴퓨터 상품정보 보기
	@RequestMapping(value="/detailComputerForm/{p_no}", method=RequestMethod.GET)
	public String detailComputerProduct(@PathVariable("p_no") int p_no, Model model) throws Exception {
		ComputerVo computerVo = computersService.detailComputerInfo(p_no);
		model.addAttribute("detailComputerVo", computerVo);
		System.out.println("computerVo_Detail:" + computerVo);
		return "/computerProduct/detailComputerForm";
	}
	
	//컴퓨터 구매하기 폼으로 가기
	@RequestMapping(value="/buyComputerProduct/{p_no}", method=RequestMethod.GET)
	public String buyComputerProduct(@PathVariable("p_no") int p_no, Model model,HttpServletRequest request) throws Exception {
		ComputerVo computerVo = computersService.buyComputerProduct(p_no);
		String c_com_cate_no = computerVo.getC_com_cate_no();
		System.out.println("buyFormUsed + c_com_cate_no:" + c_com_cate_no);
		String[] indexName = computersService.buyCategoryInfoGet(c_com_cate_no);
		model.addAttribute("buyComputerVo", computerVo);
		request.setAttribute("indexName", indexName);
		System.out.println("computerVo_Buy:" + computerVo);
		return "/computerProduct/buyComputerProduct";
	}	
	
	//판매자 아이디로 판매하는 상품찾기
	@RequestMapping(value="/computersFormSearchById", method=RequestMethod.POST)
	public String computersFormSearchById(String c_com_seller, String byId0no, String byId1no, String byId2no, String byId3no, String byId4no, String byId5no, Model model, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		System.out.println("c_com_seller:" + c_com_seller);			
		
		//배열을 이용하여 컴퓨터제품 폼에서 불러온 값 저장하기
		String[] confirmList = new String[6];
		if(byId0no != null) {
			System.out.println("byId0no:"+ byId0no);
			confirmList[0] = byId0no;
		}
		if(byId1no != null) {
			System.out.println("byId1no:"+ byId1no);
			confirmList[1] = byId1no;
		}
		if(byId2no != null) {
			System.out.println("byId2no:"+ byId2no);
			confirmList[2] = byId2no;
		}
		if(byId3no != null) {
			System.out.println("byId3no:"+ byId3no);
			confirmList[3] = byId3no;
		}
		if(byId4no != null) {
			System.out.println("byId4no:"+ byId4no);
			confirmList[4] = byId4no;
		}
		if(byId5no != null) {
			System.out.println("byId5no:"+ byId5no);
			confirmList[5] = byId5no;
		}
		
		//카테고리 정보 불러와서 모델에 저장
		List<CategoryVo> categoryInfo = computersService.categoryInfoArray(confirmList);
		
		System.out.println("categoryInfo_byid:" + categoryInfo);
		
		//아이디 있는지 확인
		int count = computersService.getSearchById(c_com_seller);
		//컴퓨터제품 정보 불러와서 모델에 저장		
		List<ComputerVo> computerList = computersService.listSearchById(c_com_seller, confirmList);
				
		System.out.println("computerList_byId:" + computerList);
		        
		//뒤로가기 및 체크박스를 이용한 다중검색을 위하여 미리 cate_no를 전달하기
		
		String view = "";
		
		if(count == 0) {
			view = "redirect:/computerProduct/computersForm";
			rttr.addFlashAttribute("msgx", "IdIsNull");
		}else if(count > 0) {
			model.addAttribute("categoryInfo", categoryInfo);
			model.addAttribute("computerList", computerList);
			request.setAttribute("cate_no_confirm", confirmList);
			view = "/computerProduct/computersForm";
		}
		
		
		
		return view;
	}

}
