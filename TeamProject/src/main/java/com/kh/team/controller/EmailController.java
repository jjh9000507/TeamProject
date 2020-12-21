package com.kh.team.controller;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.kh.team.domain.EmailDto;
import com.kh.team.domain.MemberVo;
import com.kh.team.service.MemberService;



@Controller
@RequestMapping(value="/email")
public class EmailController {
	
	public MemberVo memberVo;
	@Inject
	private MemberService memberService;
	
	@Inject
	private JavaMailSender mailSender;
	// 아이디 찾기위한 이메일보내기
	@RequestMapping(value="/sendEmailForFindId", method=RequestMethod.POST)
	@ResponseBody
	public String sendEmailForFindId(EmailDto emailDto) throws Exception{
		String m_id = memberService.sendEmailForFindId(emailDto.getTo());
		//준비작업 -설정
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
				helper.setFrom(emailDto.getFrom());
				helper.setTo(emailDto.getTo());				
				emailDto.setContent(m_id);	
				emailDto.setSubject("아이디 보내드립니다.");
				System.out.println("체크m_id:" + m_id);
				helper.setSubject(emailDto.getSubject());
				helper.setText(emailDto.getContent());
				
			}
			
		};
		System.out.println("/sendEmailForFindId + emailDto:" + emailDto);
		
		System.out.println("m_id_find:"+ m_id);
		// 해당이메일이 존재하는지 대조하기
		String result = "";
		if(m_id == null || m_id.equals("")) {
			System.out.println("체크null");
			result = "fail";
			
		}else {
			//보내기
			System.out.println("체크true");
			mailSender.send(preparator);
			result = "success";
			
		}			
		return result;		
	}
	//비밀번호 찾기
	@RequestMapping(value="/sendEmailForFindPw", method=RequestMethod.POST)
	@ResponseBody
	public String[] sendEmailForFindPw(String to, String m_id) throws Exception{
		System.out.println("to:" + to);
		System.out.println("m_id:" + m_id);
		String m_pass = memberService.sendEmailForFindPw(to, m_id);
		EmailDto emailDto = new EmailDto();
		System.out.println("m_pass:" + m_pass);
		//준비작업 -설정
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
				helper.setFrom(emailDto.getFrom());
				helper.setTo(to);	
				emailDto.setContent(m_pass + "1q2w3e4r" + m_pass);
				emailDto.setSubject("인증코드를 보내드립니다.");
				helper.setSubject(emailDto.getSubject());
				helper.setText(emailDto.getContent());
				
			}
			
		};		
		emailDto.setContent(m_pass + "1q2w3e4r" + m_pass);
		System.out.println("인증코드:" + emailDto.getContent());
		String[] result = {"", emailDto.getContent()};
		if(m_pass == null || m_pass.equals("")) {
			result[0] = "fail";
		}else {
			result[0] = "success";
			result[1] = emailDto.getContent();
			mailSender.send(preparator);
		}
					
		return result;		
	}
}
