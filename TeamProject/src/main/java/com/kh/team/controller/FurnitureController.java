package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.util.IOUtils;
import com.kh.team.domain.FurnitureInteriorVo;
import com.kh.team.service.FurnitureService;
import com.kh.team.util.FurnitureFileUtil;

@Controller
@RequestMapping(value="/furniture")
public class FurnitureController {
	
	@Inject
	private FurnitureService furnitureService;
	
	@RequestMapping(value = "/202", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception{	
		
		List<FurnitureInteriorVo> list = furnitureService.getFurnitureInteriorList();
		model.addAttribute("list", list);
		return "furnitureCategory/interior";
	}
	
	// 생활
	@RequestMapping(value = "/201", method = RequestMethod.GET)
	public String joinForm() {	
		//return "/joinForm";
		return "furnitureCategory/life";
	}	
	
	@RequestMapping(value = "/writeForm", method = {RequestMethod.POST, RequestMethod.GET})
	public String writeForm() {	
		return "furnitureCategory/writeForm";
	}	
	
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST)
	@ResponseBody
	public String uploadAjax(MultipartFile file) throws Exception {	
		System.out.println("file:"+file);
		//String originlName = file.getOriginalFilename();
		String filePathAndName = FurnitureFileUtil.uploadFile(file, "furniture");
		System.out.println(filePathAndName);
		return filePathAndName;
	}	
	
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String imageName) throws Exception{
		
		byte[] bytes = null;
		
		if(imageName != null) {
			FileInputStream fis = new FileInputStream(imageName);
			bytes = IOUtils.toByteArray(fis);
		}
		System.out.println("displayImage bytes:"+bytes);
		return bytes;
	}
	
	@RequestMapping(value = "/jusoPopup", method = RequestMethod.POST)
	public String jusoPopup() {	
		System.out.println("jusoPopup");
		return "furnitureCategory/jusoPopup";
	}
	
	@RequestMapping(value="/getFurnitureInteriorAddList", method=RequestMethod.GET)
	@ResponseBody
	public List<FurnitureInteriorVo> getFurnitureInteriorAddList(int num, Model model) throws Exception{
		List<FurnitureInteriorVo> list = furnitureService.getFurnitureInteriorAddList(num);
		model.addAttribute("list", list);
		
		System.out.println("num:"+num+" ,list:"+list);
		
		return list;
	}
}
