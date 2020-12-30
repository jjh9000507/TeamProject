package com.kh.team.controller;

import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.util.IOUtils;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ClothesVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.SanctionVo;
import com.kh.team.domain.WhitegoodsVo;
import com.kh.team.service.ClothesService;
import com.kh.team.service.MemberService;
import com.kh.team.service.SanctionService;
import com.kh.team.service.SellProductService;
import com.kh.team.util.S3Util;
import com.kh.team.util.UploadFileUtils;
import com.sun.net.ssl.HttpsURLConnection;



@Controller
@RequestMapping("/sellproduct")
public class SellProductContoller {
	
	private static final Logger logger = LoggerFactory.getLogger(SellProductContoller.class);
	
	S3Util s3 = new S3Util();
	String buckteName = "teamptbucket";
	
	
	@Inject
	private SellProductService sellProductService;
	
	@Inject
	private ClothesService clothesService;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private SanctionService sanctionService;
	
	//판매하기 화면 이동
	@RequestMapping(value="/sellproductMain", method=RequestMethod.GET)
	public String sellproductMain(HttpSession session, Model model) throws Exception {
		return "/sell/sellproductmain";
	}
	
	//
	@RequestMapping(value="/sellproduct", method=RequestMethod.GET)
	public String sellproductPage() throws Exception {
		return "/sell/sellproduct";
	}
	
	//판매상품 등록시 카테고리 가져오기
	@RequestMapping(value="/getCategoryList", method=RequestMethod.GET)
	@ResponseBody
	public List<CategoryVo> getCategoryList(String cate_no) throws Exception {
		List<CategoryVo> categoryList = sellProductService.getCategoryList(cate_no);
		return categoryList;
	}
	
	//가전제품 등록
	@RequestMapping(value="/whitegoodsUpload", method=RequestMethod.GET)
	public String whitegoodsUpload(ProductVo productVo, HttpSession session) throws Exception {
		System.out.println("productVo: " + productVo);
		WhitegoodsVo whitegoodsVo = new WhitegoodsVo();
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		whitegoodsVo.setW_name(productVo.getP_name());
		whitegoodsVo.setW_seller(memberVo.getM_id());
		whitegoodsVo.setCate_no(productVo.getCate_no());
		whitegoodsVo.setW_content(productVo.getP_content());
		
		return "/main";
	}
	
	//의류 등록
	@RequestMapping(value="/clothesUpload", method=RequestMethod.GET)
	public String clothesUpload(ClothesVo clothesVo) throws Exception {
		clothesService.insertClothes(clothesVo);
		return "/main";
	}
	
	//가구 등록
	@RequestMapping(value="/furnitureUpload", method=RequestMethod.GET)
	public String furnitureUpload() throws Exception {
		return "/main";
	}
	
	//컴퓨터 등록
	@RequestMapping(value="/computerUpload", method=RequestMethod.GET)
	public String computerUpload() throws Exception {
		return "/main";
	}
	
	//판매자 등록화면 이동
	@RequestMapping(value="/registration", method=RequestMethod.GET)
	public String registration(HttpSession session, Model model) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		String m_id = memberVo.getM_id();
		SanctionVo sanctionVo = sanctionService.searchSanc(m_id);
		String page;
		if(sanctionVo == null) {
			page = "/sell/sellerreg";
		} else {
			if(sanctionVo.getSanc_count() >= 3) {
				page = "/sell/sellproductmain";
				model.addAttribute("msg", "Count3");
			} else {
				page = "/sell/sellerreg";
			}
		}
		
		return page;
	}
	
	//판매자 등록
	@RequestMapping(value="/registrationRun", method=RequestMethod.GET)
	public String registrationRun(HttpSession session, Model model) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		String m_id = memberVo.getM_id();
		String m_pass = memberVo.getM_pass();

		model.addAttribute("msg", "sellerReg");
		sellProductService.sellerReg(m_id);			
		session.removeAttribute("memberVo");

		memberVo = memberService.login(m_id, m_pass);
		session.setAttribute("memberVo", memberVo);
				
		return "/sell/sellproductmain";
	}
	
//	@RequestMapping(value="/displayImage", method=RequestMethod.GET, produces="application/test;charset=utf-8")
//	@ResponseBody
//	public byte[] displayImage(String fileName) throws Exception {
//		System.out.println("fileName: " + fileName);
//		FileInputStream fis = new FileInputStream(fileName);
//		byte[] bytes = com.amazonaws.util.IOUtils.toByteArray(fis);
//		return bytes;
//	}
	
	//이미지 출력(아직 안됨)
	@RequestMapping(value="/displayImage", method=RequestMethod.GET, produces="application/test;charset=utf-8")
	@SuppressWarnings("resource")
	@ResponseBody
	public ResponseEntity<byte[]> displayImage(String fileName, String directory) throws Exception {
		System.out.println("fileName: " + fileName);
		System.out.println("directory: " + directory);
//		logger.info(directory);
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		HttpsURLConnection uCon = null;
//		logger.info("File Name: " + fileName);
		
		String inputDirectory = null;
		if(directory.equals("goods")) {
			inputDirectory = "goods";
		} else if(directory.equals("profile")) {
			inputDirectory = "profile";
		}
		
		try {
			HttpHeaders headers = new HttpHeaders();
			URL url;
			try {
				url = new URL(s3.getFileURL(buckteName, inputDirectory + fileName));
				uCon = (HttpsURLConnection) url.openConnection();
				in = uCon.getInputStream();
			} catch (Exception e) {
				url = new URL(s3.getFileURL(buckteName, "default.jpg"));
				uCon = (HttpsURLConnection) url.openConnection();
				in = uCon.getInputStream();
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		
		return entity;
	}

	//이미지 등록시 업로드
	@RequestMapping(value="/uploadedFile", method=RequestMethod.POST, produces="application/test;charset=utf-8")
	@ResponseBody
	public String uploadedFile(MultipartFile file, String str, HttpSession session, HttpServletRequest request, Model model) throws Exception {
		logger.info("originalName: " + file.getOriginalFilename());
		String uploadPath = "goods";
		
		ResponseEntity<String> img_path = new ResponseEntity<>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
		String goodsImage = (String)img_path.getBody();
		return goodsImage;
	}
	
}
