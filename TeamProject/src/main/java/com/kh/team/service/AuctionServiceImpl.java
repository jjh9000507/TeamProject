package com.kh.team.service;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.kh.team.controller.AuctionFileS3Controll;
import com.kh.team.controller.AuctionS3Key;
import com.kh.team.dao.AuctionDao;
import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.AuctionBidVo;
import com.kh.team.domain.AuctionDateAndTimeVo;
import com.kh.team.domain.AuctionSellVo;
import com.kh.team.domain.AuctionSoldVo;
import com.kh.team.domain.AuctionTempBidVo;
import com.kh.team.domain.AuctionEDateVo;
import com.kh.team.domain.AuctionImgVo;
import com.kh.team.domain.AuctionMainImgVo;
import com.kh.team.domain.AuctionRDateVo;
import com.kh.team.domain.AuctionSDateVo;
import com.kh.team.domain.AuctionVo;
import com.kh.team.domain.MemberVo;

@Service
public class AuctionServiceImpl implements AuctionService,AuctionS3Key {

	@Inject
	private AuctionDao auctionDao;
	
	@Override
	public List<AuctionSellVo> getAuctoionMainList() throws Exception {
		List<AuctionSellVo> list = auctionDao.getAuctoionMainList();
		
		return list;
	}

	@Override
	public int getNextSeqNumber() throws Exception {
		int currentSeq = auctionDao.getNextSeqNumber();
		return currentSeq;
	}

	@Override
	public void insertAuction(AuctionVo auctionVo) throws Exception {
		auctionDao.insertAuction(auctionVo);
	}

	@Override
	public void insertAuctionAddress(AuctionAddressVo auctionAddressVo) throws Exception {
		auctionDao.insertAuctionAddress(auctionAddressVo);
		
	}

	@Override
	public void insertAuctionRegisterDate(AuctionRDateVo auctionRDateVo) throws Exception {
		auctionDao.insertAuctionRegisterDate(auctionRDateVo);
	}

	@Override
	public void insertAuctionExpirationDate(AuctionEDateVo auctionEDateVo) throws Exception {
		auctionDao.insertAuctionExpirationDate(auctionEDateVo);
	}

	@Override
	public void insertAuctionSoldDate(AuctionSDateVo auctionSDateVo) throws Exception {
		auctionDao.insertAuctionSoldDate(auctionSDateVo);
	}

	@Override
	public void insertAuctionMainImg(AuctionMainImgVo auctionMainImgVo) throws Exception {
		auctionDao.insertAuctionMainImg(auctionMainImgVo);
	}
	
	@Override
	@Transactional
	public void insertAuctionImg(AuctionImgVo auctionImgVo) throws Exception {
		
		String[] images = auctionImgVo.getImages();
		AuctionFileS3Controll fs3;
		
		if(images != null) {
			for(int i=0 ; i<images.length ; i++) {
				System.out.println("-----------------------AuctionServiceImpl에서 s3 접속 --------------------------------------");
				String filePathName = images[i];
				fs3 = new AuctionFileS3Controll(filePathName, 1);
				fs3.fileS3Controll();
				
				auctionImgVo.setImg_name(filePathName);
				System.out.println("AuctionService images["+i+"]:"+images[i]);
				auctionDao.insertAuctionImg(auctionImgVo);
			}
		}
	}

	@Override
	public List<AuctionMainImgVo> getAuctionMainImg() throws Exception {
		List<AuctionMainImgVo> list = auctionDao.getAuctionMainImg();
		return list;
	}

	@Override
	public List<AuctionImgVo> getAuctionImg() throws Exception {
		List<AuctionImgVo> list = auctionDao.getAuctionImg();
		return list;
	}

	@Override
	public List<AuctionSellVo> getAuctionBidingList(String m_id, AuctionDateAndTimeVo auctionDandTVo) throws Exception {
		List<AuctionSellVo> list = auctionDao.getAuctionBidingList(m_id, auctionDandTVo);
		return list;
	}

	@Override
	public List<AuctionSellVo> getAuctionBidingFinishList(String m_id, AuctionDateAndTimeVo auctionDandTVo)
			throws Exception {
		List<AuctionSellVo> list = auctionDao.getAuctionBidingFinishList(m_id, auctionDandTVo);
		return list;
	}
	
	@Override
	public List<AuctionSoldVo> getAuctionUserMemberListSold(String m_id) throws Exception {
		List<AuctionSoldVo> list = auctionDao.getAuctionUserMemberListSold(m_id);
		return list;
	}

	@Override
	public AuctionSellVo getAuctionSelectedItem(int p_no) throws Exception {
		AuctionSellVo list = auctionDao.getAuctionSelectedItem(p_no);
		return list;
	}

	@Override
	public List<AuctionImgVo> getAuctionSelectedImg(int p_no) throws Exception {
		List<AuctionImgVo> list = auctionDao.getAuctionSelectedImg(p_no);
		return list;
	}

	@Override
	public MemberVo AuctionLogin(String m_id, String m_pass) throws Exception {
		MemberVo memberVo = auctionDao.AuctionLogin(m_id, m_pass);
		return memberVo;
	}
	
	//-------------- delete --------------------------------------//	
	
	@Override
	public void deleteAuction_bid(int p_no) throws Exception {
		auctionDao.deleteAuction_bid(p_no);
		
	}
	@Override
	public void deleteAuction_temp_bid(int p_no) throws Exception {
		auctionDao.deleteAuction_temp_bid(p_no);
		
	}
	@Override
	public void deleteAuction_address(int p_no) throws Exception {
		auctionDao.deleteAuction_address(p_no);
	}
	@Override
	public void deleteAuction_expration_date(int p_no) throws Exception {
		auctionDao.deleteAuction_expration_date(p_no);
	}
	@Override
	public void deleteAuction_img(int p_no) throws Exception {
		auctionDao.deleteAuction_img(p_no);
	}
	@Override
	public void deleteAuction_main_img(int p_no) throws Exception {
		auctionDao.deleteAuction_main_img(p_no);
	}
	@Override
	public void deleteAuction_register_date(int p_no) throws Exception {
		auctionDao.deleteAuction_register_date(p_no);
	}
	@Override
	public void deleteAuction_sold_date(int p_no) throws Exception {
		auctionDao.deleteAuction_sold_date(p_no);
	}
	@Override
	public void deleteAuction(int p_no) throws Exception {
		auctionDao.deleteAuction(p_no);
	}
	//----------------------- delete --------------------------------------//

	@Override
	@Transactional
	public void deleteAcutionAll(int p_no) throws Exception {
		auctionDao.deleteAuction_temp_bid(p_no);
		auctionDao.deleteAuction_bid(p_no);
		auctionDao.deleteAuction_address(p_no);
		auctionDao.deleteAuction_expration_date(p_no);
		auctionDao.deleteAuction_register_date(p_no);
		auctionDao.deleteAuction_sold_date(p_no);
		auctionDao.deleteAuction_img(p_no);
		auctionDao.deleteAuction_main_img(p_no);
		auctionDao.deleteAuction(p_no);
	}

	@Override
	public List<AuctionTempBidVo> getAuctionTempBid(int p_no) throws Exception {
		List<AuctionTempBidVo> auctionTempBidVo = auctionDao.getAuctionTempBid(p_no);
		return auctionTempBidVo;
	}

	@Override
	public AuctionBidVo getAuctionBid(int p_no) throws Exception {
		AuctionBidVo auctionBidVo = auctionDao.getAuctionBid(p_no);
		return auctionBidVo;
	}

	@Override
	public int getAuctionTempBidMaxPrice(int p_no) throws Exception {
		int tempBidMax = auctionDao.getAuctionTempBidMaxPrice(p_no);
		return tempBidMax;
	}

	@Override
	public int getAuctionCountBid(int p_no) throws Exception {
		int count = auctionDao.getAuctionCountBid(p_no);
		return count;
	}

	@Override
	public void insertAuctionTempBid(String purchaser, String seller, int bidPrice, int p_no) throws Exception {
		auctionDao.insertAuctionTempBid(purchaser, seller, bidPrice, p_no);
	}

	@Override
	public AuctionEDateVo getAuctionExpirationDate(int p_no) throws Exception {
		AuctionEDateVo auctionEdateVo = auctionDao.getAuctionExpirationDate(p_no);
		return auctionEdateVo;
	}

	@Override
	public void updateAuctionEDate(AuctionEDateVo auctionEDateVo) throws Exception {
		auctionDao.updateAuctionEDate(auctionEDateVo);
	}

	@Override
	public AuctionTempBidVo getTempBidFromMaxPrice(int p_no) throws Exception {
		AuctionTempBidVo auctionTempBidVo = auctionDao.getTempBidFromMaxPrice(p_no);
		return auctionTempBidVo;
	}

	@Override
	public void insertAutoCommitBid(int p_no) throws Exception {
		auctionDao.insertAutoCommitBid(p_no);
		
	}

	@Override
	public void updateAuctionAfterFinish(String purchaser, int sold_price, int p_no, String seller) throws Exception {
		auctionDao.updateAuctionAfterFinish(purchaser, sold_price, p_no, seller);
	}

	@Override
	public List<AuctionSoldVo> getAuctionPurchaserList(String m_id) throws Exception {
		List<AuctionSoldVo> list = auctionDao.getAuctionPurchaserList(m_id);
		return list;
	}

	@Override
	public void updateAuctionExpriationDeadline(int p_no) throws Exception {
		auctionDao.updateAuctionExpriationDeadline(p_no);
	}

	@Override
	public AuctionSellVo getAuctionModifyList(int p_no) throws Exception {
		AuctionSellVo auctionSellVo = auctionDao.getAuctionModifyList(p_no);
		return auctionSellVo;
	}

	@Override
	public List<String> getAuctionImgModify(int p_no) throws Exception {
		List<String> auctionImgVo = auctionDao.getAuctionImgModify(p_no);
		return auctionImgVo;
	}

	@Override
	public void modifyAuction_imgDel(String fileAllName, int p_no) throws Exception {
		auctionDao.modifyAuction_imgDel(fileAllName, p_no);
	}

	@Override
	public void modifyAuction_imgInsert(String fileAllName, int p_no) throws Exception {
		auctionDao.modifyAuction_imgInsert(fileAllName, p_no);		
	}
}
