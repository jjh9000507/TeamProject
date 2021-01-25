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
import com.kh.team.service.AuctionService;
import com.kh.team.service.MemberService;

import net.nurigo.java_sdk.api.Message;




@Controller
@RequestMapping(value="/login")
public class LoginController implements PhoneSender{
	
	//필요한 상수값 만들기 	
	private int CHANGE_PW_NUM = 1;
	private int CHANGE_MEMBERINFO_NUM = 1;
	
	//경매service
	@Inject
	private AuctionService auctionService;
	
	//인젝
	@Inject
	private MemberService memberService;
	
	//패스워드 바꾸기 기능
	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	@ResponseBody
	public String changePw(String m_id, String m_pass_new) throws Exception {
		System.out.println("memberVo + m_id:"+ m_id);
		System.out.println("m_pass_new:"+ m_pass_new);
		
		//패스워드 바꾸기 기능 성공 시  숫자 1 받아오기
		int count = memberService.changePw(m_id, m_pass_new);
		System.out.println("changeCount:" + count);
		String result = "";
		
		//비밀번호 변경이 성공하였는지 확인하는 신호 보내기
		if(count == CHANGE_PW_NUM) {
			result = "success";
					
		}else {
			result = "fail";
		}
		
		return result;	
		
		
	}
	
	//로그인 폼으로 가기
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(HttpSession session) throws Exception {
		
		//로그인 성공시 세션에 해당 접속자 정보 저장
		MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");
		if(memberVo != null) {
			System.out.println("로그인 되어있어서 main으로 돌아감");
			return "redirect:/";
		}
		
		return "loginForm";
	}
	
	//비회원 접속
	@RequestMapping(value = "/nonBuyerRun", method = RequestMethod.GET)
	public String nonBuyerRun(HttpServletRequest request, HttpSession session) throws Exception {
		
		//비회원으로 접속시 세션에 비회원 자격 저장
		session.setAttribute("nonBuyer", "nonBuyer");
		
		//비회원으로 접속했다는 신호를 보내기
		request.setAttribute("msg", "nonBuyerLoginSuccess");
		return "/main";	
	}
	
	//접속자 정보 보여주기 기능
	@RequestMapping(value = "/memberVoInfoForm")
	public String memberVoInfoForm(HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("/memberVoInfoForm/:");
		MemberVo memberVoBefore = (MemberVo) session.getAttribute("memberVo");
		String m_id = memberVoBefore.getM_id();
		//접속자 정보 가져오기
		MemberVo memberVo = memberService.memberVoInfoSearch(m_id);
		
		//해당 jsp로 보내기
		request.setAttribute("memberVoInfo", memberVo);
		return "/memberVoInfoForm";	
	}
	
	//로그인기능
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String m_id, String m_pass,String saveId,HttpSession session, HttpServletResponse response , RedirectAttributes rttr, HttpServletRequest request) throws Exception {	
		
		//해당 아이디와 비밀번호로 접속자 정보 가져오기
		MemberVo memberVo = memberService.login(m_id, m_pass);
//		System.out.println("memberVo: " + memberVo);
		  
		String page ="";		
		if(memberVo != null) {
			
			//쿠키를 이용하여 아이디 저장(아이디 기억하기 버튼 체크시)
			Cookie cookie = new Cookie("saveId", m_id);
			if(saveId != null && !saveId.equals("")) {
				
				//쿠키 지속시간 정하기
				cookie.setMaxAge(60 * 60 * 24 * 7);
			}else {
				
				//아이디 기억하기 버튼 미체크시 쿠키 지속시간을 0으로 만듬
				cookie.setMaxAge(0);
			}
			
			//생성한 쿠키 추가
			response.addCookie(cookie);
			
			//세션에 해당 접속자 정보 저장
			session.setAttribute("memberVo", memberVo);
			
			/*경매시작-회원정보 세션에 저장할 때 경매 배달상품 갯수 저장*/
			int count = auctionService.getAuctionOrderDeliveryCount(m_id);
			session.setAttribute("deliveryCount", count);
			/*경매끝*/
			
			//세션에서 비회원 정보가 있을 경우를 대비하여 비회원 정보 없애기
			session.removeAttribute("nonBuyer");				
			page="redirect:/";
			
			//로그인 성공하면 해당 jsp로 신호 전달
			rttr.addFlashAttribute("msg", "loginSuccess");
						
		}else {	
			
			//로그인 실패시 원래대로 다시 돌리기
			page="redirect:/login/loginForm";
			rttr.addFlashAttribute("msg", "loginFail");
		}
		return page;
		}
	
	
	//가입한 사람의 정보 변경하기 위해 핸드폰으로 sms전송하여 인증코드 보내는 기능
	@RequestMapping(value="/sendMessageForMemberInfoUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String[] sendMessageForMemberInfoUpdate(String m_phonenumber_send) throws Exception{
		
		
		
		System.out.println("m_phonenumber_send:" + m_phonenumber_send);
		
		//sms보내기 위하여 coolsms사이트에서 api키와 api비밀번호 받아와서 저장
		Message coolsms = new Message(api_key, api_secret);    
		
	    //랜덤기능을 이용하여 인증 코드 구현
	    Random rd = new Random();
	    int[] secretCode = new int[6];
        for(int i=0;i<6;i++) {
        	secretCode[i] = rd.nextInt(45)+1;
        }
        String secretCodeNumber = Integer.toString(secretCode[0]) + Integer.toString(secretCode[1]) + Integer.toString(secretCode[2])
        							+ Integer.toString(secretCode[3]) + Integer.toString(secretCode[4]) + Integer.toString(secretCode[5]);
        
        //hashmap을 이용하여 보낼 정보 구성하기
        System.out.println("문자로 보낸 인증코드 확인:" + secretCodeNumber);
        HashMap<String, String> set = new HashMap<String, String>();
    	set.put("to", m_phonenumber_send); // 수신번호
    	set.put("from", sender_phone_num); // 발신번호
    	set.put("text", "안녕하세요 중고동네입니다. 인증번호는 [" + secretCodeNumber + "] 입니다."); // 문자내용
    	set.put("type", "sms"); // 문자 타입
    	   	
    	String[] resultRedirect = {null,null};
    	
    	//문자 보내기
    	JSONObject obj = (JSONObject) coolsms.send(set);
    	
    	//문자보내기가 성공했는지 확인하는 기능
        if(obj != null) {
        	resultRedirect[0] = "success";
        	resultRedirect[1] = "successNum";  
        	
        }else if(obj == null) {
        	resultRedirect[0] = "fail";        	
        }
              
		return resultRedirect;		
	}
	
	//sms로 받은 인증코드를 해당 jsp에서 확인한 후 접속자 정보 업데이트
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
