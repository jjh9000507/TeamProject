package com.kh.team.controller;



import java.util.HashMap;


import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import com.kh.team.domain.MemberVo;
import com.kh.team.domain.PhoneSenderVo;
import com.kh.team.service.MemberService;

import net.nurigo.java_sdk.api.Message;




@Controller
@RequestMapping(value="/login")
public class LoginController {
	private int CHANGE_PW_NUM = 1;
	private int CHANGE_MEMBERINFO_NUM = 1;
	
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	@ResponseBody
	public String changePw(String m_id, String m_pass_new) throws Exception {
		System.out.println("memberVo + m_id:"+ m_id);
		System.out.println("m_pass_new:"+ m_pass_new);
		
		
		int count = memberService.changePw(m_id, m_pass_new);
		System.out.println("changeCount:" + count);
		String result = "";
		if(count == CHANGE_PW_NUM) {
			result = "success";
					
		}else {
			result = "fail";
		}
		
		return result;	
		
		
	}
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(HttpSession session) throws Exception {	
		MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");
		if(memberVo != null) {
			System.out.println("로그인 되어있어서 main으로 돌아감");
			return "redirect:/";
		}
		
		return "loginForm";
	}

	@RequestMapping(value = "/nonBuyerRun", method = RequestMethod.GET)
	public String nonBuyerRun(HttpServletRequest request, HttpSession session) throws Exception {
		session.setAttribute("nonBuyer", "nonBuyer");
		request.setAttribute("msg", "nonBuyerLoginSuccess");
		return "/main";	
	}
	
	@RequestMapping(value = "/memberVoInfoForm/{m_id}", method = RequestMethod.GET)
	public String memberVoInfoForm(@PathVariable("m_id") String m_id,HttpServletRequest request) throws Exception {
		System.out.println("/memberVoInfoForm/:" + m_id);
		MemberVo memberVo = memberService.memberVoInfoSearch(m_id);
		request.setAttribute("memberVoInfo", memberVo);
		return "/memberVoInfoForm";	
	}
	
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String m_id, String m_pass,String saveId,HttpSession session, HttpServletResponse response , RedirectAttributes rttr, HttpServletRequest request) throws Exception {	
		MemberVo memberVo = memberService.login(m_id, m_pass);
//		System.out.println("memberVo: " + memberVo);
		  
		String page ="";		
		if(memberVo != null) {
			Cookie cookie = new Cookie("saveId", m_id);
			if(saveId != null && !saveId.equals("")) {				
				cookie.setMaxAge(60 * 60 * 24 * 7);
			}else {
				cookie.setMaxAge(0);
			}
			response.addCookie(cookie);
			session.setAttribute("memberVo", memberVo);
			session.removeAttribute("nonBuyer");				
			page="redirect:/";
			
			rttr.addFlashAttribute("msg", "loginSuccess");
						
		}else {			
			page="redirect:/login/loginForm";
			rttr.addFlashAttribute("msg", "loginFail");
		}
		return page;
		}
	
	@RequestMapping(value="/sendMessageForMemberInfoUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String[] sendMessageForMemberInfoUpdate(String m_phonenumber_send) throws Exception{
		PhoneSenderVo phoneSenderVo = new PhoneSenderVo();
		System.out.println("m_phonenumber_send:" + m_phonenumber_send);
		String api_key = phoneSenderVo.getApi_key();
	    String api_secret = phoneSenderVo.getApi_secret();
	    Message coolsms = new Message(api_key, api_secret);    
		
	    Random rd = new Random();//랜덤 객체 생성
	    int[] secretCode = new int[6];
        for(int i=0;i<6;i++) {
        	secretCode[i] = rd.nextInt(45)+1;
        }
        String secretCodeNumber = Integer.toString(secretCode[0]) + Integer.toString(secretCode[1]) + Integer.toString(secretCode[2])
        							+ Integer.toString(secretCode[3]) + Integer.toString(secretCode[4]) + Integer.toString(secretCode[5]);
        
        System.out.println("문자로 보낸 인증코드 확인:" + secretCodeNumber);
        HashMap<String, String> set = new HashMap<String, String>();
    	set.put("to", m_phonenumber_send); // 수신번호
    	set.put("from", phoneSenderVo.getSender_phone_num()); // 발신번호
    	set.put("text", "안녕하세요 중고동네입니다. 인증번호는 [" + secretCodeNumber + "] 입니다."); // 문자내용
    	set.put("type", "sms"); // 문자 타입
    	
    	String[] resultRedirect = {null,null};
    	
    	JSONObject obj = (JSONObject) coolsms.send(set);
        if(obj != null) {
        	resultRedirect[0] = "success";
        	resultRedirect[1] = "successNum";  
        	
        }else if(obj == null) {
        	resultRedirect[0] = "fail";        	
        }
              
		return resultRedirect;		
	}
	
	@RequestMapping(value="/sendMessageForMemberInfoUpdateContents", method=RequestMethod.POST)
	@ResponseBody
	public String sendMessageForMemberInfoUpdateContents(MemberVo memberVo) throws Exception{
		System.out.println("memberVoConfirm:" + memberVo);
		int count = memberService.memberVoInfoChange(memberVo);
		String resultRedirect ="";
		if(count == CHANGE_MEMBERINFO_NUM) {
			resultRedirect = "success";
		}else {
			resultRedirect = "fail";
		}
				
		return resultRedirect;		
	}
	

	
}
