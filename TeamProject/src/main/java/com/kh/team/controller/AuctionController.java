package com.kh.team.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.AuctionSellVo;
import com.kh.team.domain.AuctionSoldVo;
import com.kh.team.domain.AuctionEDateVo;
import com.kh.team.domain.AuctionImgVo;
import com.kh.team.domain.AuctionMainImgVo;
import com.kh.team.domain.AuctionRDateVo;
import com.kh.team.domain.AuctionVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.service.AuctionService;
import com.kh.team.util.FurnitureFileUtil;

@Controller
@RequestMapping(value="/auction")
public class AuctionController implements AuctionS3Key {

	@Inject
	private AuctionService auctionService;
	
	@RequestMapping(value="/auctionMain", method=RequestMethod.GET)
	public String getAuctoionMainList(Model model) throws Exception{
		
		//최근 날짜의 목록에 따라 메인 이미지만
		List<AuctionSellVo> list = auctionService.getAuctoionMainList();
		//System.out.println("auctionController getAuctionList list:"+list);
		model.addAttribute("list", list);
		
		/* 시작 할 때 s3에 있는 이미지를 다운 받는다 */
		List<AuctionImgVo> imgList = auctionService.getAuctionImg();
		
		//credential과 client객체 생성
		AWSCredentials credential = new BasicAWSCredentials(accesskey, secretkey);
		AmazonS3 s3Client = AmazonS3ClientBuilder
				.standard()
				.withCredentials(new AWSStaticCredentialsProvider(credential))
				.withRegion(Regions.AP_NORTHEAST_2)
				.build();
		//버킷 생성
		//s3Client.createBucket("sdk-new-bucket");
		
		for(AuctionImgVo localAuctionImgVo : imgList) {//로컬에 없는 폴더를 먼저 고른다
			String localFolderName = Integer.toString(localAuctionImgVo.getP_no());
			
			if(FurnitureFileUtil.chkDirecotry(localFolderName)) {//폴더가 없으면
				
				for(AuctionImgVo auctionImgVo : imgList) {
					
					String fileNamePath =auctionImgVo.getImg_name();
					int length = fileNamePath.length();
					int lastSlash = fileNamePath.lastIndexOf("/");
					String fileName = fileNamePath.substring(lastSlash+1, length);
					String folderName = Integer.toString(auctionImgVo.getP_no());
					
					if(localFolderName.equals(folderName)) {//폴더가 존재하지 않으면 s3접속 파일을 가지고 온다
						System.out.println("----------------------- s3 접속 --------------------------------------");
						String bucketName = "sdk-new-bucket"; //버킷(디렉토리) 이름
						String bucketKey = folderName+ "/" +fileName; //버킷안에 저장 될 폴더와 파일이름
						//System.out.println("service insertAuctionImg bucketkey:"+bucketKey);
						
						//파일 다운로드
						String downFileName = "C:/Temp/auctionImg/"+folderName+"/"+fileName;//다운로드 받을 폴더와 파일명
			
						S3Object s3Object = s3Client.getObject(new GetObjectRequest(bucketName, bucketKey));
						S3ObjectInputStream inputStream = s3Object.getObjectContent();
						
						FileUtils.copyInputStreamToFile(inputStream, new File(downFileName));
					}
					//s3끝
				}
			} 
		}
		return "auction/auctionMain";
	}
	
	@RequestMapping(value="/auctionResisterList", method=RequestMethod.GET)
	public String auctionResisterList(Model model, HttpSession session, RedirectAttributes rttr) throws Exception{
		MemberVo memberVo =  (MemberVo)session.getAttribute("memberVo");
		
		if(memberVo == null || memberVo.equals("")) {
			rttr.addFlashAttribute("msg", "loginFail");
			return "redirect:/auction/auctionMain";
		}
	
		//System.out.println("memberVo seller"+ memberVo.getM_id());
		String m_id = memberVo.getM_id();
		
		List<AuctionSellVo> sellList = auctionService.getAuctionUserMemberListSell(m_id);
		model.addAttribute("sellList",sellList);
		
		List<AuctionSoldVo> soldList = auctionService.getAuctionUserMemberListSold(m_id);
		model.addAttribute("soldList",soldList);
		
		//폴더 이름을 p_no로 만들고 이미지를 저장하기 위해서 다음 p_no를 가지고 온다
		int nextSeq = auctionService.getNextSeqNumber();
		//System.out.println("auctionResisterList nextSeq:"+nextSeq);
		model.addAttribute("nextPNO", nextSeq);

		return "auction/auctionResisterList";
	}
	
	@RequestMapping(value="/auctionSelected", method=RequestMethod.GET)
	public String auctionSelected(String p_no, Model model) throws Exception{
		System.out.println("pno:"+p_no);
		
		AuctionSellVo selectedItem = auctionService.getAuctionSelectedItem(Integer.parseInt(p_no));
		List<AuctionImgVo> selectedImg = auctionService.getAuctionSelectedImg(Integer.parseInt(p_no));
		
		System.out.println("selectedItem:"+selectedItem);
		System.out.println("selectedImg:"+selectedImg);
		
		model.addAttribute("selectedItem", selectedItem);
		model.addAttribute("selectedImg", selectedImg);
		
		
		return "auction/auctionSelected";
	}
	
	@RequestMapping(value="/excercise", method=RequestMethod.GET)
	public String excercise(String pno) throws Exception{
		return "auction/excercise";
	}
	
	@RequestMapping(value="/auctionResister", method=RequestMethod.GET)
	public String auctionResisterRun(int nextPNO, AuctionVo auctionVo, 
			AuctionAddressVo auctionAddressVo, AuctionImgVo auctionImgVo, 
			AuctionEDateVo auctionEDateVo, AuctionMainImgVo auctionMainImgVo, HttpSession session) throws Exception{
		
		auctionAddressVo.setP_no(nextPNO);
		auctionImgVo.setP_no(nextPNO);
		auctionEDateVo.setP_no(nextPNO);
		auctionMainImgVo.setP_no(nextPNO);
		
		//오늘 날짜
		SimpleDateFormat nowDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String nowDate = nowDateFormat.format(date);
		String[] nowDateArray = nowDate.split("-");
		int[] nowDataArrayInt = stringArrayTointArray(nowDateArray);
		//오늘 시간
		SimpleDateFormat nowTimeFormat = new SimpleDateFormat("HH:mm");
		String nowTime = nowTimeFormat.format(date);
		String[] nowTimeArray = nowTime.split(":");
		int[] nowTimeArrayInt = stringArrayTointArray(nowTimeArray);
				
		AuctionRDateVo auctionRDateVo = new AuctionRDateVo(nowDataArrayInt[0], nowDataArrayInt[1], nowDataArrayInt[2], nowTimeArrayInt[0], nowTimeArrayInt[1], nextPNO);
		
		//auctionVo -> auctionAddressVo -> auctionRDateVo -> auctionEDateVo -> auctionMainImgVo -> auctionImgVo
		//seller에 가입자 대신 임의로 user03입력
		
		String seller = ((MemberVo)session.getAttribute("memberVo")).getM_id();
		
		auctionVo.setSeller(seller);
		auctionService.insertAuction(auctionVo);
		
		auctionService.insertAuctionAddress(auctionAddressVo);
		auctionService.insertAuctionRegisterDate(auctionRDateVo);
		auctionService.insertAuctionExpirationDate(auctionEDateVo);
		auctionService.insertAuctionMainImg(auctionMainImgVo);
		auctionService.insertAuctionImg(auctionImgVo);
		
		return "redirect:/auction/auctionMain";
	}
	
	private int[] stringArrayTointArray(String[] str) {
		int[] intArry = new int[str.length];
	
		for(int i=0 ; i<str.length ; i++) {
			intArry[i] = Integer.parseInt(str[i]);
		}
		
		return intArry;
	}
	
	@RequestMapping(value="/logInCheck", method=RequestMethod.GET)
	@ResponseBody
	public String logInCheck(HttpSession session) throws Exception{
		
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		//System.out.println("memberVo:"+memberVo);
		
		String result = "LogOut";
		//로그인 체크 
		if(memberVo != null) {
			result = "LogIn";
		}
		
		return result;
	}
	
	@RequestMapping(value="/userCheck", method=RequestMethod.GET)
	@ResponseBody
	public String userCheck(String seller, HttpSession session) throws Exception{
		//System.out.println("seller:"+seller);
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		
		String result = "different";
		
		if(memberVo != null) {
			if(seller.equals(memberVo.getM_id())){
				result = "same";
			}
		}
		return result;
	}
	
	@RequestMapping(value="/logIn", method=RequestMethod.GET)
	@ResponseBody
	public String logIn(String m_id,String m_pass, HttpSession session) throws Exception{
		//System.out.println("seller:"+seller);
		
		MemberVo memberVo = auctionService.AuctionLogin(m_id, m_pass);
		
		String result = "loginFali";
		if(memberVo != null) {
			session.setAttribute("memberVo", memberVo);
			result = "loginSuccess";
		}
		
		return result;
	}
	
	@RequestMapping(value="/auctionDelete", method=RequestMethod.GET)
	public String auctionDelete(int p_no) throws Exception{
		//System.out.println("seller:"+seller);
		
		auctionService.deleteAcutionAll(p_no);
		
		String folderName = Integer.toString(p_no);
		FurnitureFileUtil.deleteImage(folderName);
		
		return "redirect:/auction/auctionResisterList";
	}
	
}
