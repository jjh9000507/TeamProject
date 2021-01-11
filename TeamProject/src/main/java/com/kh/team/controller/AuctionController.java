package com.kh.team.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMethodMappingNamingStrategy;
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
import com.kh.team.domain.AuctionDateAndTimeVo;
import com.kh.team.domain.AuctionSellVo;
import com.kh.team.domain.AuctionSoldVo;
import com.kh.team.domain.AuctionTempBidVo;
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
			//System.out.println("Controller 밖에 localFolderName:"+localFolderName);
			if(FurnitureFileUtil.chkDirecotry(localFolderName)) {//폴더가 없으면
				//System.out.println("Controller 안에 localFolderName-------:"+localFolderName);
				for(AuctionImgVo auctionImgVo : imgList) {
					
					String fileNamePath =auctionImgVo.getImg_name();
					int length = fileNamePath.length();
					int lastSlash = fileNamePath.lastIndexOf("/");
					String fileName = fileNamePath.substring(lastSlash+1, length);
					String folderName = Integer.toString(auctionImgVo.getP_no());
					
					if(localFolderName.equals(folderName)) {//폴더가 존재하지 않으면 s3접속 파일을 가지고 온다
						System.out.println("-----------------------controller에서 s3 접속 --------------------------------------");
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
		
		if(memberVo == null) {
			rttr.addFlashAttribute("msg", "loginFail");
			return "redirect:/auction/auctionMain";
		}
		String m_id = memberVo.getM_id();
		
		int[] nDate = getNowDate();
		int[] nTime = getNowTime();
		
		AuctionDateAndTimeVo dtVo = new AuctionDateAndTimeVo(nDate[0], nDate[1], nDate[2], nTime[0], nTime[1], nTime[2]);
		//System.out.println("nDate:"+nDate.toString()+" ,nTime:"+nTime.toString());
		
		//입찰중
		List<AuctionSellVo> bidingList = auctionService.getAuctionBidingList(m_id, dtVo);
		model.addAttribute("bidingList",bidingList);
		//System.out.println("bidingList:"+bidingList);
		//입찰 마감
		List<AuctionSellVo> bidingFinishList = auctionService.getAuctionBidingFinishList(m_id, dtVo);
		model.addAttribute("bidingFinishList",bidingFinishList);
		//System.out.println("bidingFinishList:"+bidingFinishList);
		//거래된
		List<AuctionSoldVo> soldList = auctionService.getAuctionUserMemberListSold(m_id);
		model.addAttribute("soldList",soldList);
		//내가 구매한 상품
		List<AuctionSoldVo> purchaserList = auctionService.getAuctionPurchaserList(m_id);
		model.addAttribute("purchaserList", purchaserList);
		
		//폴더 이름을 p_no로 만들고 이미지를 저장하기 위해서 다음 p_no를 가지고 온다
		int nextSeq = auctionService.getNextSeqNumber();
		//System.out.println("auctionResisterList nextSeq:"+nextSeq);
		model.addAttribute("nextPNO", nextSeq);

		return "auction/auctionResisterList";
	}
	
	@RequestMapping(value="/auctionSelected", method=RequestMethod.GET)
	public String auctionSelected(int p_no, Model model) throws Exception{
		//System.out.println("pno:"+p_no);
		
		AuctionSellVo selectedItem = auctionService.getAuctionSelectedItem(p_no);
		List<AuctionImgVo> selectedImg = auctionService.getAuctionSelectedImg(p_no);
		List<AuctionTempBidVo> tempBidList = auctionService.getAuctionTempBid(p_no);
		int bidCount = auctionService.getAuctionCountBid(p_no);
		
		int tempBidMaxPrice = auctionService.getAuctionTempBidMaxPrice(p_no);
		int presentPrice = selectedItem.getPresent_price();
		
		if(presentPrice>tempBidMaxPrice) {
			model.addAttribute("maxPrice", presentPrice);
		}else {
			model.addAttribute("maxPrice", tempBidMaxPrice);
		}
		
		model.addAttribute("selectedItem", selectedItem);
		model.addAttribute("selectedImg", selectedImg);
		model.addAttribute("tempBidList", tempBidList);
		model.addAttribute("bidCount", bidCount);
		
		return "auction/auctionSelected";
	}
	
	@RequestMapping(value="/timeOverAutoCommit", method=RequestMethod.GET)
	public String timeOverAutoCommit(int p_no) throws Exception{
	
		//임시 입찰 테이블에 해당 p_no의 테이터가 있을 때만 실행
		AuctionTempBidVo auctionTempBidVo = auctionService.getTempBidFromMaxPrice(p_no);
		if(auctionTempBidVo != null) {
			//temp_bid에서 bid로 insert
			auctionService.insertAutoCommitBid(p_no);
			
			//구매자와 판매자 정보 업데이트 auction의 purchaser와 sold_price 업데이트
			String purchaser = auctionTempBidVo.getTemp_purchaser_id();
			String seller = auctionTempBidVo.getTemp_seller_id();
			int sold_price = auctionTempBidVo.getTemp_bid_price();
			
			auctionService.updateAuctionAfterFinish(purchaser, sold_price, p_no, seller);
			
			//expiration테이블에 마감기한 N로 업데이트
			auctionService.updateAuctionExpriationDeadline(p_no);
		}
		return "redirect:/auction/auctionMain";
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
		
		//int second = (int)((Math.random()*58)+1);
		int[] nDate = getNowDate();
		int[] nTime = getNowTime();
		AuctionRDateVo auctionRDateVo = new AuctionRDateVo(nDate[0], nDate[1], nDate[2], nTime[0], nTime[1], nTime[2], nextPNO);
		
		//auctionVo -> auctionAddressVo -> auctionRDateVo -> auctionEDateVo -> auctionMainImgVo -> auctionImgVo
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

	//오늘 날짜
	private int[] getNowDate() {
		SimpleDateFormat nowDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String nowDate = nowDateFormat.format(date);
		//System.out.println("nowDate:"+nowDate);
		String[] nowDateArray = nowDate.split("-");
		int[] nowDateArrayInt = stringArrayTointArray(nowDateArray);
		
		return nowDateArrayInt;
	}

	//오늘 시간
	private int[] getNowTime() {
		SimpleDateFormat nowTimeFormat = new SimpleDateFormat("HH:mm:ss");
		Date date = new Date();
		String nowTime = nowTimeFormat.format(date);
		String[] nowTimeArray = nowTime.split(":");
		//System.out.println("nowTime:"+nowTime);
		int[] nowTimeArrayInt = stringArrayTointArray(nowTimeArray);
		
		return nowTimeArrayInt;
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
	
	@RequestMapping(value="/insertAuctionTempBid", method=RequestMethod.GET)
	public String insertAcutionTempBid(int p_no, String seller, int bidPrice, int remindMinute, HttpSession session) throws Exception{
		//System.out.println("p_no:"+p_no+" ,seller:"+seller);
		String purchaser = ((MemberVo)session.getAttribute("memberVo")).getM_id();

		//입찰한 가격 입력
		auctionService.insertAuctionTempBid(purchaser, seller, bidPrice, p_no);
		
		//시간 2분 추가하기
		Calendar cal = Calendar.getInstance();
		cal.set(2021,0,1); //0이면1월, 1이면 2월, ...
		int monthEnd = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		AuctionEDateVo auctionEDateVo = auctionService.getAuctionExpirationDate(p_no);
		int year = auctionEDateVo.getE_year();
		int month = auctionEDateVo.getE_month();
		int day = auctionEDateVo.getE_day();
		int hour = auctionEDateVo.getE_hour();
		int minute = auctionEDateVo.getE_minute();

		//남은시간이 5분 이하일 때 입찰하면 2분 추가
		int period = 2;
		if(remindMinute<=5) {
			if(minute+period < 60) {
				minute = minute+period;
			}else {
				if(hour+1 <= 23) {
					hour++;
					minute = (minute+period)-60;
				}else {
					if(day+1 <= monthEnd) {
						day++;
						hour = 0;//시간은 23시 다음 바로 00시가 된다
						minute = (minute+period)-60;
					}else {
						if(month+1 <= 12) {
							month++;
							day = 1;
							hour = 0;
							minute = (minute+period)-60;
						}else {
							year++;
							month = 1;
							day = 1;
							hour = 0;
							minute = (minute+period)-60;
						}
					}
				}
			}
		}
		
		//System.out.println("year:"+year+" ,month:"+month+" ,day:"+day+" ,hour:"+hour+" ,minute:"+minute);
		auctionEDateVo.setE_year(year);
		auctionEDateVo.setE_month(month);
		auctionEDateVo.setE_day(day);
		auctionEDateVo.setE_hour(hour);
		auctionEDateVo.setE_minute(minute);
		auctionService.updateAuctionEDate(auctionEDateVo);
		
		return "redirect:/auction/auctionSelected?p_no="+p_no;
	}
	
	@RequestMapping(value="/auctionPurchaseSelectecd", method=RequestMethod.GET)
	public String auctionPurchaseSelectecd(int price, Model model) throws Exception{
		
		model.addAttribute("price", price);
		
		return "auction/auctionPurchaseSelectecd";
	}
	
	@RequestMapping(value="/auctionModify", method=RequestMethod.GET)
	public String auctionModify(int p_no, Model model) throws Exception{
		
		AuctionSellVo auctionSellVo = auctionService.getAuctionModifyList(p_no);
		model.addAttribute("auctionSellVo",auctionSellVo);
		System.out.println("AuctionController auctionSellVo:"+auctionService.toString());
		return "auction/auctionModify";
	}
}
