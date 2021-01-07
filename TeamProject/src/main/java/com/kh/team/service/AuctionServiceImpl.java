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
import com.kh.team.controller.AuctionS3Key;
import com.kh.team.dao.AuctionDao;
import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.AuctionSellVo;
import com.kh.team.domain.AuctionSoldVo;
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
		
		//credential과 client객체 생성
		AWSCredentials credential = new BasicAWSCredentials(accesskey, secretkey);
		AmazonS3 s3Client = AmazonS3ClientBuilder
				.standard()
				.withCredentials(new AWSStaticCredentialsProvider(credential))
				.withRegion(Regions.AP_NORTHEAST_2)
				.build();
		
		String folderName = Integer.toString(auctionImgVo.getP_no());
		
		String[] images = auctionImgVo.getImages();
		if(images != null) {
			System.out.println("-----------------------AuctionServiceImpl s3 접속 --------------------------------------");
			for(int i=0 ; i<images.length ; i++) {
	
				//images[i]에는 경로가 포함되어있으니깐 이름만 추출한다
				String fileNamePath = images[i];
				int length = fileNamePath.length();
				int lastSlash = fileNamePath.lastIndexOf("/");
				String fileName = fileNamePath.substring(lastSlash+1, length);
				String filePath = "C:/Temp/auctionImg/"+folderName+"/"+fileName;//저장할 파일 위치
				
				String bucketName = "sdk-new-bucket"; //버킷(디렉토리) 이름
				String bucketKey = folderName+ "/" +fileName; //버킷안에 저장 될 폴더와 파일이름
				//System.out.println("service insertAuctionImg bucketkey:"+bucketKey);
				s3Client.putObject(bucketName,bucketKey,new File(filePath));
			
				auctionImgVo.setImg_name(images[i]);
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
	public List<AuctionSellVo> getAuctionUserMemberListSell(String m_id) throws Exception {
		List<AuctionSellVo> list = auctionDao.getAuctionUserMemberListSell(m_id);
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
	public void deleteAuction_bid_date(int p_no) throws Exception {
		auctionDao.deleteAuction_bid_date(p_no);
	}
	@Override
	public void deleteAuction_bid(int p_no) throws Exception {
		auctionDao.deleteAuction_bid(p_no);
		
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
		auctionDao.deleteAuction_bid_date(p_no);
		auctionDao.deleteAuction_bid(p_no);
		auctionDao.deleteAuction_address(p_no);
		auctionDao.deleteAuction_expration_date(p_no);
		auctionDao.deleteAuction_register_date(p_no);
		auctionDao.deleteAuction_sold_date(p_no);
		auctionDao.deleteAuction_img(p_no);
		auctionDao.deleteAuction_main_img(p_no);
		auctionDao.deleteAuction(p_no);
	}
}
