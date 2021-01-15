package com.kh.team.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
public class AuctionController implements AuctionS3Key, ImPortKey {

	@Inject
	private AuctionService auctionService;
	
	@RequestMapping(value="/auctionMain", method=RequestMethod.GET)
	public String getAuctoionMainList(Model model) throws Exception{
		
		//최근 날짜의 목록에 따라 메인 이미지만
		List<AuctionSellVo> list = auctionService.getAuctoionMainList();
		//System.out.println("auctionController getAuctionList list:"+list);
		model.addAttribute("list", list);
		
		makeImgDirectoryAfterCheck();
		
		return "auction/auctionMain";
	}
	
	/*이미지 -> 
	 * 메인 : 가지고 올 때만 폴더 항목으로 검색
	 * 등록 : p_no로 폴더를 만들고 파일당 루프를 돌면서 삽입
	 * 수정 : 파일당 폴더와 s3를 찾아가서 지우고 등록
	 * 
	 * 메인에서만 이미지를 불러오게 되면 낙찰을 받아서 메인에 없는 상태에서 
	 * 다른 컴퓨터에서 낙찰받은 이미지를 불러오면 에러발생 이미지를 불러오는 폼에선 전부 디렉토리 검사
	 * 
	 * getAuctoionMainList - 메인
	 * auctionSelected - 입찰중인 상품 클릭해서 들어갔을 때
	 * auctionPurchaseSelectecd - 내 상품팔기로 들어갔을 때
	 * auctionModify - 수정시
	 * */
	private void makeImgDirectoryAfterCheck() throws Exception{
		/* 시작 할 때 s3에 있는 이미지를 다운 받는다 */
		
		//이미지 리스트를 가져온다
		List<AuctionImgVo> imgList = auctionService.getAuctionImg();
		AuctionFileS3Controll fs3;
		
		for(AuctionImgVo localAuctionImgVo : imgList) {//로컬에 없는 폴더를 먼저 고른다
			String localFolderName = Integer.toString(localAuctionImgVo.getP_no());

			if(FurnitureFileUtil.chkDirecotry(localFolderName)) {//폴더가 없으면
				//System.out.println("Controller 안에 localFolderName-------:"+localFolderName);
				for(AuctionImgVo auctionImgVo : imgList) {
					
					String filePathName =auctionImgVo.getImg_name();
					String[] filePathNameArray = filePathName.split("/");
					String folderName = filePathNameArray[3];
					String fileName = filePathNameArray[4];
					/*
					filePathNameArray[0]:C:
					filePathNameArray[1]:Temp
					filePathNameArray[2]:auctionImg
					filePathNameArray[3]:15
					filePathNameArray[4]:2_5b68f941-1b63-486e-be6e-a19f119bab0b.jpg
					*/
					if(localFolderName.equals(folderName)) {//폴더가 존재하지 않으면 s3접속 파일을 가지고 온다
						
						System.out.println("-------------------------- AuctionController getAuctoionMainList에서 s3에 접속 --------------------------");
					
						fs3 = new AuctionFileS3Controll(filePathName, 0);
						fs3.fileS3Controll();					
					}//if끝
				}//for끝
			}//if끝 
		}//for끝
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
		makeImgDirectoryAfterCheck();
		
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
	
	//삭제 버튼을 눌렀을 때
	@RequestMapping(value="/auctionDelete", method=RequestMethod.GET)
	public String auctionDelete(int p_no) throws Exception{
		//System.out.println("seller:"+seller);
		
		//DB삭제
		auctionService.deleteAcutionAll(p_no);
		
		//local 폴더 삭제
		String folderName = Integer.toString(32);
		FurnitureFileUtil.deleteFolder(folderName);
		
		//s3 폴더 삭제 
		return "redirect:/auction/auctionResisterList";
	}
	
	//이미지에서 x를 눌렀을 때 실시간으로 바로바로 이미지를 삭제한다
	//수정버튼을 눌렀을 땐 이미지에 대한 다른 처리는 안 한다
	@RequestMapping(value="/ModifyDelImg", method=RequestMethod.GET)
	@ResponseBody
	public String ModifyDelImg(String filePathName, int p_no) throws Exception{
		System.out.println("ModifyDelImg filePathName:"+filePathName+" ,p_no:"+p_no);
		
		/*한꺼번에
		DB에서 파일 삭제
		폴더에서 파일 삭제
		S3에서 파일 삭제*/
		
		//DB에서 파일 삭제
		auctionService.modifyAuction_imgDel(filePathName, p_no);		
		
		//폴더에서 파일 삭제
		FurnitureFileUtil.deleteImage(filePathName);
		
		//S3에서 파일 삭제
		AuctionFileS3Controll fs3 = new AuctionFileS3Controll(filePathName, 2);
		fs3.fileS3Controll();
				
		return "success";
	}
	
	//수정에서 이미지 드로그드롭으로 추가시
	@RequestMapping(value="/ModifyAddImg/{p_no}", method=RequestMethod.POST)
	@ResponseBody
	public String ModifyAddImg(MultipartFile file, @PathVariable("p_no") int p_no) throws Exception{
		//System.out.println("ModifyAddImg file:"+file+" ,p_no:"+p_no);

		/*한꺼번에
		DB에 파일 삽입
		폴더에서 파일 삽입
		S3에서 파일 삽입*/
		
		String filePathName = null;
		String fileName = file.getOriginalFilename();//fileName:5.jpg 파일이름과 확장자만
		//System.out.println("filePathName:"+fileName);
		boolean result = FurnitureFileUtil.checkImage(fileName);
		String returnFileResult = "false";

		if(result) {//이미지 파일인지 아닌지 먼저 체크
			
			//폴더에 파일 삽입
			filePathName = FurnitureFileUtil.uploadFile(file, String.valueOf(p_no));
			returnFileResult = filePathName;
			
			//DB에 파일 삽입
			auctionService.modifyAuction_imgInsert(filePathName, p_no);
			
			//S3에 파일 삽입
			AuctionFileS3Controll fs3 = new AuctionFileS3Controll(filePathName, 1);
			fs3.fileS3Controll();
		}
		return returnFileResult;		
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
	
	@RequestMapping(value="/auctionPurchaseSelected/{p_no}", method=RequestMethod.GET)
	public String auctionPurchaseSelectecd(@PathVariable("p_no") int p_no, Model model, HttpSession session) throws Exception{
		
		System.out.println("p_no:"+p_no);
		/*
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");

		if(memberVo != null) {
			//내가 구매한 상품
			List<AuctionSoldVo> purchaserList = auctionService.getAuctionPurchaserList(memberVo.getM_id());
			model.addAttribute("purchaserList", purchaserList);
			
			makeImgDirectoryAfterCheck();
			model.addAttribute("ImPortkey", ImPortkey);
			
			model.addAttribute("purchaserMemberVo", memberVo);
		}
		*/
		return "auction/auctionPurchaseSelected";
	}
	
	@RequestMapping(value="/auctionModify", method=RequestMethod.GET)
	public String auctionModify(int p_no, Model model) throws Exception{
		
		makeImgDirectoryAfterCheck();
		
		AuctionSellVo auctionSellVo = auctionService.getAuctionModifyList(p_no);
		model.addAttribute("auctionSellVo",auctionSellVo);
		
		List<String> imgModify = auctionService.getAuctionImgModify(p_no);
		model.addAttribute("imgModify", imgModify);
		//System.out.println("imgModify:"+imgModify);
		//System.out.println("AuctionController auctionSellVo:"+auctionService.toString());
		return "auction/auctionModify";
	}

	@RequestMapping(value="/auctionModifyRun", method=RequestMethod.GET)
	public String auctionModifyRun(AuctionVo auctionVo, AuctionAddressVo auctionAddressVo,
			AuctionEDateVo auctionEDateVo, AuctionMainImgVo auctionMainImgVo) throws Exception{
		
		/*이미지 파일들은 x버튼을 누르고 드래그 드롭했을 때 바로바로 삭제, 추가한다 여기선 따로 처리없고 메인 이미지 값만 업데이트한다
		 * 메인 이미지로 선택한 건 이미 로컬과 s3에 다 들어있다  메인으로 설정만 하는 것 뿐 */
		 
		/*
		System.out.println("AuctionController auctionModifyRun에서 "
				+ "auctionVo:" + auctionVo
				+ "auctionAddressVo" + auctionAddressVo
				+ "auctionEDateVo:" + auctionEDateVo
				+ "auctionMainImgVo:" + auctionMainImgVo);*/

		auctionService.modifyAuctoin(auctionVo);
		auctionService.modifyAuctionAddress(auctionAddressVo);
		auctionService.modifyAuctionMainImg(auctionMainImgVo);
		auctionService.modifyAuctionExpirationDate(auctionEDateVo);
		
		return "redirect:/auction/auctionResisterList";
	}
}
