package com.kh.team;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.AuctionDao;
import com.kh.team.domain.AuctionSellVo;
import com.kh.team.domain.AuctionDateAndTimeVo;
import com.kh.team.domain.AuctionImgVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class AuctionDaoTest {

	@Inject
	private AuctionDao auctionDao;
	
	@Test
	public void getAuctoionMainListTest() throws Exception {
		List<AuctionSellVo> list = auctionDao.getAuctoionMainList();
	}
	
	@Test
	public void insertAuctionImg() throws Exception{
		AuctionImgVo auctionImgVo = new AuctionImgVo();
		auctionImgVo.setImg_name("image name");
		auctionDao.insertAuctionImg(auctionImgVo);
	}
	
	@Test
	public void getAuctionBidingList() throws Exception{
		int[] nDate = getNowDate();
		int[] nTime = getNowTime();
		
		AuctionDateAndTimeVo dtVo = new AuctionDateAndTimeVo(nDate[0], nDate[1], nDate[2], nTime[0], nTime[1], nTime[2]);
		
		List<AuctionSellVo> list =auctionDao.getAuctionBidingList("user03", dtVo);
		System.out.println(list);
	}
	
	@Test
	public void getAuctionBidingFinishList() throws Exception {
		int[] nDate = getNowDate();
		int[] nTime = getNowTime();
		
		AuctionDateAndTimeVo dtVo = new AuctionDateAndTimeVo(nDate[0], nDate[1], nDate[2], nTime[0], nTime[1], nTime[2]);
		
		List<AuctionSellVo> list = auctionDao.getAuctionBidingFinishList("user03", dtVo);
		System.out.println("auctioinDaoImpl BidingFinishlist:"+list);
	}
	
	//오늘 날짜
	private int[] getNowDate() {
		SimpleDateFormat nowDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String nowDate = nowDateFormat.format(date);
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
}
