package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/service")
public class ServicecenterContorller {

	@RequestMapping(value="serviceMain", method=RequestMethod.GET)
	public String serviceMain() throws Exception{
		return "/service/service_center";
	}
	
	
}
