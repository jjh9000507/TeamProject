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
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.SanctionVo;
import com.kh.team.service.AdminService;
import com.kh.team.service.SanctionService;
import com.kh.team.service.WhitegoodsService;
import com.kh.team.util.UploadFileUtils;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	private SanctionService sanctionService;
	
	@Inject
	private WhitegoodsService whitegoodsService;
	
	@Inject
	private AdminService adminService;

	//관리자 시작페이지로 이동
	@RequestMapping(value="/adminForm", method=RequestMethod.GET)
	public String adminForm() throws Exception {
		
		return "/admin/adminform";
	}
	
	//관리자 회원관리 페이지로 이동
	@RequestMapping(value="/adminMember", method=RequestMethod.GET)
	public String adminMember() throws Exception {
		
		return "/admin/admin_member";
	}
	
	//관리자 카테고리 관리페이지로 이동
	@RequestMapping(value="/adminCategory", method=RequestMethod.GET)
	public String adminCategory() throws Exception {
		
		return "/admin/admin_category";
	}
	
	//관리자 게시물 관리 페이지
	@RequestMapping(value="/adminDetail", method=RequestMethod.GET)
	public String adminDetail() throws Exception {
		
		return "/admin/admin_detailpage";
	}
	
	//관리자 회원관리-회원관리 페이지
	@RequestMapping(value="/adminMemberCon", method=RequestMethod.GET)
	public String adminMemberCon(Model model) throws Exception {
		List<MemberVo> memberList = adminService.adminMemberSearch();
		model.addAttribute("memberList", memberList);
		return "/admin/a_m_con";
	}
	
	//관리자 회원관리 - 판매자 정보 관리 페이지
	@RequestMapping(value="/adminMemberSellCon", method=RequestMethod.GET)
	public String adminMemberSellCon(Model model) throws Exception {
		List<SanctionVo> sancList = sanctionService.sancList();
		List<MemberVo> sellerList = adminService.sellerList();
		model.addAttribute("sellerList", sellerList);
		model.addAttribute("sancList", sancList);
		return "/admin/a_m_seller";
	}
	
	//관리자페이지 판매자 권한 삭제
	@RequestMapping(value="/adminRollbackSeller/{m_id}", method=RequestMethod.GET)
	public String adminRollbackSeller(@PathVariable("m_id") String m_id, Model model) throws Exception {
		System.out.println("m_id: " + m_id);
		adminService.rollbackSeller(m_id);
		SanctionVo sanctionVo = sanctionService.searchSanc(m_id);
		if(sanctionVo == null) {
			sanctionService.newSanc(m_id);
		} else {
			sanctionService.sancUpdate(m_id);
		}
		List<MemberVo> sellerList = adminService.sellerList();
		model.addAttribute("sellerList", sellerList);
		return "/admin/a_m_seller";
	}
	
	//관리자페이지 회원 강제탈퇴
	@RequestMapping(value="/adminMemberDelete/{m_id}", method=RequestMethod.GET)
	public String adminMemberDelete(@PathVariable("m_id") String m_id, Model model) throws Exception{
		whitegoodsService.userPAlldelete(m_id);
		adminService.adminMemberDelete(m_id);
		List<MemberVo> memberList = adminService.adminMemberSearch();
		model.addAttribute("memberList", memberList);
		return "/admin/a_m_con";
	}
	
	//게시글 삭제 페이지로 이동
	@RequestMapping(value="detailDelete", method=RequestMethod.GET)
	public String detailDeletePage(Model model) throws Exception{
		List<ProductVo> allProductList = adminService.allProductList();
		List<CategoryVo> categoryList = adminService.getCategoryList();
		model.addAttribute("allProductList", allProductList);
		model.addAttribute("categoryList", categoryList);
		return "/admin/a_d_delete";
	}
	
	//게시글 삭제페이지 카테고리 별 띄우기
	@RequestMapping(value="detailDeleteCatePage/{cate_no}", method=RequestMethod.GET)
	public String detailDeleteCatePage(@PathVariable("cate_no") String cate_no, Model model) throws Exception {
		List<ProductVo> productCateList = adminService.productCateList(cate_no);
		List<CategoryVo> categoryList = adminService.getCategoryList();
		model.addAttribute("allProductList", productCateList);
		model.addAttribute("categoryList", categoryList);
		return "/admin/a_d_delete";
	}
	
	//게시글 삭제
	@RequestMapping(value="/adminProductDelete", method=RequestMethod.GET)
	@ResponseBody
	public String adminDelete(String cate_no, int p_no, int p_no2, Model model) throws Exception{
//		System.out.println("cate_no:" + cate_no);
//		System.out.println("p_no: " + p_no);
		String imgName = adminService.imgNameSearch(p_no2);
		UploadFileUtils.delete(imgName);
		String cate_sub = cate_no.substring(0, 2);
		if(cate_sub.equals("50")) {
			//컴퓨터
			adminService.adminComputerDelete(p_no);
		} else if(cate_sub.equals("10")) {
			//의류
			adminService.adminClothesDelete(p_no);
		} else if(cate_sub.equals("20")) {
			//가구
			String cate_sub2 = cate_no.substring(0,3);
			if(cate_sub2.equals("201")) {
				adminService.adminFLifeDelete(p_no);
			} else if(cate_sub2.equals("202")) {
				adminService.adminFInteriorDelete(p_no);
			} else if(cate_sub2.equals("203")) {
				adminService.adminFBedDelete(p_no);
			} else if(cate_sub2.equals("204")) {
				adminService.adminFKitchenDelete(p_no);
			}
		} else if(cate_sub.equals("30")) {
			//가전제품
			String[] filenames = adminService.productImgList(p_no2);
			for(int i = 0; i<filenames.length;i++) {
				String img_name = filenames[i];
				UploadFileUtils.delete(img_name);
			}

			adminService.adminWhitegoodsDelete(p_no, p_no2);
		}
		return "success";
	}
	
	//카테고리 추가 페이지로 이동
	@RequestMapping(value="/adminCategoryInput", method=RequestMethod.GET)
	public String adminCategoryInput(Model model) throws Exception {
		List<CategoryVo> firstCategoryList = adminService.firstCategoryList();
		model.addAttribute("firstCategoryList", firstCategoryList);
		return "/admin/a_c_input";
	}
	
	//카테고리 삭제 페이지로 이동
	@RequestMapping(value="/adminCategoryDelete", method=RequestMethod.GET)
	public String adminCategoryDelete(Model model) throws Exception {
		List<CategoryVo> categoryList = adminService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "/admin/a_c_delete";
	}
	
	//카테고리 삭제
	@RequestMapping(value="/CategoryDelete/{cate_no}", method=RequestMethod.GET)
	public String CategoryDelete(@PathVariable("cate_no") String cate_no , Model model) throws Exception {
		adminService.adminCategoryDelete(cate_no);
		return "redirect:/admin/adminCategoryDelete";
	}
	
	//카테고리 별 삭제 페이지로 이동
	@RequestMapping(value="/categoryDeletePage/{cate_no}", method=RequestMethod.GET)
	public String categoryDeletePage(@PathVariable("cate_no") String cate_no, Model model) throws Exception {
		List<CategoryVo> categoryList = adminService.categoryDeleteList(cate_no);
		model.addAttribute("categoryList", categoryList);
		return "/admin/a_c_delete";
	}
	
	
	//카테고리 선택 시 하위 분류 가져오기
	@RequestMapping(value="/getCategoryList", method=RequestMethod.GET)
	@ResponseBody
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception {
		List<CategoryVo> otherCategoryList = adminService.otherCategoryList(cate_ref);
		return otherCategoryList;
	}
	
	//카테고리 추가
	@RequestMapping(value="/categoryInsert", method=RequestMethod.GET)
	public String categoryInsert(String cate_name, String cate_ref) throws Exception {
		System.out.println("cate_name: " + cate_name);
		System.out.println("cate_ref: " + cate_ref);
		String cate_no = null;
		if(cate_ref.equals("")) {
			List<CategoryVo> firstCategoryList = adminService.firstCategoryList();
			int categoryLength = firstCategoryList.size();
			int cate_num = categoryLength + 1;
			String num = Integer.toString(cate_num);
			cate_no = num + "0";
		} else if(!cate_ref.equals("")) {
			List<CategoryVo> otherCategoryList = adminService.otherCategoryList(cate_ref);
			int categoryLength = otherCategoryList.size();
			int catenum = categoryLength + 1;
			String num = Integer.toString(catenum);
			cate_no = cate_ref + num;
		}
		CategoryVo categoryVo = new CategoryVo();
		categoryVo.setCate_no(cate_no);
		categoryVo.setCate_name(cate_name);
		categoryVo.setCate_ref(cate_ref);
		adminService.adminCategoryInput(categoryVo);
		return "redirect:/admin/adminCategoryInput";
	}
	
	//고객센터 페이지
	@RequestMapping(value="/adminService", method=RequestMethod.GET)
	public String adminService() throws Exception{
		return "/admin/admin_service";
	}
	
	//Q&A 페이지
	@RequestMapping(value="/adminQandAMain", method=RequestMethod.GET)
	public String adminQandAMain() throws Exception {
		return "/admin/a_q_main";
	}
	
	//Q&A 추가 페이지
	@RequestMapping(value="/adminQandAInput", method=RequestMethod.GET)
	public String adminQandAInput() throws Exception {
		return "/admin/a_q_input";
	}
	
	//Q&A 수정/삭제 페이지
	@RequestMapping(value="/adminQandADelete", method=RequestMethod.GET)
	public String adminQandADelete() throws Exception {
		return "/admin/a_q_delete";
	}
	
	//1:1문의 접수 페이지
	@RequestMapping(value="/adminInquiry", method=RequestMethod.GET)
	public String adminInquiry() throws Exception {
		return "/admin/a_inq";
	}
	
	//공지사항 페이지
	@RequestMapping(value="/adminNotice", method=RequestMethod.GET)
	public String adminNotice() throws Exception {
		return "/admin/a_notice";
	}
}
