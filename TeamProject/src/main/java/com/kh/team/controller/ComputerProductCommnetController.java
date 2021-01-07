package com.kh.team.controller;



import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;



@RestController
@RequestMapping("/computerProduct")
public class ComputerProductCommnetController {
	
	@RequestMapping(value="/commentShow/{c_com_comment_no}", method=RequestMethod.GET)
	public void commentShow(@PathVariable("c_com_comment_no") int c_com_comment_no) throws Exception{
		
	}

}
