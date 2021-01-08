package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.AuctionBidVo;
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

public interface AuctionDao {

	//main에서 보여주는 최근파일과 메인 이미지
	public List<AuctionSellVo> getAuctoionMainList() throws Exception;

	//main이미지 가져오기
	public List<AuctionMainImgVo> getAuctionMainImg() throws Exception;
	//모든 이미지 가죠오기
	public List<AuctionImgVo> getAuctionImg() throws Exception;
	
	//현재 판매 상품
	public List<AuctionSellVo> getAuctionUserMemberListSell(String m_id) throws Exception;
	//거래된 상품
	public List<AuctionSoldVo> getAuctionUserMemberListSold(String m_id) throws Exception;
	
	//seq_auction_pno 현재값 받아서 상품 등록시 폴더명으로 사용
	public int getNextSeqNumber() throws Exception;
	
	public AuctionSellVo getAuctionSelectedItem(int p_no) throws Exception;
	public List<AuctionImgVo> getAuctionSelectedImg(int p_no) throws Exception;
	
	//임시 입찰 가져오기
	public List<AuctionTempBidVo> getAuctionTempBid(int p_no) throws Exception;
	//입찰 가져오기
	public AuctionBidVo getAuctionBid(int p_no) throws Exception;
	//임시 입찰에서 제일 큰수
	public int getAuctionTempBidMaxPrice(int p_no) throws Exception;
	//입찰자 수
	public int getAuctionCountBid(int p_no) throws Exception;
	//입찰 현황 입력
	public void insertAuctionTempBid(String purchaser, String seller, int bidPrice, int p_no) throws Exception;
	
	//종료일 가져오기
	public AuctionEDateVo getAuctionExpirationDate(int p_no) throws Exception;
	
	public void insertAuction(AuctionVo auctionVo) throws Exception;
	public void insertAuctionAddress(AuctionAddressVo auctionAddressVo) throws Exception;
	public void insertAuctionRegisterDate(AuctionRDateVo auctionRDateVo) throws Exception;
	public void insertAuctionExpirationDate(AuctionEDateVo auctionEDateVo) throws Exception;
	public void insertAuctionSoldDate(AuctionSDateVo auctionSDateVo) throws Exception;
	public void insertAuctionMainImg(AuctionMainImgVo auctionMainImgVo) throws Exception;
	public void insertAuctionImg(AuctionImgVo auctionImgVo) throws Exception;
	
	public MemberVo AuctionLogin(String m_id, String m_pass) throws Exception;
	
	public void deleteAuction_temp_bid(int p_no) throws Exception;
	public void deleteAuction_bid(int p_no) throws Exception;
	public void deleteAuction_address(int p_no) throws Exception;
	public void deleteAuction_expration_date(int p_no) throws Exception;
	public void deleteAuction_img(int p_no) throws Exception;
	public void deleteAuction_main_img(int p_no) throws Exception;
	public void deleteAuction_register_date(int p_no) throws Exception;
	public void deleteAuction_sold_date(int p_no) throws Exception;
	public void deleteAuction(int p_no) throws Exception;
	
}
