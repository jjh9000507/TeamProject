package com.kh.team.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.AuctionSellVo;
import com.kh.team.domain.AuctionSoldVo;
import com.kh.team.domain.AuctionEDateVo;
import com.kh.team.domain.AuctionImgVo;
import com.kh.team.domain.AuctionMainImgVo;
import com.kh.team.domain.AuctionRDateVo;
import com.kh.team.domain.AuctionSDateVo;
import com.kh.team.domain.AuctionVo;

@Repository
public class AuctionDaoImpl implements AuctionDao{

	private static final String NAMESPACE="com.kh.team.auction.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<AuctionSellVo> getAuctoionMainList() throws Exception {
		List<AuctionSellVo> list = sqlSession.selectList(NAMESPACE+"getAuctoionMainList");
		return list;
	}
	
	@Override
	public List<AuctionMainImgVo> getAuctionMainImg() throws Exception {
		List<AuctionMainImgVo> list = sqlSession.selectList(NAMESPACE + "getAuctionMainImg");
		return list;
	}

	@Override
	public List<AuctionImgVo> getAuctionImg() throws Exception {
		List<AuctionImgVo> list = sqlSession.selectList(NAMESPACE + "getAuctionImg");
		return list;
	}
	
	@Override
	public int getNextSeqNumber() throws Exception {
		int currentSeq = sqlSession.selectOne(NAMESPACE + "getNextSeqNumber");
		return currentSeq;
	}

	@Override
	public void insertAuction(AuctionVo auctionVo) throws Exception {
		sqlSession.insert(NAMESPACE+"insertAuction", auctionVo);
	}

	@Override
	public void insertAuctionAddress(AuctionAddressVo auctionAddressVo) throws Exception {
		System.out.println("DaoImpl auctionAddressVo:"+auctionAddressVo);
		sqlSession.insert(NAMESPACE+"insertAuctionAddress", auctionAddressVo);
	}

	@Override
	public void insertAuctionRegisterDate(AuctionRDateVo auctionRDateVo) throws Exception {
		System.out.println("DaoImpl auctionRDateVo:"+auctionRDateVo);
		sqlSession.insert(NAMESPACE+"insertAuctionRegisterDate", auctionRDateVo);
	}

	@Override
	public void insertAuctionExpirationDate(AuctionEDateVo auctionEDateVo) throws Exception {
		System.out.println("DaoImpl auctionEDateVo:"+auctionEDateVo);
		sqlSession.insert(NAMESPACE+"insertAuctionExpirationDate", auctionEDateVo);
	}

	@Override
	public void insertAuctionSoldDate(AuctionSDateVo auctionSDateVo) throws Exception {
		System.out.println("DaoImpl auctionSDateVo:"+auctionSDateVo);
		sqlSession.insert(NAMESPACE+"insertAuctionSoldDate", auctionSDateVo);
	}

	@Override
	public void insertAuctionMainImg(AuctionMainImgVo auctionMainImgVo) throws Exception {
		sqlSession.insert(NAMESPACE+"insertAuctionMainImg", auctionMainImgVo);
	}
	
	@Override
	public void insertAuctionImg(AuctionImgVo auctionImgVo) throws Exception {
		System.out.println("DaoImpl auctionImgVo:"+auctionImgVo);
		sqlSession.insert(NAMESPACE+"insertAuctionImg", auctionImgVo);
	}

	@Override
	public List<AuctionSellVo> getAuctionUserMemberListSell(String m_id) throws Exception {
		List<AuctionSellVo> list = sqlSession.selectList(NAMESPACE+"getAuctionUserMemberListSell", m_id);
		return list;
	}

	@Override
	public List<AuctionSoldVo> getAuctionUserMemberListSold(String m_id) throws Exception {
		List<AuctionSoldVo> list = sqlSession.selectList(NAMESPACE+"getAuctionUserMemberListSold", m_id);
		return list;
	}
}
