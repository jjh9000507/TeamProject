package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.WhitegoodsVo;
import com.kh.team.service.WhitegoodsService;
import com.kh.team.util.UploadFileUtils;

@Controller
@RequestMapping("/whitegoods")
public class WhitegoodsController {
	
	@Inject
	private WhitegoodsService whitegoodsService;
	
	//가전제품 카테고리 클릭하여 리스트 보기
	@RequestMapping(value="/whitegoodsPage/{w_cate_no}", method=RequestMethod.GET)
	public String WhitegoodsPage(@PathVariable("w_cate_no") String w_cate_no, Model model) throws Exception {
		List<WhitegoodsVo> getWhitegoodsList = whitegoodsService.getWhitegoodsList(w_cate_no);
		List<CategoryVo> getCategoryList = whitegoodsService.getCategoryList(w_cate_no);
//		System.out.println("whitegoodsList: " + getWhitegoodsList);
//		System.out.println("CategoryList: " + getCategoryList);
		model.addAttribute("WhitegoodsList", getWhitegoodsList);
		model.addAttribute("categoryList", getCategoryList);
		return "/whitegoods/whitegoodsList";
	}
	
	//상품 상세보기 페이지
	@RequestMapping(value="/detailWhitegoods/{w_no}", method=RequestMethod.GET)
	public String detailWhitegoods(@PathVariable("w_no") int w_no, Model model) throws Exception {
		WhitegoodsVo whitegoodsVo = whitegoodsService.detailWhitegoods(w_no);
		int p_no = whitegoodsVo.getP_no();
		List<String> productImgList = whitegoodsService.productImgList(p_no);
		model.addAttribute("whitegoodsVo", whitegoodsVo);
		model.addAttribute("productImgList", productImgList);
		return "/whitegoods/detailwhitegoods";
	}

	
	//카테고리 가져오기
	@RequestMapping(value="/getCategoryList", method=RequestMethod.GET)
	@ResponseBody
	public List<CategoryVo> getCategoryList(String cate_no) throws Exception {
		List<CategoryVo> cate_list = whitegoodsService.getCategoryList(cate_no);
		System.out.println(cate_list);
		return cate_list;
	}
	
	//수정하기 버튼
	@RequestMapping(value="/whitegoodsUpdate/{w_no}", method=RequestMethod.GET)
	public String whitegoodsUpdate(@PathVariable("w_no") int w_no, Model model) throws Exception {
		WhitegoodsVo whitegoodsVo = whitegoodsService.detailWhitegoods(w_no);
		model.addAttribute("whitegoodsVo", whitegoodsVo);
		return "/whitegoods/whitegoodsUpdate";
	}
	
	//삭제하기
	@RequestMapping(value="/whitegoodsDelete/{w_no}", method=RequestMethod.GET)
	public String whitegoodsDelete(@PathVariable("w_no") int w_no) throws Exception {
		WhitegoodsVo whitegoodsVo = whitegoodsService.detailWhitegoods(w_no);
		//p_no2는 상품 설명 이미지 저장된 테이블에 있는 이름들 가져와서 파일을 S3에서 지우기 위함.
		int p_no2 = whitegoodsVo.getP_no();
		List<String> files = whitegoodsService.productImgList(p_no2);
		for(int i = 0; i<files.size(); i++) {
			String file = files.get(i);
			UploadFileUtils.delete(file);
		}
		whitegoodsService.productImgDelete(p_no2);
		//상품 대표이미지 S3에서 삭제하기 위해 이름 가져와야함.
		String thumbnail = whitegoodsVo.getW_thumbimg();
		UploadFileUtils.delete(thumbnail);
		
		whitegoodsService.deleteWhitegoods(w_no);
		return "redirect:/";
	}
}