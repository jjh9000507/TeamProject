package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.Locale;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/funiture")
public class JoinController {
	
	@RequestMapping(value = "funiture/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {	
		//return "/joinForm";
		return "joinForm";
	}
	
	@RequestMapping(value = "funiture/map", method = RequestMethod.GET)
	public String map() {
		//return "/joinForm";
		return "map";
	}
	
	@RequestMapping(value = "funiture/joinForm", method = RequestMethod.GET)
	public String joinForm() {	
		//return "/joinForm";
		return "joinForm";
	}
	
	@RequestMapping(value="funiture/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(/*@RequestParam("fileName")*/ String fileName) throws Exception {
		
		byte[] bytes = null;
		
		if((fileName != null) && !fileName.equals("") ) {
		FileInputStream fis = new FileInputStream(fileName);
		// org.apache.commons.io.IOUtils
		bytes = IOUtils.toByteArray(fis);
		}
		return bytes;
	}
	
	@RequestMapping(value="funiture/getAddress", method = RequestMethod.GET)
	public String getAddress(String txtAddress) throws Exception{
				
		return null;
	}
	
	
	
}
