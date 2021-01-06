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

@Service
public class AuctionServiceImpl implements AuctionService {

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
		/*
		//s3시작
		String accesskey = "AKIAU25L6TN2RP3O5CLB";
		String secretkey = " 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";
		
		//credential과 client객체 생성
		AWSCredentials credential = new BasicAWSCredentials(accesskey, secretkey);
		AmazonS3 s3Client = AmazonS3ClientBuilder
				.standard()
				.withCredentials(new AWSStaticCredentialsProvider(credential))
				.withRegion(Regions.AP_NORTHEAST_2)
				.build();
		//버킷 생성
		//s3Client.createBucket("sdk-new-bucket");
		
		//파일 업로드
		String folderName = Integer.toString(auctionMainImgVo.getP_no());
		
		//getMain_img_name()에는 경로가 포함되어있으니깐 이름만 추출한다
		String fileNamePath = auctionMainImgVo.getMain_img_name();
		int length = fileNamePath.length();
		int lastSlash = fileNamePath.lastIndexOf("/");
		String fileName = fileNamePath.substring(lastSlash+1, length);
		//System.out.println("Service insertAuctionMainImg fileName:"+fileName);
		String filePath = "C:/Temp/auctionImg/"+folderName+"/"+fileName;//저장할 파일 위치
		//System.out.println("Service insertAuctionMainImg filePath:"+filePath);
		String bucketName = "sdk-new-bucket"; //버킷 이름
		String bucketKey = folderName+"/"+fileName; //버킷에 폴더에 파일 이름, 아마존에 저장 할 땐 main폴더에
		//System.out.println("Service insertAuctionMainImg bucketKey:"+bucketKey);
		
		s3Client.putObject(bucketName,bucketKey,new File(filePath));
		*/
		auctionDao.insertAuctionMainImg(auctionMainImgVo);
	}
	
	@Override
	@Transactional
	public void insertAuctionImg(AuctionImgVo auctionImgVo) throws Exception {
		
		//s3시작
		String accesskey = "AKIAU25L6TN2RP3O5CLB";
		String secretkey = " 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";
		
		//credential과 client객체 생성
		AWSCredentials credential = new BasicAWSCredentials(accesskey, secretkey);
		AmazonS3 s3Client = AmazonS3ClientBuilder
				.standard()
				.withCredentials(new AWSStaticCredentialsProvider(credential))
				.withRegion(Regions.AP_NORTHEAST_2)
				.build();
		
		String folderName = Integer.toString(auctionImgVo.getP_no());
		
		String[] images = auctionImgVo.getImages();
		for(int i=0 ; i<images.length ; i++) {

			//images[i]에는 경로가 포함되어있으니깐 이름만 추출한다
			String fileNamePath = images[i];
			int length = fileNamePath.length();
			int lastSlash = fileNamePath.lastIndexOf("/");
			String fileName = fileNamePath.substring(lastSlash+1, length);
			String filePath = "C:/Temp/auctionImg/"+folderName+"/"+fileName;//저장할 파일 위치
			
			String bucketName = "sdk-new-bucket"; //버킷(디렉토리) 이름
			String bucketKey = folderName+ "/" +fileName; //버킷안에 저장 될 폴더와 파일이름
			System.out.println("service insertAuctionImg bucketkey:"+bucketKey);
			s3Client.putObject(bucketName,bucketKey,new File(filePath));
		
			auctionImgVo.setImg_name(images[i]);
			auctionDao.insertAuctionImg(auctionImgVo);
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

}
